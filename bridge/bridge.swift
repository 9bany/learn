import Foundation

protocol Render {
    func renderCircle(_ radius: Float)
}

class VectorRender: Render {
    func renderCircle(_ radius: Float) {
        print("Drwing a circle of the radius \(radius)")
    }
}

class RasterRender: Render {
    func renderCircle(_ radius: Float) { 
        print("Drwing pixels for a circle of the radius \(radius)")
    }
}

protocol Shape {
    func draw()
    func resize(_ factor: Float)
}

class Circle: Shape {
    var radius: Float
    var render: Render
    init(_ render: Render, _ radius: Float) {
        self.render = render
        self.radius = radius
    }
    func draw() {
        render.renderCircle(self.radius)
    }
    func resize(_ factor: Float) {
        radius *= factor
    }
}

func main() {
    let raster = RasterRender()
    let vector = VectorRender()
    let circle = Circle(vector,5)
    circle.draw()
    circle.resize(2)
    circle.draw()
}

main()