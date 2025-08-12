import SwiftUI

@main
struct FestiveEggParadeApp: App {
        
    @State private var isShowMainFlow = false
    
    var body: some Scene {
        WindowGroup {
            if isShowMainFlow {
                TabBarView()
                    .onAppear {
                        Task {
                            await EggReminderService.shared.requestPermission()
                        }
                    }
            } else {
                SplashScreen(isShowMainFlow: $isShowMainFlow)
            }
        }
    }
}
