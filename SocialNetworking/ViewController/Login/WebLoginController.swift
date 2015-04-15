//
//  WebLoginController.swift
//  SocialNetworking
//
//  Created by Mohamed DIb on 4/9/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class WebLoginController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var dataRetrieved = InstagramNetworking()
    var dataUrl = urlViewDataModel()
    var dataSession:NSMutableDictionary = SessionModel().dataSession

    override func viewDidLoad() {
        super.viewDidLoad()

        dataUrl.urlSession = NSUserDefaults.standardUserDefaults().objectForKey("url") as String

        let url = NSURL(string: dataUrl.urlSession)

        println(dataUrl.urlSession)

        var request = NSURLRequest(URL: url!)

        self.webView.loadRequest(request)

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension WebLoginController: UIWebViewDelegate {

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        var URLString : String = request.URLString

        if URLString.rangeOfString("http://yourcallback.com/callback") != nil
            && URLString.rangeOfString("code") != nil {

                dataUrl.codeSession = URLString.componentsSeparatedByString("=").last!

                dataSession.setValue(dataUrl.urlSession, forKey: "urlSession")
                dataSession.setValue(dataUrl.codeSession, forKey: "codeSession")

                println(dataSession)

                dataRetrieved.gettingUserDataSession(dataUrl.codeSession, completion: { (result) -> Void in

                    println(result)

                    NSUserDefaults.standardUserDefaults().setObject(self.dataSession, forKey: "sessionData")

                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "sessionInit")

                    NSUserDefaults.standardUserDefaults().synchronize();

                })
                
        }
        
        
        return true
    }
}


