import pytesseract
import cv2
import grpc
from concurrent import futures
import antibiogram_ocr_pb2
import antibiogram_ocr_pb2_grpc

class OCRServiceServicer(antibiogram_ocr_pb2_grpc.OCRServiceServicer):
    def PerformOCR(self, request, context):
        try:
            if not request.image_data:
                context.set_code(grpc.StatusCode.INVALID_ARGUMENT)
                context.set_details("La solicitud debe contener datos de imagen.")
                return antibiogram_ocr_pb2.OCRResponse()

            img = cv2.imdecode(request.image_data, cv2.IMREAD_COLOR)
            img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            img = cv2.GaussianBlur(img, (3, 3), 0)
            extracted_text = pytesseract.image_to_string(img, lang="spa")
            response = antibiogram_ocr_pb2.OCRResponse(text=extracted_text, content_type="text/plain")

            return response

        except Exception as e:

            context.set_code(grpc.StatusCode.INTERNAL)
            context.set_details("Error al procesar la solicitud: " + str(e))
            
            return antibiogram_ocr_pb2.OCRResponse()

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    antibiogram_ocr_pb2_grpc.add_OCRServiceServicer_to_server(OCRServiceServicer(), server)
    server.add_insecure_port('[::]:50051') 
    server.start()
    server.wait_for_termination()

if __name__ == '__main__':
    serve()
