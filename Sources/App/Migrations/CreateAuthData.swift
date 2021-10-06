
import Fluent

struct CreateAuthData: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("auth_data")
            .id()
            .field("token", .string, .required)
            .field("userID", .uuid, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("auth_data").delete()
    }
}
