//
//  MapViewController.swift
//  KindNest
//
//  Created by Paulo Choi on 3/7/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var userMap: MKMapView!
    
    @IBOutlet weak var currentPhoto: UIImageView!
    
    var currentUser : PFUser?
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //rounded profile pic
        //self.currentPhoto.layer.cornerRadius = self.currentPhoto.frame.size.width / 2;
        self.currentPhoto.layer.cornerRadius = (self.currentPhoto.frame.size.width / 2) - 8;
        self.currentPhoto.clipsToBounds = true;
        self.currentPhoto.layer.borderWidth = 3.0;
        self.currentPhoto.layer.borderColor = UIColor.whiteColor().CGColor;

        
        //println("Current user is \(currentUser)")
        //println(PFFacebookUtils.session())
        
        var FBSession = PFFacebookUtils.session()
        var accessToken = FBSession.accessTokenData.accessToken
        //println(accessToken)

        let url = NSURL(string: "https://graph.facebook.com/me/picture?type=normal&return_ssl_resources=1&access_token=" + accessToken)

        var urlRequest = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response,data,error in

            var image : UIImage

            image = UIImage(data: data)!

            println(image)

            self.currentPhoto.image = image

        })
        
        //self.performSegueWithIdentifier("goToMap", sender: sender)
        
        //currentPhoto.image = userPhoto!
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingHeading()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
