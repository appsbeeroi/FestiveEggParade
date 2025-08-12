import SwiftUI

struct EruditeView: View {
    
    @State private var isShowGameView = false
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    navigationSection
                    image
                    descriptionSection
                    playButton
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 35)
            }
            
            NavigationLink(isActive: $isShowGameView) {
                EruditeGameView(isActiveNavigation: $isShowGameView)
            } label: {
                EmptyView()
            }
        }
    }
    
    private var navigationSection: some View {
        VStack {
            Text("EASTER ERUDITE")
                .font(.rammetto(with: 30))
                .foregroundStyle(LinearGradient.baseGradient)
                .padding(.top, 70)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private var image: some View {
        Image(.Images.goldEgg)
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 35)
    }
    
    private var descriptionSection: some View {
        Text("Check how well you know the Easter traditions, symbols and techniques of egg decoration")
            .font(.rammetto(with: 15))
            .foregroundStyle(LinearGradient.baseGradient)
            .multilineTextAlignment(.center)
    }
    
    private var playButton: some View {
        Button {
            isShowGameView = true
        } label: {
            Image(.Images.playButton)
                .resizable()
                .scaledToFit()
                .frame(width: 156, height: 72)
        }
        .padding(.bottom, 130)
    }
}

#Preview {
    EruditeView()
}
