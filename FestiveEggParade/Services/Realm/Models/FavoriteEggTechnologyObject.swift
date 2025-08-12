import Foundation
import RealmSwift

final class FavoriteEggTechnologyObject: Object {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var type: EggTechnologyType
    @Persisted var isFavorite: Bool
    
    convenience init(from model: FavoriteEggTechnologyModel) {
        self.init()
        self.id = model.id
        self.type = model.type
        self.isFavorite = model.isFavorite
    }
    
    convenience init(type: EggTechnologyType) {
        self.init()
        self.id = UUID()
        self.type = type
        self.isFavorite = false 
    }
}
