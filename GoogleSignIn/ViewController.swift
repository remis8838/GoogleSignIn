//
//  ViewController.swift
//  GoogleSignIn
//
//  Created by Master on 5/21/16.
//  Copyright © 2016 Master. All rights reserved.
//

import UIKit
import Google


class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        if error != nil{
            print("++++++++++++++++++++++++++++++++++++++")
            print("Error: \(error?.localizedDescription)")
            print("++++++++++++++++++++++++++++++++++++++")
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let signInButton = GIDSignInButton(frame: CGRectMake(0,0,100,50))
        signInButton.center = view.center
        view.addSubview(signInButton)
    }
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error != nil{
            print(error)
            return
        }
        print(user.profile.email)
        print(user.profile.imageURLWithDimension(400))
    }
    
    
}

