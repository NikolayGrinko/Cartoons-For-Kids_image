//
//  CartoonDetailInteractor.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 28.08.2024.
//

import Foundation


protocol ICartoonDetailInteractorProtocol {
	var presenter: ICartoonDetailPresenterProtocol? {get set}
	var cartoon: CartoonModelEntity? {get set}
	
	func getCartoonData()
}

class CartoonDetailInteractor: ICartoonDetailInteractorProtocol {
	var presenter: ICartoonDetailPresenterProtocol?
	
	var cartoon: CartoonModelEntity?
	
	func getCartoonData() {
		
		presenter?.interactorUpdateData(cartoon: cartoon)
	}
	
	
}

