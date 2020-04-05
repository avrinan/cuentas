//
//  Cuenta+CoreDataClass.swift
//  
//
//  Created by Daniel Bonini on 10/18/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Cuenta)
public class Cuenta: NSManagedObject {
    @objc var sectionTitle: String {
        let titulo = fechaCompra.toString(format: .monthYear)
        return titulo
    }
}
