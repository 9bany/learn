import Foundation

class Rectangle: CustomStringConvertible {
    var _width = 0
    var _height = 0
    
    var width: Int {
        get { return _width }
        set(value) {
            _width = value
        }
    }

    var height: Int {
        get { return _height }
        set(value) {
            _height = value
        }
    }

    init() {}
    init(_ width: Int,_ height: Int) {
        _width = width
        _height = height
    }

    var area: Int {
        return width*height
    }

    public var description: String {
        return "Width: \(width), height: \(height)"
    }
}

class Square: Rectangle {
    override var width: Int {
        get { return _width }
        set(value) { 
            _width = value
            _height = value
        }
    }
    override var height: Int {
        get { return _height }
        set(value) { 
            _width = value
            _height = value
        }
    }
}

func setAndMeasure(_ rc: Rectangle) {
    rc.width = 3
    rc.height = 4
    print("Expected area to be 12 but got \(rc.area)")
}

func main() {
    let rc = Rectangle()
    setAndMeasure(rc)

    let sq = Square()

    setAndMeasure(sq)
}

main()
