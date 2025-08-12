import Foundation

struct FavoriteEggTechnologyModel: Identifiable, Equatable {
    var id: UUID
    var type: EggTechnologyType
    var isFavorite: Bool
    
    init(from object: FavoriteEggTechnologyObject) {
        self.id = object.id
        self.type = object.type
        self.isFavorite = object.isFavorite
    }
    
    mutating func changeFavoriteStatus() {
        isFavorite.toggle()
    }
}
