import SwiftUI

struct AddEggMarkCellVIew: View {
    
    let mark: EggMark
    
    @Binding var selectedMark: EggMark?
    
    var body: some View {
        Button {
             selectedMark = mark
        } label: {
            HStack(spacing: 0) {
                Text(mark.icon)
                    .font(.system(size: 16))
                
                Text(mark.title)
                    .font(.rammetto(with: 14))
                    .foregroundStyle(.baseWhite)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
            }
            .frame(minHeight: 36)
            .padding(.horizontal, 10)
            .background(mark == selectedMark ? .baseLightRed : .baseRed)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.baseLightRed, lineWidth: mark == selectedMark ? 3 : 1)
            }
        }
    }
}
