import Foundation

class Point: CustomStringConvertible {
    var x, y: Double

    private init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    private init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }

    var description: String {
        return "x= \(self.x), y= \(self.y)"
    }

    static let factory = PointFactory.instance
    class PointFactory {
        
        private init() {}
        
        static let instance = PointFactory()

        func createCartesian(x: Double, y: Double) -> Point {
            return Point(x: x, y: y)
        }

        func createPolar(rho: Double, theta: Double) -> Point {
            return Point(rho: rho, theta: theta)
        }
    }
}



func main() {
    let point = Point.factory.createPolar(rho: 1, theta: 2)
    print(point)
}

main()


class Person
{
  var id: Int
  var name: String

  init(called name: String, withId id: Int)
  {
    self.name = name
    self.id = id
  }
}

class PersonFactory
{
  func createPerson(name: String) -> Person
  {
    return Person(called: name, withId: Date.now.timeIntervalSince1970)
  }
}
