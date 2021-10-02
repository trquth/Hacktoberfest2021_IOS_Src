//
//  ViewController.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 10/9/20.
//

import UIKit

class AuthenticationVC: UIViewController {

    @IBOutlet weak var fbBtn: AroundCircleButton!
    @IBOutlet weak var ggBtn: AroundCircleButton!
    @IBOutlet weak var guestBtn: AroundCircleButton!
    @IBOutlet weak var existingUserBtn: AroundCircleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fbBtnPressed(_ sender: Any) {
    }
    
    @IBAction func ggBtnPressed(_ sender: Any) {
    }
    @IBAction func guestBtnPressed(_ sender: Any) {
    }
    @IBAction func existingUserBtnPressed(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "loginVC") as! LoginVC
        loginVC.modalTransitionStyle = .flipHorizontal
        let nvc = UINavigationController(rootViewController: loginVC)
        self.present(nvc, animated: true, completion: nil)
    }
}

