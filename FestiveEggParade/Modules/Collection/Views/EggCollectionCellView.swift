import SwiftUI

struct EggCollectionCellView: View {
    
    let model: EggModel
    
    var body: some View {
        VStack(spacing: 7) {
            Image(uiImage: model.image)
                .resizable()
                .scaledToFill()
                .frame(height: 163)
                .clipped()
                .cornerRadius(20)
                .overlay(alignment: .topTrailing) {
                    HStack(spacing: 0) {
                        Text(model.mark.icon)
                            .font(.system(size: 16))
                        
                        Text(model.mark.title)
                            .font(.rammetto(with: 14))
                            .foregroundStyle(.baseWhite)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 13)
                    .background(.baseRed)
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.baseLightRed, lineWidth: 1)
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 10)
                }
            
            Text(model.title)
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
