//
//  SignInVC.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 29/11/22.
//

import UIKit
import Shadhin_BL
class SignInVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.text = "8801912000000"
    }

    @IBAction func onLoginPressed(_ sender: UIButton) {
        
        guard let number = textField.text, !number.isEmpty, number.count  == 13 else {
            print("empty or invalid number")
            return
        }
        sender.isEnabled = false
        ShadhinBL.shared.login(number: number) { isDone, token in
            if isDone{
                ShadhinBL.shared.initialize(with: token, delegate: self)
            }else{
                
            }
        }
        
    }
    
}
extension SignInVC : ShadhinCoreNotifier{
    func shareContentWithRC(title: String, image: String, rc code: String) {
        print(title,image,code)
    }
    
    func bkashPaymentInit() {
        
    }
    
    func bksahPaymentSuccess() {
        print("payment success")
    }
    
    //music play pause state error catch 
    func player(error: String) {
        print(error)
    }
    
    func shareContentWithRC(rc code: String) {
        print(code)
    }
    
    func rcError(error: String?) {
        print(error)
    }
    
    func amarTuneError(error: String?) {
        print(error)
    }
    
    func tokenStatus(token isValid: Bool, error: String?) {
        if isValid{
            let home = TabBarVC()
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    func patchError(error: String) {
        print(error)
    }
    
    
}
