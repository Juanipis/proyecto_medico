from server.config.server import config
from server.config.server import GRPCServer
from server.config.route_injector import RouteInjector
from logzero import logger

class Server:
    def __init__(self, host:str, port:int) -> None:
        self.arg_checker(host, port)

    def run(self):
        logger.info('Starting gRPC server on port {0}:{1}'.format(config.host,config.port))
        grpc_server = GRPCServer(config.host, config.port)
        RouteInjector(grpc_server.server)
        logger.info('gRPC server started on port {0}:{1}'.format(config.host,config.port))
        grpc_server.start()

    def arg_checker(self, host:str, port:int):
        if host != None and host != '':
            config.host = host
        if port != None:
            config.port = port

import pytesseract
import cv2
img = cv2.imread("antibiograma.jpg_large")
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
img = cv2.GaussianBlur(img, (3, 3), 0)
text = pytesseract.image_to_string(img, lang="spa")