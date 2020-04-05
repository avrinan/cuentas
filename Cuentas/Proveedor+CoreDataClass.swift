//
//  Proveedor+CoreDataClass.swift
//  
//
//  Created by Daniel Bonini on 10/18/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Proveedor)
public class Proveedor: NSManagedObject {

    class func create(with rut: Int64, inManagedObjectContext context:NSManagedObjectContext) -> Proveedor? {
        let request  : NSFetchRequest<Proveedor> = Proveedor.fetchRequest()
        request.predicate = NSPredicate(format: "rut = %d", rut)
        
        if let em = (try? context.fetch(request))?.first {
            return em
        } else if let em = NSEntityDescription.insertNewObject(forEntityName: "Proveedor", into: context) as? Proveedor {
            em.rut = rut
            em.nombre = ""
            em.ramo = ""
            
            return em
        }
        
        return nil
    }
    
}
