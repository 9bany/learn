import Foundation

class HtmlElement: CustomStringConvertible {
    var name = ""
    var text = ""
    var elements = [HtmlElement]()

    private let indentSize = 2

    init() {}
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }

    private func description(_ indent: Int) -> String {
        var result = ""
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"
        if !text.isEmpty {
            result += String(repeating: " ", count: (indent + 1))
            result += text
            result += "\n"
        }
        for e in elements {
            result += e.description(indent + 1)    
        }
        result += "\(i)</\(name)>\n"
        return result
    }

    public var description: String {
        return description(0)
    }
}

class HemlBuilder: CustomStringConvertible {
    private let rootName: String
    var root = HtmlElement()

    init(rootName: String) {
        self.rootName = rootName
        root.name = rootName
    }

    func addChild(name: String, text: String) {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
    }

    public var description: String {
        return root.description
    }
    
    func clear() {
        root = HtmlElement(name: rootName, text: "")
    }
}
func main() {

    let builder = HemlBuilder(rootName: "ul")
    builder.addChild(name: "li", text: "hello")
    builder.addChild(name: "li", text: "word")

    print(builder)
}

main()