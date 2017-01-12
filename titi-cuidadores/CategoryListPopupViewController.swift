//
//  DemoPopupViewController2.swift
//  PopupController
//
//  Created by 佐藤 大輔 on 2/4/16.
//  Copyright © 2016 Daisuke Sato. All rights reserved.
//

import UIKit

class CategoryListPopupViewController: UIViewController, PopupContentViewController, UITableViewDataSource {
    
    var pro = [
        ("Todos",0),
        ("Auxiliar/Técnico enfermagem",1),
        ("Enfermeiro Cuidador",2),
        ("Cuidador",3),
        ("Assessor Familiar Cuidador",7),
        ("Acompanhante Cuidador",8),
        ("Fisioterapeuta Cuidador",4),
        ("Educador Físico",6)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layer.cornerRadius = 20
    }
    
    class func instance() -> CategoryListPopupViewController {
        let storyboard = UIStoryboard(name: "CategoryList", bundle: nil)
        return storyboard.instantiateInitialViewController() as! CategoryListPopupViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryListCell
        let (text, id) = pro[(indexPath as NSIndexPath).row]
        cell.titleLabel.text = text
        return cell
    }
    
   private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let (text, id) = pro[(indexPath as NSIndexPath).row]
        ProCategory.selectedCategory = text
        ProCategory.selectedIdCategory = id
    }
    
}

class CategoryListCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}
