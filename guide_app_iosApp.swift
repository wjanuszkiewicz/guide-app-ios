//
//  guide_app_iosApp.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 12.05.25.
//

//  GuideAppIOSApp.swift
import SwiftUI
import FirebaseCore

@main
struct GuideAppIOSApp: App {
    // инициализация Firebase через адаптор
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()          // TabBar без лишней «обёртки»
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

