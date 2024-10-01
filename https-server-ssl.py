## This script will launch python http.server with SSL encryption (generate cert.pem first)
## openssl req -new -x509 -keyout cert.pem -out cert.pem -days 365 -nodes
## Edit script with your local IP

import http.server,ssl

cert = "cert.pem"

httpd = http.server.HTTPServer(('<local IP>',443),
http.server.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket(httpd.socket,certfile=cert,server_side=True)
httpd.serve_forever()
