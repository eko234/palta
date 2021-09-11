(local cjson (require :cjson))

(fn header [{: host : secure : port : collection : key : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s/%s" uri collection key)
                                  {:method :HEAD
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn find_one [{: host : secure : port : collection : key : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s/%s" uri collection key)
                                  {:method :GET 
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn find_many [{: host : secure : port : collection : keys : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s?onlyget=true" uri collection)
                                  {:method :PUT
                                   :body (cjson.encode keys)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn create [{: host : secure : port : collection : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s" uri collection)
                                  {:method :POST
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn replace_one [{: host : secure : port : collection : key : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s/%s" uri collection key)
                                  {:method :PUT
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn replace_many [{: host : secure : port : collection : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s" uri collection )
                                  {:method :PUT
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn update_one [{: host : secure : port : collection : key : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s/%s" uri collection key)
                                  {:method :PATCH
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn update_many [{: host : secure : port : collection : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s" uri collection )
                                  {:method :PATCH
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn delete_one [{: host : secure : port : collection : key : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s/%s" uri collection key)
                                  {:method :DELETE
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn delete_many [{: host : secure : port : collection : keys : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/document/%s" uri collection )
                                  {:method :DELETE
                                   :body (cjson.encode keys)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn cursor [{: host : secure : port : data : jwt : params}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/cursor" uri)
                                  {:method :POST
                                   :body (cjson.encode data)
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn read_cursor [{: host : secure : port : jwt : params : cursor_id}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/cursori/%s" uri cursor_id)
                                  {:method :POST
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

(fn delete_cursor [{: host : secure : port : jwt : params : cursor_id}]
  (let
    [httpc     ((. (require :resty.http) :new))
     uri       (string.format "%s://%s:%s" (or (and secure "https") "http") (or host "127.0.0.1") (or port "8529"))
     (res err) (httpc:request_uri (string.format "%s/_api/cursori/%s" uri cursor_id)
                                  {:method :DELETE
                                   :headers {:Authorization (string.format "bearer %s" jwt)}})]
    (cjson.decode res.body)))

{: find_one
 : find_many 
 : replace_one
 : replace_many
 : update_one
 : update_many
 : delete_one
 : delete_many
 : create 
 : header }
