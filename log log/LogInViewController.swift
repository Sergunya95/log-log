//
//  LogInViewController.swift
//  log log
//
//  Created by apple on 12/8/20.
//

import UIKit

class LogInViewController: UIViewController {


    @IBOutlet var LoginTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    
    private let user = User.getUserData()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        welcomeVC.user = user
        aboutUserVC.user = user
    }
    
    
    @IBAction func logInPressed() {
        guard
            LoginTextField.text == user.login,
            PasswordTextField.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: PasswordTextField)
            return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func fogotLoginPressed(_ sender: Any) {
    showAlert(title: "Oops!",
                  message: "Your name is \(user.login) 😉")
    }
    
    @IBAction func fogotPasswordPressed() {
        showAlert(title: "Oops!",
                  message: "Your password is \(user.password) 😉")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        LoginTextField.text = nil
        PasswordTextField.text = nil
    }
     
    
}


extension LogInViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction (title: "Ok", style: .default) {
            _ in textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == LoginTextField {
            PasswordTextField.becomeFirstResponder()
        }     else { logInPressed ()
        }
        return true
    }
}
