Script NGINX:

```
http {
    # types { 
    #     text/css                                         css;
    #     text/html                                        html;
    # }

    include mime.types;
    upstream backendserver { 
        server 127.0.0.1:1111;
        server 127.0.0.1:2222;
     }
    server {
        listen 8080;
        root /Users/akhmadwildan/documents/BELAJAR/belajar-nginx;

        location ~* /count/[0-9] {
            root /Users/akhmadwildan/documents/BELAJAR/belajar-nginx;
            try_files /index.html = 404;
        }

        location /fruits {
            root /Users/akhmadwildan/documents/BELAJAR/belajar-nginx;
        }

        location /carbs {
            alias /Users/akhmadwildan/documents/BELAJAR/belajar-nginx/fruits;
        }
        location /vegetables {
            alias /Users/akhmadwildan/documents/BELAJAR/belajar-nginx;
            try_files /vegetables/veggies.html /index.html =404; 
        }

        location / {
            proxy_pass http://backendserver/;
        }
    }
}

events{}

```