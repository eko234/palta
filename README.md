# Resty Palta

This is a library to communicate with arangodb databases using the arangodb http api,
it aims to be simple and unopinionated, these are more like building blocks indeed...

You are encouraged to compose the functions and make your own wrappers.

If you use lua, remember you can compile fennel down to lua :)

Here is a little code snippet:

``` fennel
(app:match 
 "/"
 (fn [self]
  (let
    [{: jwt }   (auth.auth              {:username "root" :password "admin"})
     document1  (documents.find_one     {:key "1413" :collection "users" : jwt})
     document2  (documents.create       {:collection "users" :data {:name "Gyro Zeppeli"} : jwt})
     document3  (documents.create       {:collection "users" :keys [{:name "slow dancer"} {:name "valkyrie"}] : jwt})
     document4  (documents.find_many    {:collection "users" :data ["32087"] : jwt})
     document5  (documents.replace_one  {:collection "users" :key "1413" :data {:spoa "SESES"} : jwt})
     document6  (documents.replace_many {:collection "users" :data [{:_key "1413" :rana "sapa"}] : jwt})
     document7  (documents.update_one   {:collection "users" :data :key "666" :data {:name "a name"} : jwt})
     document8  (documents.update_many  {:collection "users" :data [{:_key "32087" :name "a name"}] : jwt})
     document9  (documents.delete_one   {:collection "users" :key "32087" : jwt})
     document10 (documents.delete_many  {:collection "users" :keys ["32087"] : jwt})
     ]
      {:json [document1 document2 document3 document4 document5 document6 document7 document8 document9 document10]})))
```
