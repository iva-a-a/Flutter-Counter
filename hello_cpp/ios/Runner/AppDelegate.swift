import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.native/file",
                                       binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { call, result in
        if call.method == "writeFile" {
            if let args = call.arguments as? [String: Any],
               let count = args["count"] as? Int {
                let content = WriteHelloWrapper(Int32(count))
                result(content)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT",
                                    message: "Empty",
                                    details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
