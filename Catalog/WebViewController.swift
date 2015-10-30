//
//  WebViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tAcademy. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var urlStr : String!
    
   // 뷰윌어피어에서로딩을한다 .
    
    override func viewWillAppear(animated: Bool) {
        if let url = NSURL(string: "https://en.wikipedia.org/wiki/\(urlStr)") {
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
        else {
            print("URL 에러")
        }
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
