import SwiftUI

struct EggTechnologyDetailView: View {
    
    @ObservedObject var viewModel: InspirationViewModel
  
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            VStack(spacing: 0) {
                navigationSection
                
                VStack(spacing: 26) {
                    image
                    techonologyInformationSection
                }
                .padding(.top, 15)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 28)
            .padding(.horizontal, 35)
        }
        .navigationBarBackButtonHidden()
    }
    
    private var navigationSection: some View {
        HStack {
            BackButton()
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.changeFavoriteStatusOfSelectedModel()
                }
            } label: {
                let appropriateModel = viewModel.technologies.first(where: { $0.id == viewModel.selectedEggTechnologyModel?.id })
                
                Image((appropriateModel?.isFavorite ?? false) ?
                    .Images.Inspiration.likeButton :
                        .Images.Inspiration.unlikedButton)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 57, height: 47)
            }
        }
    }
    
    private var image: some View {
        Image(viewModel.selectedEggTechnologyModel?.type.image ?? .Images.Inspiration.onion1)
            .resizable()
            .scaledToFill()
            .frame(height: 215)
            .clipped()
            .cornerRadius(25)
            .allowsHitTesting(false)
            .overlay(alignment: .topTrailing) {
                Text("CLASSIC")
                    .frame(width: 80, height: 36)
                    .font(.rammetto(with: 14))
                    .foregroundStyle(.baseWhite)
                    .background(.baseRed)
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.baseLightRed, lineWidth: 1)
                    }
                    .padding(10)
            }
    }

    private var techonologyInformationSection: some View {
        VStack(spacing: 16) {
            Text(viewModel.selectedEggTechnologyModel?.type.title ?? "")
                .strokeText(fontSize: 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(LinearGradient.baseGradient)
            
            VStack(spacing: 7) {
                Text("description")
                    .font(.rammetto(with: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.basePink)
                
                Text(viewModel.selectedEggTechnologyModel?.type.description ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.rammetto(with: 14))
                    .foregroundStyle(.baseWhite)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
