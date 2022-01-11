//
//  RegistViewController.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import UIKit
import RealmSwift
import XLPagerTabStrip

class RegistViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    private let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toolBarSetupUI()
        // Do any additional setup after loading the view.
    }
    
    private func toolBarSetupUI() {
        let toolBar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(didTapDoneButton))
        
        toolBar.items = [space, done]
        toolBar.sizeToFit()
        
        nameTextField.inputAccessoryView = toolBar
        ageTextField.inputAccessoryView = toolBar
    }
    
    @objc func didTapDoneButton() {
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
    }
    
    @IBAction func registButton(_ sender: Any) {
        let user = UserData()
        user.name = nameTextField.text!
        user.age = Int(ageTextField.text!) ?? 0
        
        try! realm.write({
            realm.add(user)
        })
        
        nameTextField.text = ""
        ageTextField.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegistViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "人物登録")
    }
}
