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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let play = UIBarButtonItem(title: "Sort Options", style: .plain, target: self, action: #selector(onSheetTapped))
        navigationItem.rightBarButtonItem =  play
        self.view.addSubview(packageView)
        packageView.edgesToSuperview()
        
        
        
        service.fetchFavotePackages { (Package) in
             self.packageView.updateFavoriPackageList(packageList: Package)
        }
        service.fetchPackagesList { (Package) in
            self.packageView.updatePackageList(packageList: Package)
        }
       
        
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
