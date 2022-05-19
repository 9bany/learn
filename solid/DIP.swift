import Foundation

enum RelationShip {
    case parent
    case child
    case subling
}

class Person {
    var name = ""
    init(_ name: String) {
        self.name = name
    }
}

protocol ReletionshipBrowser {
    func findAllChildrenOf(_ name: String) -> [Person]
}

class RelationShips: ReletionshipBrowser {
    private var relations = [(Person, RelationShip, Person)]()

    func addParentAndChild(_ p: Person, _ c: Person) {
        relations.append((p, .parent, c))
        relations.append((c, .child, p))
    }

    func findAllChildrenOf(_ name: String) -> [Person] {
        return self.relations.filter({ $0.name == name && $1 == .parent && $2 === $2  }).map{ $2 }
    }
}

class Research {
    // init(_ relationships: RelationShips) {
    //     let relations = relationships.relations
    //     for r in relations where r.0.name == "John" && r.1 == .parent {
    //         print("John has a child called \(r.2.name)")
    //     }
    // }

    init(_ browser: ReletionshipBrowser) {
        for element in browser.findAllChildrenOf("John") {
            print("John has a child called \(element.name)")
        }
    }
}

func main() {
    let parent = Person("John")
    let child1 = Person("Chris")
    let child2 = Person("Matt")

    let relationships = RelationShips() 
    relationships.addParentAndChild(parent, child1)
    relationships.addParentAndChild(parent, child2)

    let _ = Research(relationships)
}

main()