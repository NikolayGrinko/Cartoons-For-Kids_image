//
//  CartoonDetailRouter.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 28.08.2024.
//

import Foundation

protocol ICartoonDetailRouterProtocol {
	var entry: CartoonDetailViewController? {get}
	
	static func createCartoonDetail(with cartoon: CartoonModelEntity) -> ICartoonDetailRouterProtocol
}

class CartoonDetailRouter: ICartoonDetailRouterProtocol {
	var entry: CartoonDetailViewController?
	
	static func createCartoonDetail(with cartoon: CartoonModelEntity) -> ICartoonDetailRouterProtocol {
		
		let router = CartoonDetailRouter()
		let view = CartoonDetailViewController()
		let presenter = CartoonDetailPresenter()
		let interactor = CartoonDetailInteractor()
		
		view.presenter = presenter
		
		presenter.view = view
		presenter.router = router
		presenter.interactor = interactor
		
		interactor.presenter = presenter
		interactor.cartoon = cartoon
		
		router.entry = view
		
		return router
	}
}
