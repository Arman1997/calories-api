
import Fluent
import Vapor

final class Calorie: Model, Content {
    static let schema = "calories"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "foodName")
    var foodName: String
    
    @Field(key: "caloriesValue")
    var caloriesValue: Int
    
    @Field(key: "userID")
    var userID: String
    
    @Timestamp(key: "dateAdded", on: .create, format: .iso8601)
    var dateAdded: Date?

    init() { }

    init(id: UUID? = nil,
         foodName: String,
         caloriesValue: Int,
         userID: String,
         dateAdded: Date) {
        
        self.id = id
        self.foodName = foodName
        self.caloriesValue = caloriesValue
        self.userID = userID
        self.dateAdded = dateAdded
    }
}
