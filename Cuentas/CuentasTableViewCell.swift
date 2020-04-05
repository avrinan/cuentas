//
//  CFETableViewCell.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 6/10/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit
import CoreData

class CuentasTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var caeLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    
    var certificado : Cuenta? {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        if let cfe = self.certificado {

            var serie: String?
            var fecha: String?
            var importe: String?
            cfe.managedObjectContext?.performAndWait {
                serie = cfe.serie + " - " + (cfe.numero.stringValue)
                fecha = cfe.fechaCompra.toString(dateStyle: .short, timeStyle: .none)
                importe = cfe.monto.string(with: .currency)
            }
            caeLabel?.text = serie
            fechaLabel?.text = fecha
            precioLabel?.text = importe
        }
    }
}
