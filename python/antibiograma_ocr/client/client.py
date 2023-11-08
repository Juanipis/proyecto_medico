import grpc
import antibiogram_ocr_pb2
import antibiogram_ocr_pb2_grpc
import cv2

def run_ocr_client():
    # Crea un canal gRPC para comunicarse con el servidor.
    with grpc.insecure_channel('localhost:50051') as channel:
        # Crea un cliente gRPC para el servicio OCR.
        client = antibiogram_ocr_pb2_grpc.OCRServiceStub(channel)

        # Lee la imagen "img.jpg" y conviértela en bytes.
        image_path = "ab.jpeg"
        img = cv2.imread(image_path)

        if img is not None:
            # La imagen se cargó correctamente, ahora puedes continuar con el procesamiento.
            image_data = cv2.imencode(".jpg", img)[1].tobytes()
        else:
            print(f"No se pudo cargar la imagen en {image_path}.")
            image_data = b""  # Asigna una cadena vacía para que 'request' esté definido

        request = antibiogram_ocr_pb2.ImageRequest(image_data=image_data)

        try:
            # Llama al método PerformOCR del servicio.
            response = client.PerformOCR(request)
            print("Texto extraído:")
            print(response.text)
        except grpc.RpcError as e:
            print(f"Error en la llamada gRPC: {e}")

if __name__ == '__main__':
    run_ocr_client()


