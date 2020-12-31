//
//  CheckVerificationViewController.swift
//  LoginVerification
//
//  Created by Evelyn Hasama on 12/30/20.
//

import UIKit

class CheckVerificationViewController: UIViewController {
    override func viewDidLoad() {
        self.errorLabel.text = nil
    }

    @IBOutlet var codeField: UITextField! = UITextField()
    @IBOutlet var errorLabel: UILabel! = UILabel()
    
    var countryCode: String?
    var phoneNumber: String?
    
    @IBAction func validateCode() {
        self.errorLabel.text = nil // reset
        if let code = codeField.text {
            VerifyAPI.validateVerificationCode(self.countryCode!, self.phoneNumber!, code) { checked in
                if (checked.success) {
                    self.errorLabel.textColor = UIColor.green
                    self.errorLabel.text = checked.message
                    let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                        self.performSegue(withIdentifier: "successSegue", sender: nil)
                    }
                } else {
                    self.errorLabel.textColor = UIColor.red
                    self.errorLabel.text = checked.message
                }
            }
        }
    }
        
}
