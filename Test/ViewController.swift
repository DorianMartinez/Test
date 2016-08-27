//
//  ViewController.swift
//  Test
//
//  Created by Dorian Martinez on 9/15/15.
//  Copyright © 2015 Dorian Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getJSON("http://servicedeskrest.lacdc.org/api/v1.0/assets/17745")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJSON(path: String) {
        
        print("getJSON")
        
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            var jsonResult = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                print("JSON Error \(err!.localizedDescription)")
            }
            //let results: NSArray = jsonResult["Table"] as NSArray
            let results = jsonResult["Table"] as! NSArray
            print(results)
            //self.delegate.didReceiveAPIResults(jsonResult)
            
        })
        
        task.resume()
    }



}

