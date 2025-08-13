import SwiftUI

struct SplashScreen: View {
    
    @Binding var isShowMainFlow: Bool
    
    @State private var isStartAnimating = false
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .resizable()
                .scaledToFill()
            
            VStack(spacing: 12) {
                Image(.Images.goldEgg)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 60)
                
                VStack(spacing: 8) {
                    Text("Festive Egg ")
                        .strokeText(fontSize: 40)

                    Text("Parade")
                        .strokeText(fontSize: 40)
                }
                .font(.rammetto(with: 40))
                .foregroundStyle(LinearGradient.baseGradient)
                .opacity(isStartAnimating ? 1 : 0)
                .animation(.smooth(duration: 3), value: isStartAnimating)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isStartAnimating = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        isShowMainFlow = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen(isShowMainFlow: .constant(false))
}


