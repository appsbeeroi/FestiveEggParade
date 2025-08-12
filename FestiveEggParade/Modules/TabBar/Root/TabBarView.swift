import SwiftUI

struct TabBarView: View {
    
    @State private var selection: TabViewState = .inspiration
    @State private var isSHowTabBar = true
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            VStack(spacing: 0) {
                TabView(selection: $selection) {
                    InspirationView(isShowTabBar: $isSHowTabBar)
                        .tag(TabViewState.inspiration)
                    
                    CollectionView(isShowTabBar: $isSHowTabBar)
                        .tag(TabViewState.collection)
                    
                    Text("erudite")
                        .tag(TabViewState.erudite)
                    
                    Text("settings")
                        .tag(TabViewState.settings)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .background(Color.clear)
            }
            
            VStack {
                if isSHowTabBar {
                    CustomTabBarView(selectedState: $selection)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .animation(.smooth, value: isSHowTabBar)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TabBarView()
}
