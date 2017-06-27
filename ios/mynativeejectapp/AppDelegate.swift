import Foundation

import UIKit

class MySampleView :UIView{
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.blue
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

func createRNView(
  didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> UIView {
  let jsCodeLocation = RCTBundleURLProvider
    .sharedSettings()
    .jsBundleURL(
      forBundleRoot: "index.ios",
      fallbackResource:nil)
  
  let rootView = RCTRootView(
    bundleURL: jsCodeLocation,
    moduleName: "mynativeejectapp",
    initialProperties: nil,
    launchOptions: launchOptions
  )
  return rootView!
}

func createUIView(frame: CGRect) -> UIView {
  return MySampleView(frame: frame)
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  var bridge: RCTBridge!
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    let rootViewController = UIViewController()
    
    
    // Create ReactNativeView as root
    // let rootView = createRNView(didFinishLaunchingWithOptions: launchOptions)

    // Create ReactNativeView under root UIView
    let rootView = createUIView(frame: UIScreen.main.bounds)
    let rnView = createRNView(didFinishLaunchingWithOptions: launchOptions)
    rnView.frame = UIScreen.main.bounds
    rootView.addSubview(rnView)
    rootViewController.view = rootView
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
    self.window = window
    
    return true
  }
}
