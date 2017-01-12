//
//  SearchViewController.swift
//  titi-cuidadores
//
//  Created by Bruno Gonçalves on 10/01/17.
//  Copyright © 2017 titi. All rights reserved.
//

import UIKit
import Alamofire
import DownPicker

class SearchViewController: BaseViewController, PopupContentViewController {

    var personDownPicker: DownPicker!
    @IBOutlet weak var ddlCateg: UITextField!
    @IBOutlet weak var txtCep: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pro = [
            ("Todos",0),
            ("Auxiliar/Técnico enfermagem",1),
            ("Enfermeiro Cuidador",2),
            ("Cuidador",3),
            ("Assessor Familiar Cuidador",7),
            ("Acompanhante Cuidador",8),
            ("Fisioterapeuta Cuidador",4),
            ("Educador Físico",6)
        ]
        let proText = [
            "Todos",
            "Auxiliar/Técnico enfermagem",
            "Enfermeiro Cuidador",
            "Cuidador",
            "Assessor Familiar Cuidador",
            "Acompanhante Cuidador",
            "Fisioterapeuta Cuidador",
            "Educador Físico"
        ]
        
        self.personDownPicker = DownPicker(textField: self.ddlCateg, withData: proText)
        self.personDownPicker.setPlaceholder("Selecione uma categoria")
        
    }
    
    @IBAction func searchButton(_ sender: Any) {
        let pacientesID = "22"
        var url = Helper.baseUrl + "relat/pesquisa_completa.php?cep=" + txtCep.text!
        url = url + "&atuacao=" + String(ProCategory.selectedIdCategory) + "&pacientesID=" + pacientesID
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(url, method: .post, encoding:JSONEncoding.default, headers: header).responseString { response in
            debugPrint(response)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layer.cornerRadius = 20
    }
    
    @IBAction func categoryButton(_ sender: Any) {
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
                if ProCategory.selectedCategory != "" {
                    self.searchButton.setTitle(ProCategory.selectedCategory
                        , for: .normal)
                }
            }
            .show(CategoryListPopupViewController.instance())
    }
    
    class func instance() -> SearchViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "search") as! SearchViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return CGSize(width: 300, height: 250)
    }
}
