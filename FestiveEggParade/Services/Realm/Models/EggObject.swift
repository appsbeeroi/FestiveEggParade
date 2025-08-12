import Foundation
import RealmSwift

final class EggObject: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var title: String
    @Persisted var date: Date
    @Persisted var source: String
    @Persisted var imagePath: String
    @Persisted var mark: EggMark
    
    convenience init(from model: EggModel, and imagePath: String) {
        self.init()
        self.id = model.id
        self.title = model.title
        self.date = model.date
        self.source = model.source
        self.imagePath = imagePath
        self.mark = model.mark
    }
}
