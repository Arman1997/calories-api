
import Fluent
import Vapor

final class AuthData: Model, Content {
    
    static let schema = "auth_data"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "token")
    var token: String

    @Field(key: "userID")
    var userID: UUID

    init() { }

    init(id: UUID? = UUID(),
         token: String,
         userID: UUID) {
        
        self.id = id
        self.token = token
        self.userID = userID
    }
}
