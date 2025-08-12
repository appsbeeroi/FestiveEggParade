import UserNotifications
import UIKit

final class EggReminderService {
    
    static let shared = EggReminderService()
    
    private init() {}
    
    private let dailyReminderId = "eggs.daily.check.reminder"
    
    func scheduleDailyCheck() {
        let content = UNMutableNotificationContent()
        content.title = "It's time to check Eggs!"
        content.sound = .default
        
        var date = DateComponents()
        date.hour = 10
        date.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: dailyReminderId,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Failed to schedule daily eggs reminder: \(error)")
            }
        }
    }
    
    func removeDailyCheck() {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [dailyReminderId])
    }
    
    var permissionStatus: NotificationPermissionStatus {
        get async {
            let settings = await UNUserNotificationCenter.current().notificationSettings()
            switch settings.authorizationStatus {
                case .authorized, .provisional: return .authorized
                case .denied:                   return .denied
                case .notDetermined:            return .notDetermined
                default:                        return .denied
            }
        }
    }
    
    @discardableResult
    func requestPermission() async -> Bool {
        await withCheckedContinuation { cont in
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                    cont.resume(returning: granted)
                }
        }
    }
}

