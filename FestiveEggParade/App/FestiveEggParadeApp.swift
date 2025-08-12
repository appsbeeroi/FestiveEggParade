import SwiftUI

@main
struct FestiveEggParadeApp: App {
        
    @State private var isShowMainFlow = false
    
    var body: some Scene {
        WindowGroup {
            if isShowMainFlow {
                TabBarView()
            } else {
                SplashScreen(isShowMainFlow: $isShowMainFlow)
            }
        }
    }
}
