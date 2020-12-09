//
//  WelcomeViewController.swift
//  log log
//
//  Created by apple on 12/8/20.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(user.login)!"
       
    }
    

 

}
