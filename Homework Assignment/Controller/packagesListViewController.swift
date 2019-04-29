//
//  ViewController.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 22.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import SwiftyJSON
import TinyConstraints
class packagesListViewController: UIViewController {
    
    let service  = packagesService()
    let packageView : packagesListView = {
        let view = packagesListView()
        return view
    }()
    lazy var barButton : UIButton = {
        var btn = UIButton()
        btn.setTitle("Sort Options", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.1691342294, green: 0.2282071114, blue: 0.2877430022, alpha: 1), for: .normal)
       return btn
    }()
    var shadowImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        let play = UIBarButtonItem(customView: barButton)
        navigationItem.rightBarButtonItem =  play
        
        barButton.addTarget(self, action: #selector(onSheetTapped), for: .touchUpInside)
        
        self.view.addSubview(packageView)
        packageView.edgesToSuperview()
        
        
        service.fetchFavotePackages { (Package) in
            self.packageView.updateFavoriPackageList(packageList: Package)
        }
        service.fetchPackagesList { (Package) in
            self.packageView.updatePackageList(packageList: Package)
        }
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func onSheetTapped() {
        let sheet = UIAlertController(title: "Sort Options", message: "Choose a Sort", preferredStyle: .actionSheet)
        let Data = UIAlertAction(title: "Sort by: Data", style: .default) { (UIAlertAction) in
            self.packageView.sortType(index: 0)
        }
        
        let Sms = UIAlertAction(title: "Sort by: Sms", style: .default) { (UIAlertAction) in
            self.packageView.sortType(index: 1)
        }
        
        let Talk = UIAlertAction(title: "Sort by: Talk", style: .default) { (UIAlertAction) in
            self.packageView.sortType(index: 2)
        }
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(Data)
        sheet.addAction(Sms)
        sheet.addAction(Talk)
        sheet.addAction(Cancel)
        present(sheet, animated: true, completion: nil)
    }
}
