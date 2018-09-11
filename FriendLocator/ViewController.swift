//
//  ViewController.swift
//  FriendLocator
//
//  Created by Mohamed Shaikhon on 9/11/18.
//  Copyright © 2018 Mohamed Shaikhon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "background"))
        backgroundImageView.contentMode = .scaleAspectFit
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        view.addSubview(blurredView)
        blurredView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let loginView = LoginView(frame: view.frame)
        view.addSubview(loginView)
        // Do any additional setup after loading the view, typically from a nib.
    }
 
   
}

