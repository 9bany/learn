import Foundation

protocol Printer {
    func print(d: Document)
}

protocol Scaner {
    func scan(d: Document)
}

protocol Fax {
    func fax(d: Document)
}
protocol MultiFunctionDevice: Scaner, Printer, Fax {}

class Document {}

class MFP: MultiFunctionDevice {
    func print(d: Document) {}
    func scan(d: Document) {}
    func fax(d: Document) {}
}

class OldFashinoedPrinter: Scaner, Printer {
    func print(d: Document) {}
    func scan(d: Document) {}
}