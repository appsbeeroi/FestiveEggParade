import UIKit

enum TabViewState: Identifiable, CaseIterable {
    var id: Self { self }
    
    case inspiration
    case collection
    case erudite
    case settings
    
    var icon: ImageResource {
        switch self {
            case .inspiration:
                    .Images.TabBar.inspiration
            case .collection:
                    .Images.TabBar.collection
            case .erudite:
                    .Images.TabBar.erudite
            case .settings:
                    .Images.TabBar.settings
        }
    }
    
    var selectedIcon: ImageResource {
        switch self {
            case .inspiration:
                    .Images.TabBar.selectedInspiration
            case .collection:
                    .Images.TabBar.selectedCollection
            case .erudite:
                    .Images.TabBar.selectedErudite
            case .settings:
                    .Images.TabBar.selectedSettings
        }
    }
}
