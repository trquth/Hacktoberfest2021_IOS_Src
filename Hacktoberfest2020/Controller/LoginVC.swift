//
//  LoginVC.swift
//  Hacktoberfest2020
//
//  Created by Thien Tran on 22/07/2021.
//

import UIKit
import FontAwesome_swift
import Toast_Swift

class LoginVC: UIViewController {

    @IBOutlet weak var atIconLbl: UILabel! {
        didSet {
            atIconLbl.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
            atIconLbl.text = String.fontAwesomeIcon(name: .at)
        }
    }
    @IBOutlet weak var keyIconLbl: UILabel!{
        didSet {
            keyIconLbl.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
            keyIconLbl.text = String.fontAwesomeIcon(name: .key)
        }
    }
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTextField: UITextField! {
        didSet{
            emailTextField.tag = 1
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.isSecureTextEntry = true
            passwordTextField.tag = 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Login"
        
        let backBtn = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain, target: self, action: #selector(goBackPressed))
        navigationItem.leftBarButtonItem = backBtn
        
        loginBtn.layer.cornerRadius = 5
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    
    
    @objc func goBackPressed(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func toogleInteraction(){
      
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
       view.endEditing(true)
        
        
        if !(emailTextField.text?.isValidEmail())! {
            emailTextField.becomeFirstResponder()
            return
        }
        
        if !(passwordTextField.text?.isValidEmail())! {
            passwordTextField.becomeFirstResponder()
            return
        }
        self.view.makeToastActivity(.center)

        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
            self.view.hideToastActivity()
        }
    }
    
    private func completeLogin(){
        goBackPressed()
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        //Clear Error Message
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField)
        if emailTextField == textField {
            print("is emailTextField")
        }else{
            print("not is emailTextField")
        }
        return true
    }
}
