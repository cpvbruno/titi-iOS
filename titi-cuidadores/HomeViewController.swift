//
//  HomeViewController.swift
//  titi-cuidadores
//
//  Created by Bruno Gonçalves on 06/01/17.
//  Copyright © 2017 titi. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var categLabel: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        categLabel.layer.cornerRadius = 20
        /*categLabel.layer.shadowColor = UIColor.black.cgColor
        categLabel.layer.shadowOffset = CGSize.zero
        categLabel.layer.shadowOpacity = 0.1
        categLabel.layer.shadowRadius = 5*/
        
    }

    @IBAction func searchButton(_ sender: Any) {
        PopupController
            .create(self)
            .customize(
                [
                    .animation(.slideUp),
                    .scrollable(false),
                    .backgroundStyle(.blackFilter(alpha: 0.7))
                ]
            )
            .didShowHandler { popup in
                //print("showed popup!")
            }
            .didCloseHandler { _ in
                //print("closed popup!")
            }
            .show(SearchViewController.instance())
    }
}
