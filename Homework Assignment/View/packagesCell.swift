//
//  packagesCells.swift
//  Homework Assignment
//
//  Created by Yusuf DEMİRKOPARAN on 27.04.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import TinyConstraints

class packagesCell : UITableViewCell {
    // -  Properties
    lazy var packageNameLabel : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 25, weight: .bold)
        lbl.textColor                 = .white
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 1
        return lbl
    }()
    lazy var packageDescLabel : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 10)
        lbl.textColor                 = .white
        
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        return lbl
    }()
    lazy var packagePriceLabel : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 40, weight: .bold)
        lbl.textColor                 = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        return lbl
    }()
    lazy var packageType : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 25, weight: .semibold)
        lbl.textColor                 = .white
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        return lbl
    }()
    lazy var data : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor                 = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        lbl.text                      = "Data"
        return lbl
    }()
    lazy var dataVal : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.textColor                 = .white
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        return lbl
    }()
    lazy var sms : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor                 = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        lbl.text                      = "Sms"
        return lbl
    }()
    lazy var smsVal : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.textColor                 = .white
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        
        return lbl
    }()
    lazy var talk : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor                 = #colorLiteral(red: 0.9413685203, green: 0.8570379615, blue: 0.03474674374, alpha: 1)
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        lbl.text                      = "Talk"
        return lbl
    }()
    lazy var talkVal : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.textColor                 = .white
        lbl.textAlignment             = NSTextAlignment.left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        return lbl
    }()
    lazy var backgroundImage : UIImageView =  {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "Background")
        return img
    }()
    lazy var BGview : UIView = {
        let view = UIView()
        return view
    }()
    lazy var favoriteBtn : UIButton = {
        var btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "rib"), for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 80)
      
        return btn
        
    }()
    // -   Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.addSubview(BGview)
        
        BGview.addSubview(backgroundImage)
        backgroundImage.edgesToSuperview()
        BGview.edgesToSuperview(insets: .top(5) + .left(5) + .bottom(5) + .right(5))
        BGview.addSubview(packageNameLabel)
        BGview.addSubview(packagePriceLabel)
        BGview.addSubview(packageType)
        BGview.addSubview(data)
        BGview.addSubview(sms)
        BGview.addSubview(talk)
        BGview.addSubview(dataVal)
        BGview.addSubview(smsVal)
        BGview.addSubview(talkVal)
        BGview.addSubview(packageDescLabel)
        BGview.addSubview(favoriteBtn)
        
        packageNameLabel.top(to: backgroundImage, offset: 15)
        packageNameLabel.left(to: backgroundImage, offset : 10)
        packageNameLabel.width(UIScreen.main.bounds.width*0.5)
        
        favoriteBtn.top(to: self, offset: +5)
        favoriteBtn.leftToRight(of: packageNameLabel)
        favoriteBtn.right(to: self, offset: -15)
        favoriteBtn.width(UIScreen.main.bounds.width*0.1)
        favoriteBtn.height(50)
       
        
        packagePriceLabel.topToBottom(of: packageNameLabel)
        packagePriceLabel.left(to: self, offset: 15)
        packagePriceLabel.width(UIScreen.main.bounds.width*0.5)
        
        packageType.topToBottom(of: packagePriceLabel)
        packageType.left(to: self, offset: 15)
        packageType.width(UIScreen.main.bounds.width*0.5)
        
        data.topToBottom(of: packageNameLabel, offset: +5)
        data.leftToRight(of: packagePriceLabel,offset: +5)
        data.width(UIScreen.main.bounds.width*0.13)
        
        sms.topToBottom(of: packageNameLabel, offset: +5)
        sms.leftToRight(of: data)
        sms.width(UIScreen.main.bounds.width*0.13)
        
        talk.topToBottom(of: packageNameLabel, offset: +5)
        talk.leftToRight(of: sms)
        talk.width(UIScreen.main.bounds.width*0.13)
        
        dataVal.topToBottom(of: data  )
        dataVal.leftToRight(of: packagePriceLabel ,offset: +5 )
        dataVal.width(UIScreen.main.bounds.width*0.13)
        
        smsVal.topToBottom(of: sms)
        smsVal.leftToRight(of: dataVal)
        smsVal.width(UIScreen.main.bounds.width*0.13)
        
        talkVal.topToBottom(of: talk)
        talkVal.leftToRight(of: smsVal)
        talkVal.width(UIScreen.main.bounds.width*0.13)
        
        packageDescLabel.topToBottom(of: talkVal)
        packageDescLabel.leftToRight(of: packageType)
        packageDescLabel.width(UIScreen.main.bounds.width*0.4)
        packageDescLabel.height(UIScreen.main.bounds.width*0.1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
