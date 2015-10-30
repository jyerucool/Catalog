//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tAcademy. All rights reserved.
//

import UIKit


class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let server = MyRequestController()
    @IBOutlet weak var tableView: UITableView!
//    static let sharedManager = CartViewController()
//    let c = CartViewController.sharedManager
    let manager = CartManager.sharedManager
    var dbItems2 = [String]()
    
    
    //섹션갯수
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cart"
    }
    
    //셀의갯수
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dbItems2.count
    }
    
    //내용
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL")!
        //cell.textLabel?.text = manager.dbItems[indexPath.row].dbItems
        cell.textLabel?.text = dbItems2[indexPath.row]
//        for var i=0; i<dbItems2.count; i++ {
//            cell.textLabel?.text = dbItems2[i]
//        }
        return cell
    }
    
    // 씬 전환되면서 공유 데이터를 화면에 반영
    override func viewWillAppear(animated: Bool) {
        server.getRequest()
       tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
