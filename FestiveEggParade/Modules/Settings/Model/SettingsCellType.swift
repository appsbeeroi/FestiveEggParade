enum SettingsCellType: Identifiable, CaseIterable {
    var id: Self { self }

    case privacy
    case notifications
    case about
    
    var title: String {
        switch self {
            case .privacy:
                "Privacy Policy"
            case .notifications:
                "Notification"
            case .about:
                "About the application"
        }
    }
    
    #warning("вставить ссылки")
    var link: String {
        switch self {
            case .privacy:
                "https://sites.google.com/view/festiveeggparade/privacy-policy"
            case .about:
                "https://sites.google.com/view/festiveeggparade/home"
            default:
                ""
        }
    }
}
