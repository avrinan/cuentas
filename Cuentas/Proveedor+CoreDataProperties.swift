//
//  Proveedor+CoreDataProperties.swift
//  
//
//  Created by Daniel Bonini on 10/18/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Proveedor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Proveedor> {
        return NSFetchRequest<Proveedor>(entityName: "Proveedor")
    }

    @NSManaged public var nombre: String
    @NSManaged public var ramo: String
    @NSManaged public var rut: Int64
    @NSManaged public var cuentas: NSSet

}

// MARK: Generated accessors for cuentas
extension Proveedor {

    @objc(addCuentasObject:)
    @NSManaged public func addToCuentas(_ value: Cuenta)

    @objc(removeCuentasObject:)
    @NSManaged public func removeFromCuentas(_ value: Cuenta)

    @objc(addCuentas:)
    @NSManaged public func addToCuentas(_ values: NSSet)

    @objc(removeCuentas:)
    @NSManaged public func removeFromCuentas(_ values: NSSet)

}
