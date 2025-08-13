import UIKit

final class CollectionViewModel: ObservableObject {
    
    private let realmService = RealmService.shared
    private let imageStorage = ImageStorageService.shared
    
    @Published private(set) var eggs: [EggModel] = []
    
    func loadEggs() {
        Task { @RealmActor [weak self] in
            guard let self else { return }
            let eggs: [EggObject] = await realmService.fetchAllObjects()
            
            var newModels: [EggModel] = []
            
            for egg in eggs {
                let image = await self.imageStorage.loadImage(from: egg.imagePath) ?? UIImage()
                let model = EggModel(from: egg, and: image)
                
                newModels.append(model)
            }
            
            let safeNewModels = newModels
            
            await MainActor.run {
                self.eggs = safeNewModels
            }
        }
    }
    
    func save(_ rawModel: RawEggModel) {
        Task { [weak self] in
            guard let self,
                  let image = rawModel.image,
                  let imagePath = await imageStorage.saveImage(image, for: rawModel.id) else { return }
            
            
            let model = EggModel(from: rawModel)
            let object = EggObject(from: model, and: imagePath)
            
            await realmService.insertOrUpdateObject(object)
            
            await MainActor.run {
                self.eggs.append(model)
            }
        }
    }
    
    func remove(_ model: EggModel) {
        Task { @RealmActor [weak self] in
            guard let self,
                  let imagePath = await imageStorage.saveImage(model.image, for: model.id) else { return }
            
            let object = EggObject(from: model, and: imagePath)
            
            await realmService.deleteObject(EggObject.self, withPrimaryKey: object.id)
            await imageStorage.deleteImage(for: object.id)
            
            await MainActor.run {
                guard let index = self.eggs.firstIndex(where: { $0.id == model.id }) else { return }
                self.eggs.remove(at: index)
            }
        }
    }
}
