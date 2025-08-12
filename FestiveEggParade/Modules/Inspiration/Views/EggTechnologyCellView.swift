import SwiftUI

struct EggTechnologyCellView: View {
    
    let model: FavoriteEggTechnologyModel
    let navigationAction: (FavoriteEggTechnologyModel) -> Void
    
    var body: some View {
        Button {
            navigationAction(model)
        } label: {
            VStack(spacing: 7) {
                Image(model.type.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 163)
                    .clipped()
                    .cornerRadius(20)
                
                Text(model.type.title)
                    .strokeText(fontSize: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(LinearGradient.baseGradient)
            }
            .padding(.top, 11)
            .padding(.horizontal, 11)
            .padding(.bottom, 15)
            .background(.baseRed)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.baseLightRed, lineWidth: 1)
            }
        }
    }
}
