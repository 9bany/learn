// Goemetric shapes

import Foundation

class GraphicObject: CustomDebugStringConvertible {
    var name: String = "Group"
    var color: String = ""
    var children = [GraphicObject]()

    init() {}

    init(name:String) {
        self.name = name 
    }

    private func print(_ buffer: inout String, _ depth: Int) {
        buffer.append(String(repeating: "*", count: depth))
        buffer.append(self.color.isEmpty ? "" : "\(self.color)")
        buffer.append("\(self.name)\n")

        for child in children {
            child.print(&buffer, depth)
        }
    }

    var debugDescription: String {
        var buffer = ""
        print(&buffer, 2)
        return buffer
    }
}

class Square: GraphicObject {
    init(_ color: String) {
        super.init(name: "Square")
        self.color = color
    }
}

class Circle: GraphicObject {
    init(_ color: String) {
        super.init(name: "Circle")
        self.color = color
    }
}


func main() {
    let drawing = GraphicObject(name: "My drawing")
    drawing.children.append(Circle("red"))
    drawing.children.append(Square("yellow"))

    let group = GraphicObject(name: "Group")
    group.children.append(Circle("blue"))
    group.children.append(Square("blue"))

    drawing.children.append(group)
    print(drawing)
}

main()