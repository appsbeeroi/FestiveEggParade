import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isNotificationEnable") var isNotificationDidEnabled = false
    
    @State private var selectedDocumentType: SettingsCellType?
    @State private var isNotificationEnable = false
    @State private var isShowNotificationAlert = false
    
    var body: some View {
        ZStack {
            Image(.Images.background)
                .expandToFill()
            
            VStack(spacing: 0) {
                navigationSection
                
                VStack(spacing: 0) {
                    ForEach(SettingsCellType.allCases) { type in
                        SettingCellView(type: type, isNotificationEnable: $isNotificationEnable)
                    }
                }
                .cornerRadius(18)
                .padding(.top, 35)
                .padding(.horizontal, 35)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            if let selectedDocumentType,
               let url = URL(string: selectedDocumentType.link) {
                WebView(url: url) {
                    self.selectedDocumentType = nil
                }
            }
        }
        .animation(.default, value: selectedDocumentType)
        .onAppear {
            isNotificationEnable = isNotificationDidEnabled
        }
        .alert("Notification permission didn't granted", isPresented: $isShowNotificationAlert) {
            Button("Yes") {
                openAppSettings()
            }
            
            Button("No") {
                isNotificationEnable = false
            }
        } message: {
            Text("Open app settings?")
        }
        .onChange(of: isNotificationEnable) { isEnable in
            if isEnable {
                Task {
                    switch await EggReminderService.shared.permissionStatus {
                        case .authorized:
                            isNotificationEnable = isEnable
                            EggReminderService.shared.scheduleDailyCheck()
                        case .denied:
                            isShowNotificationAlert = true
                        case .notDetermined:
                            await EggReminderService.shared.requestPermission()
                    }
                }
            } else {
                EggReminderService.shared.removeDailyCheck()
            }
        }
    }
    
    private var navigationSection: some View {
        VStack(spacing: 0) {
            Text("SETTINGS")
                .strokeText(fontSize: 30)
                .foregroundStyle(LinearGradient.baseGradient)
        }
    }
    
    private func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL)
        }
    }
}

#Preview {
    SettingsView()
}


