//
//  PersonViewController.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip
import RealmSwift

class PersonViewController: UIViewController {

    @IBOutlet weak var personListTableView: UITableView!
    
    private let realm = try! Realm()
    private var userDataList: Results<UserData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personListTableView.dataSource = self
        
        userDataList = realm.objects(UserData.self)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        personListTableView.reloadData()
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

extension PersonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(userDataList[indexPath.row].name)さん"
        cell.detailTextLabel?.text = "\(userDataList[indexPath.row].age)さん"
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
        
        return cell
    }
    
    
}

extension PersonViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "人物一覧")
    }
}
