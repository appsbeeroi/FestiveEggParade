import SwiftUI

struct InspirationFavoriteView: View {
    
    @ObservedObject var viewModel: InspirationViewModel
    
    @State private var isShowEggTechnologyDetailView = false
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            let favorites = viewModel.technologies.filter( { $0.isFavorite } )
            
            VStack(spacing: 0) {
                navigationSection
                
                if favorites.isEmpty {
                    StumbView()
                        .padding(.top, 28)
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 12) {
                            ForEach(favorites) { model in
                                EggTechnologyCellView(model: model) { model in
                                    viewModel.selectedEggTechnologyModel = model
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        isShowEggTechnologyDetailView.toggle()
                                    }
                                }
                            }
                        }
                        .padding(.top, 28)
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 35)
            
            NavigationLink(isActive: $isShowEggTechnologyDetailView) {
                EggTechnologyDetailView(viewModel: viewModel)
            } label: {
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var navigationSection: some View {
        HStack(spacing: 20) {
            BackButton()
            
            Text("Favorites")
                .font(.rammetto(with: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(LinearGradient.baseGradient)
        }
    }
}


