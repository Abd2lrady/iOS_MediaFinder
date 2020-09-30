//
//  profileVC.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/3/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

class profileVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let userData = UserDefaultData.createSharedInstance().user else{return}
            nameLabel.text = userData.name
            emailLabel.text = userData.email
            passwordLabel.text = userData.password
            addressLabel.text = userData.address
            phoneLabel.text = userData.phone
            imageView.image = userData.image.getImage()
        
        
        
    }
    

    @IBAction func showUserMovieListBtnTapped(_ sender: Any) {
  
    let mainSB = UIStoryboard(name: StoryBoard_C.main, bundle: nil)
        let movieVC = mainSB.instantiateViewController(withIdentifier: ViewController_C.movieList ) as! movieListVC
        
        navigationController?.pushViewController(movieVC, animated: true)
    
    }
    
}
