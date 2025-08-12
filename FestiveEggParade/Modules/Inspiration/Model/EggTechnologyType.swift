import UIKit
import RealmSwift

enum EggTechnologyType: String, Identifiable, CaseIterable, PersistableEnum, Equatable {
    var id: Self { self }
    
    case onion
    case herbsAndLeaves
    case marble
    case naturalColorants
    case pysanka
    
    var title: String {
        switch self {
            case .onion:
                "Onion Skin Dyeing"
            case .herbsAndLeaves:
                "Decorating with Herbs and Leaves"
            case .marble:
                "Marble Dyeing"
            case .naturalColorants:
                "Dyeing with Natural Colorants"
            case .pysanka:
                "Wax-Resist Painting (Pysanka)"
        }
    }
    
    var description: String {
        switch self {
            case .onion:
                "A classic method where eggs are boiled together with onion skins, producing warm brown-golden shades."
            case .herbsAndLeaves:
                "Before dyeing, small leaves or herbs are placed on the egg and secured with gauze or nylon. After dyeing, they leave beautiful natural patterns."
            case .marble:
                "Eggs are wrapped in onion skins and pieces of colored fabric or paper, then boiled — the color settles in irregular patches, creating a marble effect."
            case .naturalColorants:
                "Beets, spinach, blueberries, turmeric, and other foods are used to achieve bright and safe colors."
            case .pysanka:
                "Patterns are applied to the shell with melted wax before dyeing. Once the wax is removed, the design remains in the original shell color."
        }
    }
    
    var image: ImageResource {
        switch self {
            case .onion:
                    .Images.Inspiration.onion1
            case .herbsAndLeaves:
                    .Images.Inspiration.onion2
            case .marble:
                    .Images.Inspiration.onion3
            case .naturalColorants:
                    .Images.Inspiration.onion1
            case .pysanka:
                    .Images.Inspiration.onion2
        }
    }
}
