//
//  ViewController.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/3/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

class signUpVC: UIViewController  {
// Variables
// ---------
    var gender: Gender = .male
    let userData = UserDefaultData.createSharedInstance()
    let mainStoryboard = UIStoryboard(name: StoryBoard_C.main, bundle: nil)
    
    
    //Outlets
    //-------
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var phoneTxtField: UITextField!
    @IBOutlet weak var addressTxtField: UITextField!
    
    // labels
    //-------
    @IBOutlet weak var nameStatusLabel: UILabel!
    @IBOutlet weak var emailStatusLabel: UILabel!
    @IBOutlet weak var passwordStatusLabel: UILabel!
    @IBOutlet weak var phoneStatusLabel: UILabel!
    @IBOutlet weak var addressStatusLabel: UILabel!
    
    //Image
    //-----
    @IBOutlet weak var imageView: UIImageView!
    
  
//    lazy var userTextData = [nameTxtField.text, emailTxtField.text, passwordTxtField.text, phoneTxtField.text, addressTxtField.text]
//    lazy var userTextStatus = (nameStatusLabel.text, emailStatusLabel.text, passwordStatusLabel.text, phoneStatusLabel.text, addressStatusLabel.text)
    
    // Data List
    // ---------
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    
    
    
// Actions
// -------
    @IBAction func genderSwChanged(_ sender: UISwitch) {
        if sender.isOn {
            gender = .male
        }else{
            gender = .female
        }
    }
    
    @IBAction func signupBtnTapped(_ sender: UIButton) {
        
        let validate = UserDataValidation()
        var dataFlag = false
        
        if validate.isEmpty(data: nameTxtField.text!){
            nameStatusLabel.text = "Please Enter Name"
            dataFlag = false
        }else{nameStatusLabel.text = "✔︎"; dataFlag = true}

        if validate.isEmpty(data: emailTxtField.text!){
            emailStatusLabel.text = "Please Enter Email"
            dataFlag = false
        }else if !validate.isRegexMatched(text: emailTxtField.text!, regex: RegexPattern_C.mail) {
            emailStatusLabel.text = "Enter Valid Email! Ex: john.smith@mail.com"
            dataFlag = false
        }else {emailStatusLabel.text = "✔︎"; dataFlag = true}
        
        if validate.isEmpty(data: passwordTxtField.text!){
            passwordStatusLabel.text = "Please Enter Password"
            dataFlag = false
        }else if !validate.isRegexMatched(text: passwordTxtField.text!, regex: RegexPattern_C.password) {
            passwordStatusLabel.text = "Enter lease one capital letter, one symbol, one number"
            dataFlag = false
        }else {passwordStatusLabel.text = "✔︎"; dataFlag = true}
        
        if validate.isEmpty(data: phoneTxtField.text!){
            phoneStatusLabel.text = "Please Enter Phone"
            dataFlag = false
        }else {phoneStatusLabel.text = "✔︎"; dataFlag = true}
        
        if validate.isEmpty(data: addressTxtField.text!){
            addressStatusLabel.text = "Please Enter Address"
            dataFlag = false
        }else {addressStatusLabel.text = "✔︎"; dataFlag = true}
        
        if dataFlag {
            let userInfo = User(name: nameTxtField.text!, email: emailTxtField.text!, password: passwordTxtField.text!, phone: phoneTxtField.text!, address: addressTxtField.text!, gender: gender, image: userImage(with: imageView.image!))
            // saving userData to user default data
            // -----------------------------------
            userData.user = userInfo
            userData.isRegistered = true
            let signInVC = mainStoryboard.instantiateViewController(withIdentifier: ViewController_C.signIn) as! signInVC
            navigationController?.pushViewController(signInVC, animated: true)
        }else{
            userData.isRegistered = false
        }
        
    }
        
    
    @IBAction func addressBtnTapped(_ sender: Any) {
        
        let mapViewcontroller = mainStoryboard.instantiateViewController(withIdentifier: ViewController_C.map) as! mapVC
        mapViewcontroller.addressDelegate = self
        navigationController?.pushViewController(mapViewcontroller, animated: true)
    }
    
    
    @IBAction func imgSelectionBtnTapped(_ sender: Any) {
        configureImagePicker()
    }
    
}

extension signUpVC: sendingMapAddressDelegate{
    func sendAddress(_ address: String) {
        addressTxtField.text = address
    }
    
    
}

extension signUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func configureImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        imageView.image = pickedImage
        
        dismiss(animated: true, completion: nil)
        


    }

}
