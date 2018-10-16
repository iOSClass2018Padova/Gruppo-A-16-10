//
//  User.swift
//  CinemaApp
//
//  Created by Francesco on 16/10/2018.
//  Copyright © 2018 Francesco. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class User: Object {
    
    dynamic var name : String?
    dynamic var surname : String?
    dynamic var mail : String?
    dynamic var password : String!
    
    dynamic var id : String?
    
    convenience init (name : String? = nil, surname : String? = nil, mail : String? = nil, password : String? = nil) {
        
        self.init()
        
        self.name = name
        self.surname = surname
        self.mail = mail
        self.password = password
        
        self.id = UUID().uuidString
        
    }
    
    
    func add(in realm: Realm = try! Realm(configuration: RealmUtils.config)) {
        do {
            try realm.write {
                realm.add(self)
            }
        } catch {}
    }
    
    static func all(in realm: Realm = try! Realm(configuration: RealmUtils.config)) -> [User] {
        return Array(realm.objects(User.self))
    }
    
    func remove(in realm: Realm = try! Realm(configuration: RealmUtils.config)) {
        do {
            try realm.write {
                realm.delete(self)
            }
        } catch {}
    }
}
