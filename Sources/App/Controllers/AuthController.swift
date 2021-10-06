
import Fluent
import Vapor

struct AuthController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let tokens = routes.grouped("tokens")
        tokens.group(":token") { token in
            token.post(use: create)
        }
    }
    
    func create(req: Request) throws -> EventLoopFuture<User> {
        let authData = AuthData.query(on: req.db).filter(\.$token == req.parameters.get("token") ?? "").all(\.$userID)

        return authData
            .map { $0.first }
            .unwrap(or: Abort(.notFound))
            .flatMap { User.find($0, on: req.db).unwrap(or: Abort(.notFound)) }
    }
}
