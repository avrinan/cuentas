//
//  CFETableViewController.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 6/11/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit
import CoreData

class CuentasTableViewController: CoreDataTableViewController {

    // MARK: PROPERTIES
    
    var managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    var codigoCapturado = "" {
        didSet {
            createBill(from: codigoCapturado)
        }
    }
    
    // MARK: APP - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame = self.view.bounds
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(CuentasUITableViewSectionHeader.self, forHeaderFooterViewReuseIdentifier: CuentasUITableViewSectionHeader.reuseIdentifier)
        
        if let context = managedObjectContext {
            let request = NSFetchRequest<Cuenta>(entityName: "Cuenta")
            request.sortDescriptors = [NSSortDescriptor(key: "fechaCompra", ascending: false), NSSortDescriptor(key: "fechaCarga", ascending: false)]
            fetchedResultsController = NSFetchedResultsController<Cuenta>(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: "sectionTitle",
                cacheName: nil)
            
            addCFE()
            //createCFEFromURL("https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.54,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=")
        } else {
            fetchedResultsController = nil
        }
    }
    
    // MARK: CUENTAS
    
    fileprivate func createBill(from url: String) {
        if let metaDataArray = parseURL(url) {
            let fechaComprobante = Date(fromString: metaDataArray[5], format: DateFormatType.custom("yyyyMMdd"))!
            let fechaCargaComprobante = Date()
            let tipoComprobante = Int16(metaDataArray[1])!
            let monto = Double(metaDataArray[4])!
            let numeroComprobante = Int64(metaDataArray[3])!
            let serieComprobante = metaDataArray[2]
            let codigoSeguridad = metaDataArray[6]
            let rut = Int64(metaDataArray[0])!
            
            if let context = managedObjectContext {
                let cuenta = Cuenta(context: context)
                //cuenta.fechaCompra = fechaComprobante
                cuenta.setValue(fechaComprobante, forKey: "fechaCompra")
                //cuenta.fechaCarga = fechaCargaComprobante
                cuenta.setValue(fechaCargaComprobante, forKey: "fechaCarga")
                //cuenta.tipoComprobante = tipoComprobante
                cuenta.setValue(tipoComprobante, forKey: "tipoComprobante")
                //cuenta.monto = monto
                cuenta.setValue(monto, forKey: "monto")
                //cuenta.numero = numeroComprobante
                cuenta.setValue(numeroComprobante, forKey: "numero")
                //cuenta.serie = serieComprobante
                cuenta.setValue(serieComprobante, forKey: "serie")
                //cuenta.codigo = codigoSeguridad
                cuenta.setValue(codigoSeguridad, forKey: "codigo")
                //cuenta.url = url
                cuenta.setValue(url, forKey: "url")
                //cuenta.proveedor = Proveedor.create(with: rut, inManagedObjectContext: context)!
                cuenta.setValue(Proveedor.create(with: rut, inManagedObjectContext: context)!, forKey: "proveedor")
                do {
                    try context.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    // Sample URL: https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=
    // Sample Query: 210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=
    private func addCFE() {
        var urlText = "https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw="
        createBill(from: urlText)
        
        urlText = "https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,AZ,0438959,1347.52,20160528,/tml+akY4tv6Nx1Ryvpr7JcSdnw="
        createBill(from: urlText)
        
        urlText = "https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,AB,0438999,147.52,20160628,/tml+akY4tv6Nx1Ryvpr7JcSdnw="
        createBill(from: urlText)
        
        urlText = "https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,AC,0438969,447.52,20180630,/tml+akY4tv6Nx1Ryvpr7JcSdnw="
        createBill(from: urlText)
    }
    
    // MARK: TABLEVIEW
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CuentasUITableViewSectionHeader.reuseIdentifier) as? CuentasUITableViewSectionHeader else {
            return nil
        }
        
        if let sections = fetchedResultsController?.sections , sections.count > 0 {
            header.customLabel.text = sections[section].name
            return header
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cuentaCell", for: indexPath)

        if let cfe = fetchedResultsController?.object(at: indexPath) {
            if let cfeCell = cell as? CuentasTableViewCell {
                cfeCell.certificado = cfe
            }            
        }
        return cell
    }
}

private func parseURL(_ url: String) -> [String]? {
    return url.split(separator: "?").map(String.init).last?.split(separator: ",").map(String.init)
}

extension NSNumber {
    func string(with style: NumberFormatter.Style) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        return formatter.string(from: self)
    }
}
