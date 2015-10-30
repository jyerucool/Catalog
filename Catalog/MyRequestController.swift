//
//  MyRequestController.swift
//  Test11st
//
//  Created by sdt5 on 2015. 10. 28..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MyRequestController {
    
    func sendRequest(productName : String) {
        
        // Catalog (POST https://api.parse.com/1/classes/CartItem)
        
        // Create manager
        var manager = Manager.sharedInstance
        
        // Add Headers
        let headers = [
            "X-Parse-REST-API-Key":"uMP64NfHqglwy2pWZD9PZeX0iKBi0nnP4fNRIURq",
            "X-Parse-Application-Id":"kOHepio19Uhk7GSTD2r8UZsrFsn88vcm4PoDcd4g",
            "Content-Type":"application/json",
        ]
        
        // JSON Body
        let bodyParameters = [
            "name": productName
        ]
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        // Fetch Request
        Alamofire.request(.POST, "https://api.parse.com/1/classes/CartItem", parameters: bodyParameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                print(productName+"!!!!")
                //                if (error == nil)
                //                {
                //                    println("HTTP Response Body: \(JSON)")
                //                }
                //                else
                //                {
                //                    println("HTTP HTTP Request failed: \(error)")
                //                }
        }
        
    }






    func getRequest() {
        
        // Catalog (GET https://api.parse.com/1/classes/CartItem)
        
        // Create manager
        var manager = Manager.sharedInstance
        
        // Add Headers
        let headers = [
            "X-Parse-REST-API-Key":"uMP64NfHqglwy2pWZD9PZeX0iKBi0nnP4fNRIURq",
            "X-Parse-Application-Id":"kOHepio19Uhk7GSTD2r8UZsrFsn88vcm4PoDcd4g",
            "Content-Type":"application/json",
        ]
        
        
        let encoding = Alamofire.ParameterEncoding.JSON
        
        // Fetch Request
        Alamofire.request(.GET, "https://api.parse.com/1/classes/CartItem", encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                let json = JSON(response.result.value!)
                var cartItem = [String]()
                let root = json["results"]
                for (_, subJson):(String, JSON) in root {
                    let productName = subJson["name"].stringValue
                    //print(productName)
                    cartItem.insert(productName, atIndex: 0)

                }
//                for var i=0; i<100; i++ {
//                    let root = json["results"]
//                    var data = root["name"].stringValue
//                    cartItem.insert(data, atIndex: 0)
//                    print(data)
//                }

                let a = CartViewController()
                a.dbItems2 = cartItem
                print("Yeah~")
                print(cartItem.count)
                
        
        
        
    }
}// func


}
