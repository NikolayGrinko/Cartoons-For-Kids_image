//
//  SceneDelegate.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//		
//		guard let windowScene = (scene as? UIWindowScene) else { return }
//		window = UIWindow(windowScene: windowScene)
//		window?.rootViewController = ViewController()
//		window?.makeKeyAndVisible()
		
		let router = CartoonsForKids_Router.startExecution()
		let initialViewController = router.entry!
		
		let navigation = UINavigationController()
		navigation.viewControllers = [initialViewController]
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.backgroundColor = .systemBackground
		window?.rootViewController = navigation
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}


}

