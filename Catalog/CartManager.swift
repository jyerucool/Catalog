//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tAcademy. All rights reserved.
//

import Foundation
import RealmSwift

class CartManager {
    

    static let sharedManager = CartManager()
    var dbItems: Results<CartItem>!
    //var items = [String]()
    
    
    
    func count() -> Int {
        if dbItems == nil {
            return 0
        }
        else {
        return dbItems.count
    }
    }
    

    func addItem(productName : String!) {
       //items.insert(productName, atIndex: 0)
        
        //cartItem.dbItems.insert(productName, atIndex: 0)
        let cartItem = CartItem()
        cartItem.dbItems = productName
        print("OK")
        
        //서버에 저장
        let server = MyRequestController()
        server.sendRequest(productName)
        print("오키")
        
        //db에 저장
        let realm = try! Realm()
        try! realm.write {
            
            realm.add(cartItem)
        }
        print(cartItem.dbItems)
        
        
        dbItems = realm.objects(CartItem)
        
    }
    
//    func loadDB() {
//            let realm = try! Realm()
//        dbItems = realm.objects(CartItem)
//
//    }
    }
        
        
    /*
        
//    func cartAt(index : Int) -> String {
//        return cartItem.objects(CartItem)[index].name
//    }
//    
//    func load() {
//        let realm = try! Realm()
//        //저장된것 가져오기
//        let result:Results<CartItem> = realm.objects(CartItem)
//        print(result.count)
//        print(result[0])

*/