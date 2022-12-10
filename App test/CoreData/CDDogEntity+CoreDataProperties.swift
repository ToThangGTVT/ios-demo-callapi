//
//  CDDogEntity+CoreDataProperties.swift
//  App test
//
//  Created by ToThang on 12/10/22.
//
//

import Foundation
import CoreData


extension CDDogEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDogEntity> {
        return NSFetchRequest<CDDogEntity>(entityName: "CDDogEntity")
    }

    @NSManaged public var url: String?
    @NSManaged public var isFavorite: Bool

}

extension CDDogEntity : Identifiable {

}
