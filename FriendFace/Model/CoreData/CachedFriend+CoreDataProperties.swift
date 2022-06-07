//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 24/5/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName : String {
        name ?? "Unknown name"
    }

}

extension CachedFriend : Identifiable {

}
