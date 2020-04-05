//
//  Cuenta+CoreDataProperties.swift
//  
//
//  Created by Daniel Bonini on 10/18/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Cuenta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cuenta> {
        return NSFetchRequest<Cuenta>(entityName: "Cuenta")
    }

    @NSManaged public var codigo: String
    @NSManaged public var fechaCarga: Date
    @NSManaged public var fechaCompra: Date
    @NSManaged public var monto: Double
    @NSManaged public var numero: Int64
    @NSManaged public var serie: String
    @NSManaged public var tipoComprobante: Int16
    @NSManaged public var url: String
    @NSManaged public var proveedor: Proveedor

}
