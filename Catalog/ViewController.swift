//
//  ViewController.swift
//  Catalog
//
//  Created by 박주영 on 2015. 10. 25..
//  Copyright © 2015년 tAcademy. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {
//    static let sharedManager = CartViewController()
//    let c = CartViewController.sharedManager
    let cmanager = CartManager.sharedManager
    
    @IBOutlet weak var tableView: UITableView!
    var productList : [Product]!
   // var cartList = [String]()
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 테이블 뷰의 셀 선택으로 세그웨이 전환시 - sender는 셀
        let cell = sender as! UITableViewCell
        // 셀에서 인덱스 - 사용자 선택 데이터 얻기
        let indexPath = tableView.indexPathForCell(cell)!
        let selected  = productList[indexPath.row]
        let data = selected.name
        
        print("선택한 데이터 : \(selected.name)")
        
        let webViewController = segue.destinationViewController as! WebViewController
        webViewController.urlStr = data
    }

    
    // 셀의 이벤트 - 위임 (장바구니추가)
    func addCart(productName: String) {
        cmanager.addItem(productName)
        //print(cmanager.items)
        //cartList.insert(productName, atIndex: 0)
        //tableView.reloadData()
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //셀의갯수
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return productList.count
       
    }
    
    //섹션 제목 설정
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
            return "Catalog"
        
    }

    
    //셀의 내용 공급
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    
        let cell : ProductCell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
        //   cell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL") as! ProductCell
        
        let product = productList[indexPath.row]
        cell.productName.text = product.name
        cell.productPrice.text = product.price + "원"
        cell.productImage.image = UIImage(named: product.image)
        
        cell.productCode = product.code
        cell.productNameString = product.name
        
        // 셀 델리게이트 설정
        cell.delegate = self
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productList = [
            Product(code: "001", name: "Baseball", price: "100", image: "Baseball"),
            Product(code: "002", name: "Basketball", price: "200", image: "Basketball"),
            Product(code: "003", name: "Football", price: "300", image: "Football"),
            Product(code: "004", name: "Golf", price: "400", image: "Golf"),
            Product(code: "005", name: "Rugby", price: "500", image: "Rugby"),
            Product(code: "006", name: "Tennis", price: "600", image: "Tennis"),
            Product(code: "007", name: "Volleyball", price: "700", image: "Volleyball"),
            Product(code: "008", name: "TableTennis", price: "800", image: "TableTennis"),
            Product(code: "009", name: "IceHockey", price: "800", image: "IceHockey"),
            Product(code: "010", name: "Billiard", price: "800", image: "Billiard"),
        ]
        
        
    }
}
