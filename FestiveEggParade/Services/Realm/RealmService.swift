import RealmSwift
import Foundation

final class RealmService {
    
    static let shared = RealmService()
    
    private var realm: Realm?
    
    private init() {
        Task {
            await initRealm()
        }
    }
    
    @RealmActor
    func insertOrUpdateObject<T: Object>(_ object: T) async {
        guard let realm else { return }
        
        do {
            try realm.write {
                realm.add(object, update: .all)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @RealmActor
    func fetchAllObjects<T: Object>() async -> [T] {
        while realm == nil {
            await Task.yield()
        }
        
        guard let realm else { return [] }
        let objects = realm.objects(T.self)
        
        return Array(objects)
    }
    
    @RealmActor
    func deleteObject<T: Object>(_ type: T.Type, withPrimaryKey key: UUID) async {
        guard let realm,
              let object = realm.object(ofType: T.self, forPrimaryKey: key) else { return }
        
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @RealmActor
    func deleteAllObjects() async {
        guard let realm else { return }
        
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    @RealmActor
    private func initRealm() async {
        do {
            realm = try await Realm(configuration: .defaultConfiguration, actor: RealmActor.shared)
            await initDefaultTechnologies()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @RealmActor
    private func initDefaultTechnologies() async {
        if !UserDefaults.standard.bool(forKey: "defaultTechnologiesDidLoaded") {
            await withTaskGroup(of: Void.self) { [weak self] group in
                guard let self else { return }
                for technology in defaultEggsTechnologies {
                    group.addTask {
                        await self.insertOrUpdateObject(technology)
                    }
                }
                
                await group.waitForAll()
            }
        }
    }
}

fileprivate let defaultEggsTechnologies: [FavoriteEggTechnologyObject] = [
    FavoriteEggTechnologyObject(type: .onion),
    FavoriteEggTechnologyObject(type: .herbsAndLeaves),
    FavoriteEggTechnologyObject(type: .marble),
    FavoriteEggTechnologyObject(type: .naturalColorants),
    FavoriteEggTechnologyObject(type: .pysanka),
]
