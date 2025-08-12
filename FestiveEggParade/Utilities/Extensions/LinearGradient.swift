import SwiftUI

extension LinearGradient {
    static var baseGradient: LinearGradient {
        LinearGradient(
            colors: [
                .baseWhite,
                .baseYellow
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
