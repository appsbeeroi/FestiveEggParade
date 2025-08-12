import Foundation


enum EasterEggQuizQuestion: CaseIterable {
    case q1, q2, q3, q4, q5, q6, q7, q8, q9, q10
    
    var text: String {
        switch self {
            case .q1:
                return "What is the traditional name for Easter egg painting in Russia?"
            case .q2:
                return "What does the red color on Easter eggs symbolize?"
            case .q3:
                return "Which natural ingredient is often used to dye eggs brown?"
            case .q4:
                return "What is the technique called when patterns are drawn with wax before dyeing the egg?"
            case .q5:
                return "What is the Russian traditional name for the marble-like pattern on eggs?"
            case .q6:
                return "On which day do people traditionally start dyeing eggs before Easter?"
            case .q7:
                return "What does the egg symbolize in Easter tradition?"
            case .q8:
                return "Which plant is often used to get a green tint on eggs?"
            case .q9:
                return "What is the name of the special tool set used for wax painting on eggs?"
            case .q10:
                return "What is the popular Russian name for hand-decorated Easter eggs?"
        }
    }
    
    var index: Int {
        switch self {
            case .q1:
                1
            case .q2:
                2
            case .q3:
                3
            case .q4:
                4
            case .q5:
                5
            case .q6:
                6
            case .q7:
                7
            case .q8:
                8
            case .q9:
                9
            case .q10:
                10
        }
    }
    
    var image: ImageResource {
        switch self {
            case .q1:
                    .Images.Erudite.img1
            case .q2:
                    .Images.Erudite.img2
            case .q3:
                    .Images.Erudite.img3
            case .q4:
                    .Images.Erudite.img4
            case .q5:
                    .Images.Erudite.img5
            case .q6:
                    .Images.Erudite.img1
            case .q7:
                    .Images.Erudite.img2
            case .q8:
                    .Images.Erudite.img3
            case .q9:
                    .Images.Erudite.img4
            case .q10:
                    .Images.Erudite.img5
        }
    }
    
    var options: [Option] {
        switch self {
            case .q1:
                return [
                    .init(letter: "A", text: "Pysanka"),
                    .init(letter: "B", text: "Icon painting"),
                    .init(letter: "C", text: "Lace making"),
                    .init(letter: "D", text: "Filigree")
                ]
            case .q2:
                return [
                    .init(letter: "A", text: "Joy of spring"),
                    .init(letter: "B", text: "Fertility"),
                    .init(letter: "C", text: "The blood of Christ"),
                    .init(letter: "D", text: "The Sun")
                ]
            case .q3:
                return [
                    .init(letter: "A", text: "Onion skins"),
                    .init(letter: "B", text: "Beetroot"),
                    .init(letter: "C", text: "Coffee"),
                    .init(letter: "D", text: "Oak bark")
                ]
            case .q4:
                return [
                    .init(letter: "A", text: "Marbling"),
                    .init(letter: "B", text: "Wax-resist painting"),
                    .init(letter: "C", text: "Embossing"),
                    .init(letter: "D", text: "Engraving")
                ]
            case .q5:
                return [
                    .init(letter: "A", text: "Mramorka"),
                    .init(letter: "B", text: "Silver pattern"),
                    .init(letter: "C", text: "Pysanka"),
                    .init(letter: "D", text: "Carving")
                ]
            case .q6:
                return [
                    .init(letter: "A", text: "Maundy Thursday"),
                    .init(letter: "B", text: "Good Friday"),
                    .init(letter: "C", text: "Lazarus Saturday"),
                    .init(letter: "D", text: "Palm Sunday")
                ]
            case .q7:
                return [
                    .init(letter: "A", text: "Life and resurrection"),
                    .init(letter: "B", text: "Harvest"),
                    .init(letter: "C", text: "Health"),
                    .init(letter: "D", text: "Longevity")
                ]
            case .q8:
                return [
                    .init(letter: "A", text: "Parsley"),
                    .init(letter: "B", text: "Spinach"),
                    .init(letter: "C", text: "Nettle"),
                    .init(letter: "D", text: "Birch leaves")
                ]
            case .q9:
                return [
                    .init(letter: "A", text: "Brushes"),
                    .init(letter: "B", text: "Pysachok"),
                    .init(letter: "C", text: "Carving knives"),
                    .init(letter: "D", text: "Engraver")
                ]
            case .q10:
                return [
                    .init(letter: "A", text: "Painted eggs"),
                    .init(letter: "B", text: "Pysanky"),
                    .init(letter: "C", text: "Decoupage eggs"),
                    .init(letter: "D", text: "Engraved eggs")
                ]
        }
    }
    
    var correctAnswer: String {
        switch self {
            case .q1: return "A"
            case .q2: return "C"
            case .q3: return "A"
            case .q4: return "B"
            case .q5: return "A"
            case .q6: return "A"
            case .q7: return "A"
            case .q8: return "C"
            case .q9: return "B"
            case .q10: return "B"
        }
    }
    
    static func defineResult(by correntCount: Int) -> EruditeGameResultType {
        switch correntCount {
            case 0...3:
                    .chick
            case 4...7:
                    .eggMaster
            case 8...10:
                    .guardian
            default:
                    .chick
        }
    }
}
