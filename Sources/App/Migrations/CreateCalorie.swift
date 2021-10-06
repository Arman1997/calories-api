
import Fluent

struct CreateCalorie: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("calories")
            .id()
            .field("foodName", .string, .required)
            .field("caloriesValue", .int, .required)
            .field("userID", .string, .required)
            .field("dateAdded", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("calories").delete()
    }
}
