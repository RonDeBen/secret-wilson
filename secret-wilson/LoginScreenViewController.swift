//
//  LoginScreenViewController.swift
//  secret-wilson
//
//  Created by Ron De Benedetti on 9/20/19.
//  Copyright © 2019 updogma. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var findARoomToNicknameConstraint: NSLayoutConstraint!
    
    var imagePicker = UIImagePickerController()
    let mask = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        avatarButton.imageView?.contentMode = .scaleAspectFit
        mask.image = UIImage(named: "CircleMask")
        mask.frame = avatarButton.imageView!.bounds
        mask.contentMode = .scaleAspectFit
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
         let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.findARoomToNicknameConstraint.constant = (keyboardRect!.size.height - 70)
        })
    }

    @objc func keyboardWillHide(notification: NSNotification){
         UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.findARoomToNicknameConstraint.constant = 10
        })
    }
    
    
    @IBAction func circlePlusButtonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
    
        
        avatarButton.setImage(pickedImage, for: .normal)
        avatarButton.imageView?.contentMode = .scaleToFill
        avatarButton.imageView?.mask = mask
        
        let circleBorder = UIImageView(image: UIImage(named: "CircleBorder"))
        circleBorder.frame = mask.frame
        circleBorder.contentMode = .scaleAspectFit
        avatarButton.addSubview(circleBorder)
    }
 
    dismiss(animated: true, completion: nil)
}
    
    @IBAction func findARoomButtonPressed(_ sender: Any) {
    }
}
