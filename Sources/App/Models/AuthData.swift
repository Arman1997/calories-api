
import Fluent
import Vapor

final class AuthData: Model, Content {
    
    static let schema = "auth_data"
        
    @ID(custom: "id")
    var id: String?

    @Field(key: "userID")
    var userID: UUID

    init() { }

    init(id: String?,
         userID: UUID) {
        
        self.id = id
        self.userID = userID
    }
}
