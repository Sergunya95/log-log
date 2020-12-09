//
//  AboutMeViewController.swift
//  log log
//
//  Created by apple on 12/8/20.
//

import UIKit

class AboutMeViewController: UIViewController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName

    }

}
