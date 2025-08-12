import SwiftUI

struct EruditeAnswerCellView: View {
    
    let option: Option
    
    @Binding var selectedOption: Option?
        
    var body: some View {
        Button {
            selectedOption = option
        } label: {
            HStack(spacing: 8) {
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.baseYellow)
                    .overlay {
                        Text(option.letter)
                            .strokeText(fontSize: 15)
                            .foregroundStyle(.baseWhite)
                    }
                
                Text(option.text)
                    .strokeText(fontSize: 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.baseWhite)
            }
            .frame(minHeight: 54)
            .padding(.horizontal, 11)
            .background(.baseRed)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        option == selectedOption ? .baseWhite : .baseLightRed,
                        lineWidth: option == selectedOption ? 3 : 1)
            }
        }
    }
}
