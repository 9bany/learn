import Foundation

class Point: CustomStringConvertible {
    var x, y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }

    static func createCartesian(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }

    static func createPolar(rho: Double, theta: Double) -> Point {
        return Point(rho: rho, theta: theta)
    }

    var description: String {
        return "x= \(self.x), y= \(self.y)"
    }
}

func main() {
    let point = Point.createPolar(rho: 1, theta: 2)
    print(point)
    


}

main()