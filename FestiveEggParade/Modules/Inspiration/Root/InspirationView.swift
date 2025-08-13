import SwiftUI

struct InspirationView: View {
    
    @StateObject private var viewModel = InspirationViewModel()
    
    @Binding var isShowTabBar: Bool
    
    @State private var isShowFavoriteView = false
    @State private var isShowEggTechnologyDetailView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.Images.background)
                    .expandToFill()
                
                VStack(spacing: 0) {
                    navigationSection
                    technologyListSection
                }
                .padding(.top, 28)
                .padding(.horizontal, 35)
                
                NavigationLink(isActive: $isShowEggTechnologyDetailView) {
                    EggTechnologyDetailView(viewModel: viewModel)
                } label: {
                    EmptyView()
                }
                
                NavigationLink(isActive: $isShowFavoriteView) {
                    InspirationFavoriteView(viewModel: viewModel)
                } label: {
                    EmptyView()
                }

            }
            .setLoader(isLoading: viewModel.isLoading)
            .onAppear {
                isShowTabBar = true
                Task { await viewModel.load() }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private var navigationSection: some View {
        HStack(spacing: 5) {
            VStack(spacing: 0) {
                Text("Easter")
                    .strokeText(fontSize: 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.baseWhite)
                
                Text("Inspiration")
                    .strokeText(fontSize: 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.baseYellow)
                    .offset(y: -20)
            }
            
            Button {
                isShowTabBar = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {isShowFavoriteView.toggle()
                }
            } label: {
                Image(.Images.Inspiration.likeButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 57, height: 47)
            }
            .offset(y: -10)
        }
    }
    
    private var technologyListSection: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 12) {
                Text("Egg technology")
                    .strokeText(fontSize: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(LinearGradient.baseGradient)
                
                VStack(spacing: 12) {
                    ForEach(viewModel.technologies) { model in
                        EggTechnologyCellView(model: model) { model in
                            isShowTabBar = false
                            viewModel.selectedEggTechnologyModel = model
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isShowEggTechnologyDetailView.toggle()
                            }
                        }
                    }
                }
            }            
            .padding(.top, 10)
            .padding(.bottom, 100)
        }
        .highPriorityGesture(DragGesture(minimumDistance: 30))
    }
}

#Preview {
    NavigationView {
        InspirationView(isShowTabBar: .constant(false))
    }
}
