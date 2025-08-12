import Foundation

struct Option: Identifiable, Equatable {
    let letter: String
    let text: String
    
    var id: String {
        text + letter
    }
}
