
import Fluent
import Vapor

struct UsersController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let calories = routes.grouped("users")
        calories.get(use: index)
        calories.post(use: create)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        user.id = UUID()
        return user.save(on: req.db).map { user }
    }
}
