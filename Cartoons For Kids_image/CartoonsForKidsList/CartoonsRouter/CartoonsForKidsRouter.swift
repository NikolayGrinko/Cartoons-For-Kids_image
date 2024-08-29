//
//  CartoonsForKidsRouter.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit

protocol ICartoonsListRouterProtocol {
	var entry: CartoonsForKidsViewController? {get}
	
	static func startExecution() -> ICartoonsListRouterProtocol
	func gotoDetailView(cartoon: CartoonModelEntity)
}

class CartoonsForKidsRouter: ICartoonsListRouterProtocol{
	var entry: CartoonsForKidsViewController?
	
	static func startExecution() -> ICartoonsListRouterProtocol {
		
		let router = CartoonsForKidsRouter()
		let view = CartoonsForKidsViewController()
		let presenter = CartoonsForKidsPresenter()
		let interactor = CartoonsForKidsInteractor()
		
		view.presenter = presenter
		
		presenter.view = view
		presenter.router = router
		presenter.interactor = interactor
		
		interactor.presenter = presenter
		
		router.entry = view
		
		return router
	}
	
	func gotoDetailView(cartoon: CartoonModelEntity) {
		
		let detailRouter = CartoonDetailRouter.createCartoonDetail(with: cartoon)
		guard let detailView = detailRouter.entry else { return }
		guard let viewController = self.entry else { return }
		
		viewController.navigationController?.pushViewController(detailView, animated: true)
		
	}
}
