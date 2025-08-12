import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedState: TabViewState
    
    var body: some View {
        HStack {
            ForEach(TabViewState.allCases) { state in
                Button {
                    selectedState = state
                } label: {
                    Image(selectedState == state ? state.selectedIcon : state.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 57, height: 47)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.top, 25)
        .padding(.horizontal, 35)
        .padding(.bottom, 33)
        .background(.baseRed)
        .border(.black)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}
