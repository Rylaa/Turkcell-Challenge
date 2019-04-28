//
//  Home.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 23.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//


import UIKit
import SwiftyJSON
import TinyConstraints

class packagesListView : UIView  {
    
    // TODO SEARCH YAPARKEN KÜÇÜK BÜYÜK DURUMANA BAK
    
    // MARK: - Properties
    private var packagesListArray : [Package] = []
    private var searchPackages : [Package] = []
    private var sortTariff     : [Package] = []
    private var searching = false
    private var sorting   = false
    private let cellID = "cell"
    lazy var tableView = UITableView()
    lazy var searchBar : UISearchBar = {
        var search = UISearchBar()
        search.searchBarStyle = UISearchBar.Style.prominent
        search.placeholder = " Search..."
        search.sizeToFit()
        search.isTranslucent = false
        search.layer.borderWidth = 0
        search.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        search.barTintColor = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        search.layer.shadowOffset = CGSize(width: 0, height: 0)
        return search
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        addSubview(searchBar)
        addSubview(tableView)
        searchBar.top(to: self, offset: UIScreen.main.bounds.height*0.1)
        searchBar.width(UIScreen.main.bounds.width)
        searchBar.delegate = self
        
        
        tableView.topToBottom(of: searchBar)
        tableView.width(UIScreen.main.bounds.width)
        tableView.height(UIScreen.main.bounds.height*0.9)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(packagesCell.self, forCellReuseIdentifier: cellID)
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    } 
}
// MARK: - Handlers



extension packagesListView : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchPackages = packagesListArray.filter({ $0.name.prefix( searchText.count ) == searchText })
        searching = true
        reloadData()
    }
}

extension packagesListView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let group1 = packagesListArray.filter( { $0.didUseBefore  } ).count
        let group2 = packagesListArray.filter( { !$0.didUseBefore } ).count
        if searching {
            let g1 = searchPackages.filter({ $0.didUseBefore }).count
            let g2 = searchPackages.filter({ !$0.didUseBefore }).count
            if section == 0 {  return g1 } else { return g2 }
        }
        if sorting {
            let g1 = searchPackages.filter({ $0.didUseBefore }).count
            let g2 = searchPackages.filter({ !$0.didUseBefore }).count
            if section == 0 {  return g1 } else { return g2 }
        }
        if section == 0 {  return group1 } else { return group2 }
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! packagesCell
        
        let group1 = packagesListArray.filter( { $0.didUseBefore } )
        let group2 = packagesListArray.filter( { !$0.didUseBefore } )
        
        let packages = indexPath.section == 0 ? group1 : group2
        cell.packageNameLabel.text   = packages[indexPath.row].name
        cell.packagePriceLabel.text  = "\(packages[indexPath.row].price) TL"
        cell.packageType.text        = packages[indexPath.row].subscriptionType.rawValue.uppercased()
        cell.dataVal.text            = packages[indexPath.row].tariff.data
        cell.smsVal.text             = packages[indexPath.row].tariff.sms
        cell.talkVal.text            = packages[indexPath.row].tariff.talk
        cell.packageDescLabel.text   = packages[indexPath.row].desc
        
        if searching {
            cell.packageNameLabel.text  = searchPackages[indexPath.row].name
            cell.packagePriceLabel.text = "\(packages[indexPath.row].price) TL"
            cell.packageType.text       = searchPackages[indexPath.row].subscriptionType.rawValue.uppercased()
            cell.dataVal.text           = searchPackages[indexPath.row].tariff.data
            cell.smsVal.text             = searchPackages[indexPath.row].tariff.sms
            cell.talkVal.text            = searchPackages[indexPath.row].tariff.talk
            cell.packageDescLabel.text   = searchPackages[indexPath.row].desc
        }
        
        if sorting {
            cell.packageNameLabel.text  = searchPackages[indexPath.row].name
            cell.packagePriceLabel.text = "\(packages[indexPath.row].price) TL"
            cell.packageType.text       = searchPackages[indexPath.row].subscriptionType.rawValue.uppercased()
            cell.dataVal.text           = searchPackages[indexPath.row].tariff.data
            cell.smsVal.text             = searchPackages[indexPath.row].tariff.sms
            cell.talkVal.text            = searchPackages[indexPath.row].tariff.talk
            cell.packageDescLabel.text   = searchPackages[indexPath.row].desc
        }
        return cell
    }
}



extension packagesListView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height*0.3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.backgroundColor = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        label.textColor = #colorLiteral(red: 0.164084971, green: 0.224458307, blue: 0.2753816545, alpha: 1)
        if section == 0 {
            label.text = "  Favoriler"
            return label
        } else {
            label.text =  "  Paketler"
            return label
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height*0.08
    }
    
    
}



extension packagesListView :  favoritePackagesListProtocol, packagesListProtocol {
    
    func subscriptionType(packageList: [Package]) {
        let yearly = packageList.filter({ $0.subscriptionType.rawValue ==  "yearly" }).sorted(by: { $1.price < $0.price })
        self.packagesListArray.append(contentsOf: yearly)
        
        let monthly = packageList.filter({ $0.subscriptionType.rawValue ==  "monthly" }).sorted(by: { $1.price < $0.price })
        self.packagesListArray.append(contentsOf: monthly)
        
        let weekly = packageList.filter({ $0.subscriptionType.rawValue ==  "weekly" }).sorted(by: { $1.price < $0.price })
        self.packagesListArray.append(contentsOf: weekly)
        
    }
    
    func updateFavoriPackageList(packageList: [Package]) {
        subscriptionType(packageList: packageList)
    }
    
    func updatePackageList(packageList: [Package]) {
        subscriptionType(packageList: packageList)
    }
    
    func setLoading(isLoading: Bool) {
        
    }
}



extension packagesListView : sortPackagesProtocol {
    func sortType(index: Int) {
        switch index {
        case 0:
            searchPackages = packagesListArray.sorted(by: { $1.tariff.data < $0.tariff.data })
            sorting = true
            reloadData()
            break
        case 1:
            searchPackages = packagesListArray.sorted(by: { $1.tariff.sms < $0.tariff.sms })
            sorting = true
            reloadData()
            break
        case 2:
            searchPackages = packagesListArray.sorted(by: { $1.tariff.talk < $0.tariff.talk })
            sorting = true
            reloadData()
            break
        default:
            break
        }
        
        
    }
    
    
}
