//
//  ViewController.swift
//  ReadJsonFile
//
//  Created by Daniel Spiess on 10/6/15.
//  Copyright © 2015 Daniel Spiess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let path = NSBundle.mainBundle().pathForResource("test", ofType: "json") else {
            print("Error finding file")
            return
        }

        do {
            let data: NSData? = NSData(contentsOfFile: path)
            if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                let dataDictionary = jsonResult["list"] as! NSDictionary
                let total = dataDictionary["total"]
                print("total items : \(total!)");
                let itemArray = dataDictionary["item"] as! NSArray
                for item in itemArray {
                    let group = item["group"]!
                    let offset = item["offset"]!
                    let name = item["name"]!
                    let ndbno = item["ndbno"]!
                    print("Item \(offset!): \(group!) - \(name!) - \(ndbno!)")
                }
            }
        } catch let error as NSError {
            print("Error:\n \(error)")
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

