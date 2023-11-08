import pytesseract
import cv2
import numpy as np
import grpc
from concurrent import futures
import antibiogram_ocr_pb2 as antibiogram_ocr_pb2
import antibiogram_ocr_pb2_grpc

class OCRServiceServicer(antibiogram_ocr_pb2_grpc.OCRServiceServicer):
    def PerformOCR(self, request, context):
        try:
            if not request.image_data:
                context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                context.set_details("La solicitud debe contener datos de imagen.")
                return antibiogram_ocr_pb2.OCRResponse()

            image = np.frombuffer(request.image_data, dtype=np.uint8)
            image = cv2.UMat(image)
            img = cv2.imdecode(image, cv2.IMREAD_COLOR)
            organized_img = organizePicture(img)
            
            img = cv2.cvtColor(organized_img, cv2.COLOR_BGR2GRAY)
            img = cv2.GaussianBlur(img, (3, 3), 0)
            extracted_text = pytesseract.image_to_string(img, lang="spa")
            response = antibiogram_ocr_pb2.OCRResponse(text=extracted_text, content_type="text/plain")

            return response

        except Exception as e:
            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details("Error al procesar la solicitud: " + str(e))
            return antibiogram_ocr_pb2.OCRResponse()


def order_points(pts):
    rect = np.zeros((4, 2), dtype='float32')
    pts = np.array(pts)
    s = pts.sum(axis=1)
    rect[0] = pts[np.argmin(s)]
    rect[2] = pts[np.argmax(s)]

    diff = np.diff(pts, axis=1)
    rect[1] = pts[np.argmin(diff)]
    rect[3] = pts[np.argmax(diff)]
    return rect.astype('int').tolist()

def organizePicture(img):
    image=img
    kernel = np.ones((5,5),np.uint8)
    img = cv2.morphologyEx(img, cv2.MORPH_CLOSE, kernel, iterations= 15)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray = cv2.GaussianBlur(gray, (11, 11), 0)
    canny = cv2.Canny(gray, 0, 200)
    canny = cv2.dilate(canny, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5)))
    
    con = np.zeros_like(img)
    contours, _ = cv2.findContours(canny, cv2.RETR_LIST, cv2.CHAIN_APPROX_NONE)
    page = sorted(contours, key=cv2.contourArea, reverse=True)[:5]
    con = cv2.drawContours(con, page, -1, (0, 255, 255), 3)

    con = np.zeros_like(img)
    for c in page:
        epsilon = 0.02 * cv2.arcLength(c, True)
        corners = cv2.approxPolyDP(c, epsilon, True)
        if len(corners) == 4:
            break
    cv2.drawContours(con, c, -1, (0, 255, 255), 3)
    cv2.drawContours(con, corners, -1, (0, 255, 0), 10)
    corners = sorted(np.concatenate(corners).tolist())
    newcor=order_points(corners)
    (tl, tr, br, bl) = newcor
    widthA = np.sqrt(((br[0] - bl[0]) ** 2) + ((br[1] - bl[1]) ** 2))
    widthB = np.sqrt(((tr[0] - tl[0]) ** 2) + ((tr[1] - tl[1]) ** 2))
    maxWidth = max(int(widthA), int(widthB))
    heightA = np.sqrt(((tr[0] - br[0]) ** 2) + ((tr[1] - br[1]) ** 2))
    heightB = np.sqrt(((tl[0] - bl[0]) ** 2) + ((tl[1] - bl[1]) ** 2))
    maxHeight = max(int(heightA), int(heightB))
    destination_corners = [[0, 0], [maxWidth, 0], [maxWidth, maxHeight], [0, maxHeight]]
    M = cv2.getPerspectiveTransform(np.float32(newcor), np.float32(destination_corners))
    final = cv2.warpPerspective(image, M, (destination_corners[2][0], destination_corners[2][1]), flags=cv2.INTER_LINEAR)
    return final
    
def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    antibiogram_ocr_pb2_grpc.add_OCRServiceServicer_to_server(OCRServiceServicer(), server)
    server.add_insecure_port('[::]:50051') 
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    serve()
