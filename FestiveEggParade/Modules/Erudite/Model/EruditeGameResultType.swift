enum EruditeGameResultType {
    case chick
    case eggMaster
    case guardian
    
    var title: String {
        switch self {
            case .chick:
                "CHICK"
            case .eggMaster:
                "EGG DYE MASTER"
            case .guardian:
                "GUARDIAN OF TRADITIONS"
        }
    }
    var icon: String {
        switch self {
            case .chick:
                "🐥"
            case .eggMaster:
                "🎨"
            case .guardian:
                "🕊️"
        }
    }
}
