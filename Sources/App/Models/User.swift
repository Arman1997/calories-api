//
//  File.swift
//  
//
//  Created by Arman Galstyan on 05.10.21.
//

import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "user"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "firstName")
    var firstName: String
    
    @Field(key: "lastName")
    var lastName: String
    
    @Field(key: "isAdmin")
    var isAdmin: Bool
    
    @Field(key: "threshold")
    var threshold: Int

    init() { }

    init(id: UUID? = nil,
         firstName: String,
         lastName: String,
         isAdmin: Bool,
         threshold: Int) {
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.isAdmin = isAdmin
        self.threshold = threshold
    }
}
