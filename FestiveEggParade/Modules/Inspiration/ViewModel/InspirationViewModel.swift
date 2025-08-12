import Foundation

final class InspirationViewModel: ObservableObject {
    
    private let realmService = RealmService.shared
    
    @Published var selectedEggTechnologyModel: FavoriteEggTechnologyModel?
    
    @Published private(set) var technologies: [FavoriteEggTechnologyModel] = []
    @Published private(set) var isLoading = true
    
    @RealmActor
    func changeFavoriteStatusOfSelectedModel() async {
        guard let id = selectedEggTechnologyModel?.id,
              let index = technologies.firstIndex(where: { $0.id == id }) else { return }
        var newModel = technologies[index]
        
        newModel.changeFavoriteStatus()
        
        let object = FavoriteEggTechnologyObject(from: newModel)
        
        Task { [weak self] in
            guard let self else { return }
            
            await realmService.insertOrUpdateObject(object)
            
            await MainActor.run {
                self.technologies[index].changeFavoriteStatus()
            }
        }
    }
    
    @RealmActor
    func load() async {
        let technologies: [FavoriteEggTechnologyObject] = await self.realmService.fetchAllObjects()
        let models = technologies.map { FavoriteEggTechnologyModel(from: $0) }
        
        await MainActor.run {
            self.isLoading = false
            self.technologies = models
        }
    }
}
