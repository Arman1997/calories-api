
import Fluent

struct CreateAuthData: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("auth_data")
            .id()
            .field("userID", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("auth_data").delete()
    }
}
