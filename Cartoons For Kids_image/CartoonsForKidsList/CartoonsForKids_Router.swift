//
//  CartoonsForKids_Router.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit

protocol CartoonsList_Router_Protocol {
	var entry: CartoonsForKids_ViewController? {get}
	static func startExecution() -> CartoonsList_Router_Protocol

	func gotoDetailView(cartoon: CartoonModel)
}


class CartoonsForKids_Router: CartoonsList_Router_Protocol{
	var entry: CartoonsForKids_ViewController?
 
 static func startExecution() -> CartoonsList_Router_Protocol {
	 
	 let router = CartoonsForKids_Router()
	 let view = CartoonsForKids_ViewController()
	 let presenter = CartoonsForKids_Presenter()
	 let interactor = CartoonsForKids_Interactor()
	 
	 view.presenter = presenter
	 
	 presenter.view = view
	 presenter.router = router
	 presenter.interactor = interactor
	 
	 interactor.presenter = presenter
	 
	 router.entry = view
	 
	 return router
	 
 }
 
 func gotoDetailView(cartoon: CartoonModel) {
	 
 }
 
 
}
