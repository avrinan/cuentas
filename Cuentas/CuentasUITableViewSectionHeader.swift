//
//  CuentasUITableViewSectionHeader.swift
//  Cuentas
//
//  Created by Daniel Bonini on 11/1/18.
//  Copyright © 2018 Daniel Bonini. All rights reserved.
//

import UIKit

class CuentasUITableViewSectionHeader: UITableViewHeaderFooterView {
    static let reuseIdentifier = "CuentasHeaderReuseIdentifier"
    let customLabel = UILabel.init()
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        customLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        customLabel.textColor = UIColor.white
        customLabel.backgroundColor = UIColor.init(red: 0x00, green: 0x86, blue: 0xb9, alpha: 1.0)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(customLabel)
        
        let margins = contentView.layoutMarginsGuide
        customLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        //customLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        customLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        //customLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
