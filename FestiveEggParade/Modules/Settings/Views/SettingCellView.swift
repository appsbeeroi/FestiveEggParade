import SwiftUI

struct SettingCellView: View {
    
    let type: SettingsCellType
    
    @Binding var isNotificationEnable: Bool
    
    var body: some View {
        HStack {
            Text(type.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.rammetto(with: 15))
                .foregroundStyle(LinearGradient.baseGradient)
            
            if type == .notifications {
                Toggle(isOn: $isNotificationEnable) {}
                    .tint(.baseGreen)
                    .labelsHidden()
            } else {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.baseYellow)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 23)
        .background(.baseRed)
        .overlay(alignment: .bottom) {
            if type != .about {
                Rectangle()
                    .frame(height: 1)
                    .padding(.horizontal)
                    .foregroundStyle(.baseWhite.opacity(0.25))
            }
        }
    }
    
    #warning("открыть доки ")
    private func openDocs() {
        //
    }
}
