//
//  networking.swift
//  pruebaAlamofire
//
//  Created by Mohamed DIb on 4/7/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit
import Alamofire


class InstagramNetworking: NSObject{

    private var _accessToken: AnyObject? = nil
    private var _accessKey: String?

    private func getUrl(completionHandler: (String?, NSError?) -> ()) -> () {

        // If we already have an access key, call the completion handler with it immediately

        if let accessKey = self._accessKey {

            completionHandler(accessKey, nil)

        } else {

            // Otherwise request one
            Alamofire.request(.GET, "https://api.instagram.com/oauth/authorize", parameters: ["client_id": "fbfbe356849c419faddd564a9308875e","redirect_uri": "http://yourcallback.com/callback", "response_type": "code" ])
                .response { (request, response, data, error) in

                    let accessKey = request.URLString

                    self._accessKey = accessKey

                    completionHandler(accessKey, error)

            }
        }
    }

    func gettingAccessKey(completion: (result: String) -> Void) {

        getUrl { (accessKey, error) in

            if accessKey != nil {

                // Use accessKey however you'd like here

                var urlRequest: String = accessKey!

                completion(result: urlRequest);

            } else {

                println(error)
                
                // Handle error / nil accessKey here
                
            }
        }
    }

    private func getToken(code: String,completionHandler: (AnyObject?, NSError?) -> ()) -> () {

        // If we already have an access key, call the completion handler with it immediately

        if let accessToken: AnyObject = self._accessToken {

            completionHandler(accessToken, nil)

        } else {

            // Otherwise request one
            Alamofire.request(.POST, "https://api.instagram.com/oauth/access_token", parameters: ["client_id":"fbfbe356849c419faddd564a9308875e", "client_secret":"968e78308a154519a8af567b66da738f", "grant_type":"authorization_code", "redirect_uri":"http://yourcallback.com/callback", "code":code])
                .responseJSON { (request, response, data, error) in

                    let accessToken: AnyObject? = data

                    self._accessToken = data
                    
                    completionHandler(accessToken, error)
                    
            }
        }
    }

    func gettingUserDataSession(code: String, completion: (result: AnyObject) -> Void) {

        getToken(code) { (accessToken, error) in

            if accessToken != nil {

                // Use accessKey however you'd like here

                var userDataSession: AnyObject = accessToken!

                completion(result: userDataSession);

            } else {

                println(error)
                
                // Handle error / nil accessKey here
                
            }
        }
    }

}