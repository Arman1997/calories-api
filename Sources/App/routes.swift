import Fluent
import Vapor

func routes(_ app: Application) throws {
   
    try app.register(collection: CaloriesController())
    try app.register(collection: AuthController())
    try app.register(collection: UsersController())
}
