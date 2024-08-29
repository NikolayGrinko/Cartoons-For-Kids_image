//
//  AppDelegate.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
		let router = CartoonsForKids_Router.startExecution()
		let initialViewController = router.entry!
		
		let navigation = UINavigationController()
		navigation.viewControllers = [initialViewController]
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.backgroundColor = .systemBackground
		window?.rootViewController = navigation
		return true
	}
}




