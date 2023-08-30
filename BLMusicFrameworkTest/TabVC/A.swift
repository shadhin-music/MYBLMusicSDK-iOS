//
//  A.swift
//  Shadhin-BL-Example
//
//  Created by Joy on 1/12/22.
//

import UIKit
import Shadhin_BL
class A: UIViewController {

    init(){
        super.init(nibName: "A", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var radioView: BLRadioView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShadhinBL.shared.radioInitialise(tabBarController: self.tabBarController!, delegate: self)
    }

    @IBAction func onGotoMusicPressd(_ sender: Any) {
        guard let nav = self.navigationController else{
            return
        }
        ShadhinBL.shared.gotoHome(with: self.tabBarController, navigationController: nav)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension A : RadioCallBack{
    func fetchTokenForRadio(complete: @escaping (String, Bool) -> Void) {
        
    }
    
    
}
