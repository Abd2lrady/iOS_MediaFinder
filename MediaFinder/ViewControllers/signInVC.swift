//
//  signInVC.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/3/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

class signInVC: UIViewController {
    
    let userInfo = UserDefaultData.createSharedInstance()
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var enteredDataStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        UserDefaultData.createSharedInstance().isLogged = false
    }
    

    @IBAction func signInBtnTapped(_ sender: UIButton) {
        // checking input data
        if emailTxtField.text == userInfo.user?.email || passwordTxtField.text == userInfo.user?.password {
            enteredDataStatus.text = ""
            userInfo.isLogged = true
            let ProfileVC = UIStoryboard(name: StoryBoard_C.main, bundle: nil).instantiateViewController(withIdentifier: ViewController_C.profile) as! profileVC
            navigationController?.pushViewController(ProfileVC, animated: true)
           
        }else{
            enteredDataStatus.text = "Email or Password is invalid"
        }
        
    }
    

}
