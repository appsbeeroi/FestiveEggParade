import RealmSwift

enum EggMark: String, Identifiable, CaseIterable, PersistableEnum {
    var id: Self { self }
    
    case work
    case shopping
    case gift
    
    var title: String {
        switch self {
            case .work:
                "MANUAL WORK"
            case .shopping:
                "SHOPPING"
            case .gift:
                "GIFT"
        }
    }
    
    var icon: String {
        switch self {
            case .work:
                "👐"
            case .shopping:
                "🛒"
            case .gift:
                "🎁"
        }
    }
}
