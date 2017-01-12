//
//  ViewController.swift
//  titi-cuidadores
//
//  Created by Bruno Gonçalves on 03/01/17.
//  Copyright © 2017 titi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "titi-logo")
        imageView.image = logo
        self.navigationItem.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
