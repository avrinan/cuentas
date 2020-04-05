//
//  QRViewController.swift
//  QRReaderDemo
//
//  Created by Daniel Bonini on 9/10/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {
    
    
    @IBOutlet weak var scannedBarText: UITextField! {
        didSet {
            scannedBarText.textColor = UIColor.blue
        }
    }
    
    @IBAction func loadScannedBar(segue: UIStoryboardSegue) {
        scannedBarText?.text = (segue.source.contentViewController as? QRCaptureViewController)?.messageMetaData
    }
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? navcon
        } else {
            return self
        }
    }
}
