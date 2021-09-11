(local cjson (require :cjson))

(fn auth [{: username : password : host : secure : port }]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_open/auth" uri)
                                  {:method :POST
                                   :body (cjson.encode {: username : password })})]
    (cjson.decode res.body)))

{: auth}
