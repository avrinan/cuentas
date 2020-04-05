//
//  QRMetaDataViewControler.swift
//  QRReaderDemo
//
//  Created by Daniel Bonini on 3/9/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class QRMetaDataViewController: UIViewController {
    
    @IBOutlet weak var metaData: UITextView!
    
    var QRMetaData : String = "" {
        didSet {
            print("QRMetaData = \(QRMetaData)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metaData.text = QRMetaData
        let url = NSURLComponents(string: "https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=")!
        print("query = \(url.query!)")
        
        let paramsArray = url.query!.split { $0 == "," }.map(String.init)
        print("param query array = \(paramsArray)")
    }
    
}
