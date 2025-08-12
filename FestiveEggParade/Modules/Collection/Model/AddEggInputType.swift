enum AddEggInputType {
    case title
    case date
    case source
    
    var placeholder: String {
        switch self {
            case .title:
                "Title"
            case .date:
                "Date"
            case .source:
                "Source"
        }
    }
}
