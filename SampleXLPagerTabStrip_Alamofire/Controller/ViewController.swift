//
//  ViewController.swift
//  SampleXLPagerTabStrip_Alamofire
//
//  Created by 祥平 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        setupUI()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToViewController(at: 1, animated: false)
        moveToViewController(at: 0, animated: false)
    }
    
    func setupUI() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 20)
        settings.style.buttonBarLeftContentInset = 10
        settings.style.buttonBarRightContentInset = 10
        settings.style.buttonBarItemLeftRightMargin = 32
        settings.style.selectedBarHeight = 2.0
        changeCurrentIndexProgressive = { oldCell, newCell, progressPercentage, changeCurrentIndex, animated in
            guard changeCurrentIndex, let oldCell = oldCell, let newCell = newCell else { return }

            oldCell.contentView.backgroundColor = .white
            oldCell.label.textColor = .black
            
            newCell.contentView.backgroundColor = .blue
            newCell.label.textColor = .white
        }
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let registVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "regist")
        let personVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "personList")
        
        return [registVC, personVC]
    }
}

