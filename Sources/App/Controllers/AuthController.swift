
import Fluent
import Vapor

struct AuthController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let calories = routes.grouped("tokens")
        calories.get(use: index)
    }
    
    func index(req: Request) throws -> EventLoopFuture<User> {
        return AuthData.find(req.parameters.get("token"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { $0.userID }
            .flatMap { User.find($0, on: req.db).unwrap(or: Abort(.notFound)) }
    }
}
