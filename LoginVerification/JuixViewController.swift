//
//  JuixViewController.swift
//  LoginVerification
//
//  Created by Evelyn Hasama on 12/30/20.
//

import UIKit
import WebKit

class JuixViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.juix.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

}
