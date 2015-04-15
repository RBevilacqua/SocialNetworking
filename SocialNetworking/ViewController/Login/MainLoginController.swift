//
//  ViewController.swift
//  SocialNetworking
//
//  Created by Mohamed DIb on 4/9/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class MainLoginController: UIViewController {

    @IBOutlet weak var connectInstagram: UIButton!

    // Variable of MainLoginController
    var dataRetrieved = InstagramNetworking()
    var dataUrl = urlViewDataModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        connectInstagram.hidden = true

        dataRetrieved.gettingAccessKey { (result) -> Void in

            self.dataUrl.urlSession = result

            NSUserDefaults.standardUserDefaults().setObject(self.dataUrl.urlSession, forKey: "url")

            NSUserDefaults.standardUserDefaults().synchronize();

            println(self.dataUrl.urlSession)

            self.connectInstagram.hidden = false

        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //d7a1683032e7447cbaefe772243dc94a
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectInstagram(sender: UIButton) {

        //self.performSegueWithIdentifier("webLogin", sender: self)

    }

}

