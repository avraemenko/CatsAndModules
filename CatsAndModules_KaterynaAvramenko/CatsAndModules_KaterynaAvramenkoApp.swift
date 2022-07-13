//
//  CatsAndModules_KaterynaAvramenkoApp.swift
//  CatsAndModules_KaterynaAvramenko
//
//  Created by Kate Avramenko on 25.06.2022.
//

import SwiftUI
import FirebaseCore
import FirebaseCrashlytics

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
//
@main
struct CatsAndModules_KaterynaAvramenkoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var showAlert = UserDefaults.standard.bool(forKey: "FirebaseCrashlyticsCollectionEnabled")

    var body: some Scene {
        WindowGroup {
            ContentView()
                .alert("Allow to log data for crashes", isPresented: $showAlert) {
                                    Button("Yes") {
                                        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
                                        UserDefaults.standard.set(true, forKey: "FirebaseCrashlyticsCollectionEnabled")
                                    }
                                    Button("No", role: .cancel) {
                                        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(false)
                                        UserDefaults.standard.set(false, forKey: "FirebaseCrashlyticsCollectionEnabled")
                                    }
                                }
        }
    }
}
