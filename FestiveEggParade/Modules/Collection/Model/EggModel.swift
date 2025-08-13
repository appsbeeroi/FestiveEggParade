import UIKit

struct EggModel: Identifiable, Equatable {
    var id: UUID
    var title: String
    var date: Date
    var source: String
    var image: UIImage
    var mark: EggMark
    
    init(from rawModel: RawEggModel) {
        self.id = rawModel.id
        self.title = rawModel.title ?? ""
        self.date = rawModel.date ?? Date()
        self.source = rawModel.source ?? ""
        self.image = rawModel.image ?? UIImage()
        self.mark = rawModel.mark ?? .gift
    }
    
    init(from object: EggObject, and image: UIImage) {
        self.id = object.id
        self.title = object.title
        self.date = object.date
        self.date = object.date
        self.source = object.source
        self.image = image
        self.mark = object.mark
    }
}

struct RawEggModel {
    var id: UUID
    var title: String?
    var date: Date?
    var source: String?
    var image: UIImage?
    var mark: EggMark?
    
    var isAvailable: Bool {
        title != nil && date != nil && source != nil && mark != nil && image != nil
    }
    
    init() {
        self.id = UUID()
    }
    
    init(from model: EggModel) {
        self.id = model.id
        self.title = model.title
        self.date = model.date
        self.source = model.source
        self.image = model.image
        self.mark = model.mark
    }
}
