//
//  UrlWebViewModel.swift
//  SocialNetworking
//
//  Created by Mohamed DIb on 4/8/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit


class SessionModel: NSObject{

    var dataSession:NSMutableDictionary = ["urlSession": "", "accessTokenSession": "", "codeSession": "", "userSession": ""]

}

class urlViewDataModel: NSObject{

    var urlSession = String()
    var accessTokenSession = String()
    var codeSession = String()
    var userSession = String()
    
}
