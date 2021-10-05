import Fluent
import Vapor

struct CaloriesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let calories = routes.grouped("calories")
        calories.get(use: index)
        calories.post(use: create)
        calories.delete(use: delete)
        calories.put(use: update)
    }
    
    func index(req: Request) throws -> EventLoopFuture<[Calorie]> {
        return Calorie.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Calorie> {
        let calorie = try req.content.decode(Calorie.self)
        calorie.id = UUID()
        return calorie.save(on: req.db).map { calorie }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Calorie.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    func update(req: Request) throws -> EventLoopFuture<Calorie> {
        let item = try req.content.decode(Calorie.self)
        
        return Calorie.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { calorie in
                calorie.foodName = item.foodName
                calorie.caloriesValue = item.caloriesValue
                calorie.userID = item.userID
                
                return calorie.save(on: req.db).map { calorie }
            }
    }
    
}
