import Flutter
import UIKit
import workmanager

@main
@objc class AppDelegate: FlutterAppDelegate {
  /// Registers all pubspec-referenced Flutter plugins in the given registry.
  static func registerPlugins(with registry: FlutterPluginRegistry) {
    GeneratedPluginRegistrant.register(with: registry)
  }
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    GeneratedPluginRegistrant.register(with: self)

    /// the task is ran at most every 15 minutes.
    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*15))
      
    AppDelegate.registerPlugins(with: self) // Register the app's plugins in the context of a normal run
      
    WorkmanagerPlugin.setPluginRegistrantCallback { registry in
                  // The following code will be called upon WorkmanagerPlugin's registration.
                  // Note : all of the app's plugins may not be required in this context ;
                  // instead of using GeneratedPluginRegistrant.register(with: registry),
                  // you may want to register only specific plugins.
    AppDelegate.registerPlugins(with: registry)
              }
      
    /// In AppDelegate.application method
    WorkmanagerPlugin.registerBGProcessingTask(withIdentifier: "simple-task")


    /// Register a periodic task in iOS 13+
    WorkmanagerPlugin.registerPeriodicTask(withIdentifier: "periodic-task", frequency: NSNumber(value: 20 * 60))

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
      ) {
        completionHandler(.alert)
      }
}
