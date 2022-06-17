import Foundation

class Target {

    func request() -> String {
        return "Target: The default target's behavior."
    }
}
class Adaptee {

    public func specificRequest() -> String {
        return ".eetpadA eht fo roivaheb laicepS"
    }
}
class Adapter: Target {

    private var adaptee: Adaptee

    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }

    override func request() -> String {
        return "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
    }
}
class Client {
    
    static func someClientCode(target: Target) {
        print(target.request())
    }
}

class AdapterConceptual: XCTestCase {

    func testAdapterConceptual() {
        print("Client: I can work just fine with the Target objects:")
        Client.someClientCode(target: Target())

        let adaptee = Adaptee()
        print("Client: The Adaptee class has a weird interface. See, I don't understand it:")
        print("Adaptee: " + adaptee.specificRequest())

        print("Client: But I can work with it via the Adapter:")
        Client.someClientCode(target: Adapter(adaptee))
    }
}