//
//  CartItem.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 27..
//  Copyright © 2015년 tAcademy. All rights reserved.
//

import Foundation
import RealmSwift

//DB에 저장하려는 클래스는 Object를 상속한다

class CartItem: Object {
    
    dynamic var dbItems = ""
    //dynamic var count = 0
}