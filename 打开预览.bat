@echo off
cd /d "%~dp0"
echo 正在启动本地预览，请不要关闭此窗口...
where python >nul 2>&1
if %errorlevel%==0 (
    python -c "import http.server,socketserver,webbrowser,os,functools;H=http.server.SimpleHTTPRequestHandler;H.extensions_map.update({'.mjs':'text/javascript','.js':'text/javascript','.cjs':'text/javascript','.css':'text/css','.json':'application/json','.wasm':'application/wasm','.svg':'image/svg+xml','.webp':'image/webp','.avif':'image/avif','.woff2':'font/woff2','.woff':'font/woff','.webmanifest':'application/manifest+json','.glb':'model/gltf-binary'});h=functools.partial(H,directory=os.getcwd());s=socketserver.TCPServer(('127.0.0.1',0),h);u='http://127.0.0.1:'+str(s.server_address[1])+'/';print('Preview:',u,' (close this window to stop)');webbrowser.open(u);s.serve_forever()"
) else (
    py -c "import http.server,socketserver,webbrowser,os,functools;H=http.server.SimpleHTTPRequestHandler;H.extensions_map.update({'.mjs':'text/javascript','.js':'text/javascript','.cjs':'text/javascript','.css':'text/css','.json':'application/json','.wasm':'application/wasm','.svg':'image/svg+xml','.webp':'image/webp','.avif':'image/avif','.woff2':'font/woff2','.woff':'font/woff','.webmanifest':'application/manifest+json','.glb':'model/gltf-binary'});h=functools.partial(H,directory=os.getcwd());s=socketserver.TCPServer(('127.0.0.1',0),h);u='http://127.0.0.1:'+str(s.server_address[1])+'/';print('Preview:',u,' (close this window to stop)');webbrowser.open(u);s.serve_forever()"
)
pause
