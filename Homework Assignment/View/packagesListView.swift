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
    
    // MARK: - Properties
    private var packagesListArray       : [Package] = []
    private var packagesFavoriteArray   : [Package] = []
    private var searchPackages          : [Package] = []
    private var searchFavoritePackages  : [Package] = []
    private var searching                = false
    private var sorting                  = false
    private let cellID                   = "cell"
    let service                          = packagesService()
    lazy var tableView                   = UITableView()
    lazy var searchBar                   : UISearchBar = {
        var search                       = UISearchBar()
        search.searchBarStyle  = UISearchBar.Style.prominent
        search.placeholder     = " Search..."
        search.sizeToFit()
        search.isTranslucent   = false
        search.barTintColor    = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        search.backgroundColor = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
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
        searchPackages = packagesListArray.filter({ $0.name.prefix( searchText.count ).lowercased() == searchText.lowercased() })
        searchFavoritePackages =  packagesFavoriteArray.filter({ $0.name.prefix( searchText.count ).lowercased() == searchText.lowercased() })
        searching = true
        reloadData()
    }
}

extension packagesListView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let favoriteArrayCount      = packagesFavoriteArray.count
        let searchinFavoriteArray   = searchFavoritePackages.count
        let searchPackagesArray     = searchPackages.count
        let packagesListCount       = packagesListArray.count
        
        if searching || sorting {
            let count = section == 0 && searchinFavoriteArray > 0 ? searchinFavoriteArray : searchPackagesArray
            return count
        }else {
            let count =  section == 0 && favoriteArrayCount > 0 ?  favoriteArrayCount :  packagesListCount
            return count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! packagesCell
        
        cell.favoriteBtn.tag = indexPath.row
        cell.favoriteBtn.addTarget(self, action: #selector(saveFavorite), for: .touchUpInside)
        
        if searching {
            if indexPath.section == 0 && searchFavoritePackages.count > 0 {
                cell.favoriteBtn.tintColor   = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
                cell.packageNameLabel.text   = searchFavoritePackages[indexPath.row].name
                cell.packagePriceLabel.text  = "\(searchFavoritePackages[indexPath.row].price) TL"
                cell.packageType.text        = searchFavoritePackages[indexPath.row].subscriptionType.rawValue.uppercased()
                cell.dataVal.text            = searchFavoritePackages[indexPath.row].tariff.data
                cell.smsVal.text             = searchFavoritePackages[indexPath.row].tariff.sms
                cell.talkVal.text            = searchFavoritePackages[indexPath.row].tariff.talk
                cell.packageDescLabel.text   = searchFavoritePackages[indexPath.row].desc
            } else {
                cell.favoriteBtn.tintColor   = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.packageNameLabel.text  = searchPackages[indexPath.row].name
                cell.packagePriceLabel.text = "\(searchPackages[indexPath.row].price) TL"
                cell.packageType.text       = searchPackages[indexPath.row].subscriptionType.rawValue.uppercased()
                cell.dataVal.text           = searchPackages[indexPath.row].tariff.data
                cell.smsVal.text             = searchPackages[indexPath.row].tariff.sms
                cell.talkVal.text            = searchPackages[indexPath.row].tariff.talk
                cell.packageDescLabel.text   = searchPackages[indexPath.row].desc
            }
        } else if sorting {
            if indexPath.section == 0 && searchFavoritePackages.count > 0 {
                cell.favoriteBtn.tintColor   = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
                cell.packageNameLabel.text   = searchFavoritePackages[indexPath.row].name
                cell.packagePriceLabel.text  = "\(searchFavoritePackages[indexPath.row].price) TL"
                cell.packageType.text        = searchFavoritePackages[indexPath.row].subscriptionType.rawValue.uppercased()
                cell.dataVal.text            = searchFavoritePackages[indexPath.row].tariff.data
                cell.smsVal.text             = searchFavoritePackages[indexPath.row].tariff.sms
                cell.talkVal.text            = searchFavoritePackages[indexPath.row].tariff.talk
                cell.packageDescLabel.text   = searchFavoritePackages[indexPath.row].desc
            }
            else {
                cell.favoriteBtn.tintColor   = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.packageNameLabel.text  = searchPackages[indexPath.row].name
                cell.packagePriceLabel.text = "\(searchPackages[indexPath.row].price) TL"
                cell.packageType.text       = searchPackages[indexPath.row].subscriptionType.rawValue.uppercased()
                cell.dataVal.text           = searchPackages[indexPath.row].tariff.data
                cell.smsVal.text            = searchPackages[indexPath.row].tariff.sms
                cell.talkVal.text           = searchPackages[indexPath.row].tariff.talk
                cell.packageDescLabel.text  = searchPackages[indexPath.row].desc
            }
            
        } else {
            
            if indexPath.section == 0 && packagesFavoriteArray.count > 0 {
                cell.favoriteBtn.tintColor   = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
                cell.packageNameLabel.text   = packagesFavoriteArray[indexPath.row].name
                cell.packagePriceLabel.text  = "\(packagesFavoriteArray[indexPath.row].price) TL"
                cell.packageType.text        = packagesFavoriteArray[indexPath.row].subscriptionType.rawValue.uppercased()
                cell.dataVal.text            = packagesFavoriteArray[indexPath.row].tariff.data
                cell.smsVal.text             = packagesFavoriteArray[indexPath.row].tariff.sms
                cell.talkVal.text            = packagesFavoriteArray[indexPath.row].tariff.talk
                cell.packageDescLabel.text   = packagesFavoriteArray[indexPath.row].desc
            } else {
                cell.favoriteBtn.tintColor   = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.packageNameLabel.text   = packagesListArray[indexPath.row].name
                cell.packagePriceLabel.text  = "\(packagesListArray[indexPath.row].price) TL"
                cell.packageType.text        = packagesListArray[indexPath.row].subscriptionType.rawValue.uppercased()
                cell.dataVal.text            = packagesListArray[indexPath.row].tariff.data
                cell.smsVal.text             = packagesListArray[indexPath.row].tariff.sms
                cell.talkVal.text            = packagesListArray[indexPath.row].tariff.talk
                cell.packageDescLabel.text   = packagesListArray[indexPath.row].desc
            }
        }
        setLoading(isLoading: false)
        return cell
    }
    @objc func saveFavorite(sender: UIButton) {
        if searching || sorting {
            saveFavoritePackages.shared.saveFavorite(favoritePackage: [searchPackages[sender.tag]])
        }else {
            saveFavoritePackages.shared.saveFavorite(favoritePackage: [packagesListArray[sender.tag]])
        }
        service.fetchFavotePackages { (Package) in
            self.updateFavoriPackageList(packageList: Package)
        }
    }
}

