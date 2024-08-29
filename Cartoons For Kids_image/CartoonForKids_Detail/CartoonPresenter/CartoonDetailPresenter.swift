//
//  CartoonDetailPresenter.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 28.08.2024.
//

import Foundation


protocol ICartoonDetailPresenterProtocol {
	var router: ICartoonDetailRouterProtocol? {get set}
	var interactor: ICartoonDetailInteractorProtocol? {get set}
	var view: ICartoonDetailViewProtocol? {get set}
	
	func interactorUpdateData(cartoon: CartoonModelEntity?)
	func viewDidLoad()
	
}

class CartoonDetailPresenter: ICartoonDetailPresenterProtocol {
	var router: ICartoonDetailRouterProtocol?
	
	var interactor: ICartoonDetailInteractorProtocol?
	
	var view: ICartoonDetailViewProtocol?
	
	func interactorUpdateData(cartoon: CartoonModelEntity?) {
		if let cartoon = cartoon{
			view?.update(with: cartoon)
		} else {
			view?.update(with: "No data")
		}
		
	}
	
	func viewDidLoad() {
		interactor?.getCartoonData()
	}
}
