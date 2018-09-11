//
//  LoginView.swift
//  FriendLocator
//
//  Created by Mohamed Shaikhon on 9/11/18.
//  Copyright © 2018 Mohamed Shaikhon. All rights reserved.
//

import UIKit
import Lottie

class LoginView: UIView {
    
    let animationView: LOTAnimationView = {
        let animView = LOTAnimationView(name: "bouncy_mapmaker")
        animView.loopAnimation = true
        animView.animationSpeed = 1.8
        animView.enableAutoLayout()
        return animView
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.enableAutoLayout()
        let attributedText = NSMutableAttributedString(string: "Know exactly where to meet your friends.", attributes: [NSAttributedStringKey.font: UIFont(name: "Avenir Next", size: 29) ?? UIFont.systemFont(ofSize: 29),NSAttributedStringKey.foregroundColor: UIColor.white])
        label.attributedText = attributedText
        return label
    }()
    let emailTextField: LeftPaddedTextField = {
        let tf = LeftPaddedTextField()
        tf.enableAutoLayout()
        tf.placeholder = "Email"
        tf.setLeftIcon(#imageLiteral(resourceName: "mail"))
        tf.keyboardType = .emailAddress
        tf.backgroundColor = .white
        return tf
    }()
    let passwordTextField: LeftPaddedTextField = {
        let tf = LeftPaddedTextField()
        tf.enableAutoLayout()
        tf.placeholder = "Password"
        tf.setLeftIcon(#imageLiteral(resourceName: "Lock"))
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        return tf
    }()
    let separatorLineView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.7)
        v.enableAutoLayout()
        return v
    }()
    let textFieldsContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.enableAutoLayout()
        v.layer.cornerRadius = 15
        return v
    }()
    let textFieldsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.enableAutoLayout()
        return sv
    }()
    
    let logInButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Sign in", for: .normal)
        btn.layer.cornerRadius = 15
        btn.enableAutoLayout()
        return btn
    }()
    let logInTwitterButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "greyCircle").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.embedImage(imageToEmbed: #imageLiteral(resourceName: "Twitter"))
        return btn
    }()
    let logInFacebookButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "greyCircle").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.embedImage(imageToEmbed: #imageLiteral(resourceName: "facebookLogo"))
        return btn
    }()
    let signInAlternativesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.enableAutoLayout()
        let attributedText = NSMutableAttributedString(string: "Or sign in with", attributes: [NSAttributedStringKey.font: UIFont(name: "Avenir Next", size: 18) ?? UIFont.systemFont(ofSize: 18),NSAttributedStringKey.foregroundColor: UIColor.white])
        label.attributedText = attributedText
        return label
    }()
    let socialMediaButtonsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.enableAutoLayout()
        return sv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    func anchorAnimationView() {
        addSubview(animationView)
        animationView.play()
        animationView.anchorYAxis(top: topAnchor, topConstant: 40, bottomConstant: 0)
        animationView.anchorCenter(horizontal: centerXAnchor, xConstant: 0, yConstant: 0)
        animationView.anchorWidth(equalToConstant: 100)
        animationView.anchorHeight(equalToConstant: 100)
    }
    func anchorDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.anchorYAxis(top: animationView.bottomAnchor, topConstant: 25, bottomConstant: 0)
        descriptionLabel.anchorXAxis(leading: leadingAnchor, trailing: trailingAnchor, leadingConstant: 20, trailingConstant: -20)
    }
    func anchorTextFieldsContainer() {
        addSubview(textFieldsContainer)
        textFieldsContainer.anchorXAxis(leading: leadingAnchor, trailing: trailingAnchor, leadingConstant: 20, trailingConstant: -20)
        textFieldsContainer.anchorYAxis(top: descriptionLabel.bottomAnchor, topConstant: 30, bottomConstant: 0)
        textFieldsContainer.anchorHeight(equalToConstant: 120)
    }
    func anchorTextFieldsStackView() {
        textFieldsContainer.addSubview(textFieldsStackView)
        textFieldsStackView.anchorXAxis(leading: textFieldsContainer.leadingAnchor, trailing: textFieldsContainer.trailingAnchor, leadingConstant: 8, trailingConstant: -8)
        textFieldsStackView.anchorYAxis(top: textFieldsContainer.topAnchor,bottom: textFieldsContainer.bottomAnchor, topConstant: 8, bottomConstant: -8)
        textFieldsStackView.addArrangedSubview(emailTextField)
        textFieldsStackView.addArrangedSubview(separatorLineView)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        separatorLineView.anchorHeight(equalToConstant: 1)
    }
    func anchorSeparatorLineView() {
        textFieldsContainer.addSubview(separatorLineView)
        separatorLineView.anchorXAxis(leading: textFieldsContainer.leadingAnchor, trailing: textFieldsContainer.trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        separatorLineView.anchorCenter(vertical: textFieldsContainer.centerYAnchor, xConstant: 0, yConstant: 0)
        separatorLineView.anchorXAxis(leading: textFieldsContainer.leadingAnchor, trailing: textFieldsContainer.trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        separatorLineView.anchorHeight(equalToConstant: 1)
    }
    func anchorLogInButton() {
        addSubview(logInButton)
        logInButton.anchorYAxis(top: textFieldsContainer.bottomAnchor, topConstant: 8, bottomConstant: 0)
        logInButton.anchorXAxis(leading: textFieldsContainer.leadingAnchor, trailing: textFieldsContainer.trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        logInButton.anchorHeight(equalToConstant: 60)
    }
    func anchorSignInAlternativeLabel() {
        addSubview(signInAlternativesLabel)
        signInAlternativesLabel.anchorCenter(horizontal: centerXAnchor, xConstant: 0, yConstant: 0)
        signInAlternativesLabel.anchorYAxis(top: logInButton.bottomAnchor, topConstant: 25, bottomConstant: 0)
        signInAlternativesLabel.sizeToFit()
        
    }
    func anchorSocialMediaButtonsStackView() {
        addSubview(socialMediaButtonsStackView)
        socialMediaButtonsStackView.anchorCenter(horizontal: centerXAnchor, xConstant: 0, yConstant: 0)
        socialMediaButtonsStackView.anchorHeight(equalToConstant: 100)
        socialMediaButtonsStackView.anchorWidth(equalToConstant: 140)
        socialMediaButtonsStackView.anchorYAxis(top: signInAlternativesLabel.bottomAnchor, topConstant: 8, bottomConstant: 0)
        socialMediaButtonsStackView.addArrangedSubview(logInTwitterButton)
        socialMediaButtonsStackView.addArrangedSubview(logInFacebookButton)
        logInFacebookButton.clipsToBounds = true
        logInTwitterButton.clipsToBounds = true
        
       
    }
  
    func setupViews(){
        anchorAnimationView()
        anchorDescriptionLabel()
        anchorTextFieldsContainer()
        anchorTextFieldsStackView()
        anchorSeparatorLineView()
        anchorLogInButton()
        anchorSignInAlternativeLabel()
        
        anchorSocialMediaButtonsStackView()
    }
    
}














class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 43, y: bounds.origin.y + 1, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 43, y: bounds.origin.y + 1, width: bounds.width + 10, height: bounds.height)
    }
    
}
extension LeftPaddedTextField {
    
    /// set icon of 20x20 with left padding of 8px
    func setLeftIcon(_ icon: UIImage) {
        
        let padding = 8
        let size = 25
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.contentMode = .scaleAspectFit
        iconView.image = icon
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
}


extension UIButton {
    func embedImage(imageToEmbed: UIImage){
        let embeddedImageView = UIImageView(image: imageToEmbed.withRenderingMode(.alwaysOriginal))
        embeddedImageView.contentMode = .scaleAspectFit
        addSubview(embeddedImageView)
        embeddedImageView.enableAutoLayout()
        embeddedImageView.anchorWidth(equalToConstant: 25)
        embeddedImageView.anchorHeight(equalToConstant: 25)
        embeddedImageView.anchorCenter(horizontal: centerXAnchor, vertical: centerYAnchor, xConstant: 0, yConstant: 0)
    }
}








