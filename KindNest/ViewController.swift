//
//  ViewController.swift
//  KindNest
//
//  Created by Paulo Choi on 3/7/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var copyUser : PFUser?
    
    @IBAction func fbLogin(sender: AnyObject) {
        var permissions = ["public_profile", "email", "user_friends"]

        //var FBSession : PFFacebookUtils?
        
        PFFacebookUtils.logInWithPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                    //self.performSegueWithIdentifier("goToMap", sender: self)
                } else {
                    println("User logged in through Facebook!")
                    
                    self.copyUser = user
                    
                    
                    println(self.copyUser)
                    
                    self.performSegueWithIdentifier("goToMap", sender: self)

                    
//                    var FBSession = PFFacebookUtils.session()
//                    var accessToken = FBSession.accessTokenData.accessToken
//                    //println(accessToken)
//                    
//                    let url = NSURL(string: "https://graph.facebook.com/me/picture?type=small&return_ssl_resources=1&access_token=" + accessToken)
//                    
//                    var urlRequest = NSURLRequest(URL: url!)
//                    NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
//                        response,data,error in
//                        
//                        var image : UIImage
//                      
//                        image = UIImage(data: data)!
//                        
//                        //println(image)
//                        
//                        //self.picture.image = image
                    
//                    })
                    
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        })        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //checks if the user is logged in
        if PFUser.currentUser() != nil {
            println("User logged in")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToMap" {
            var seguetoMap = segue.destinationViewController as MapViewController
            println("im here")
            //seguetoMap.currentUser = copyUser
        }
        else {
            println("nooooo")
        }
    }

}