extension packagesListView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height*0.3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = packagesFavoriteArray.count > 0 ? 2: 1
        return count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.backgroundColor = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        label.textColor = #colorLiteral(red: 0.164084971, green: 0.224458307, blue: 0.2753816545, alpha: 1)
        if section == 0 && packagesFavoriteArray.count > 0 {
            label.text = "  Favoriler"
            return label
        }
        label.text =  "  Paketler"
        return label
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height*0.08
    }
}

extension packagesListView :  favoritePackagesListProtocol, packagesListProtocol {
    func filterPackges(packageList: [Package], with fav  : Bool ) {
        let yearly  = packageList.filter({ $0.subscriptionType.rawValue ==  "yearly" }).sorted(by: { $1.price < $0.price })
        let monthly = packageList.filter({ $0.subscriptionType.rawValue ==  "monthly" }).sorted(by: { $1.price < $0.price })
        let weekly  = packageList.filter({ $0.subscriptionType.rawValue ==  "weekly" }).sorted(by: { $1.price < $0.price })
        
        if fav {
            if sorting || searching {
                self.searchFavoritePackages.removeAll()
                self.searchFavoritePackages.append(contentsOf: yearly)
                self.searchFavoritePackages.append(contentsOf: monthly)
                self.searchFavoritePackages.append(contentsOf: weekly)
                 reloadData()
            }
            self.packagesFavoriteArray.removeAll()
            self.packagesFavoriteArray.append(contentsOf: yearly)
            self.packagesFavoriteArray.append(contentsOf: monthly)
            self.packagesFavoriteArray.append(contentsOf: weekly)
            reloadData()
        } else {
            self.packagesListArray.append(contentsOf: yearly)
            self.packagesListArray.append(contentsOf: monthly)
            self.packagesListArray.append(contentsOf: weekly)
            reloadData()
        }
        
    }
    
    func updateFavoriPackageList(packageList: [Package]) {
        filterPackges(packageList: packageList,with: true)
    }
    
    func updatePackageList(packageList: [Package]) {
        filterPackges(packageList: packageList, with: false)
    }
    
    func setLoading(isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
}



extension packagesListView : sortPackagesProtocol {
    func sortType(index: Int) {
        switch index {
        case 0:
            searchPackages = packagesListArray.sorted(by: { $1.tariff.data < $0.tariff.data })
            searchFavoritePackages = packagesFavoriteArray.sorted(by: { $1.tariff.data < $0.tariff.data })
            sorting = true
            reloadData()
            break
        case 1:
            searchPackages = packagesListArray.sorted(by: { $1.tariff.sms < $0.tariff.sms })
            searchFavoritePackages = packagesFavoriteArray.sorted(by: { $1.tariff.sms < $0.tariff.sms })
            sorting = true
            reloadData()
            break
        case 2:
            searchPackages = packagesListArray.sorted(by: { $1.tariff.talk < $0.tariff.talk })
            searchFavoritePackages = packagesFavoriteArray.sorted(by: { $1.tariff.talk < $0.tariff.talk })
            sorting = true
            reloadData()
            break
        default:
            break
        }
    }
}
