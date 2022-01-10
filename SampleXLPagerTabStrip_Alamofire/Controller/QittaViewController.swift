//
//  QittaViewController.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import UIKit

final class QittaViewController: UIViewController {

    @IBOutlet weak var qittaListTableView: UITableView!
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qittaListTableView.dataSource = self
        getArticles()
        // Do any additional setup after loading the view.
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

private extension QittaViewController {
    func getArticles() {
        APIClient().request { result in
            switch result {
            case .success(let articles):
                self.articles = articles
                DispatchQueue.main.async {
                    self.qittaListTableView.reloadData()
                }
            case .failure(let error):
                self.showAPIAlert(error: error)
            }
        }
    }
    
    func showAPIAlert(error: APIError) {
        let alert = UIAlertController(title: error.title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "閉じる", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension QittaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    
}
