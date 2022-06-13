import Foundation

class SingletonDatabase {
    var capitals = [String: Int]()
    static var instanceCount = 0
    static var instance = SingletonDatabase()

    private init() {
        type(of: self).instanceCount += 1 
        print("initializing database")
    }

}