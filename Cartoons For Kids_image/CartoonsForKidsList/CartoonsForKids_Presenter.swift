//
//  CartoonsForKids_Presenter.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit

protocol CartoonsList_Presenter_Protocol {
	var router: CartoonsList_Router_Protocol? {get set}
	var view: CartoonsList_View_Protocol? {get set}
	var interactor: CartoonsList_Interactor_Protocol? {get set}
	
	func viewDidLoad()
	func interactorWithData(result: Result<[CartoonModel], Error>)
	func tapOnDetail(_ cartoon: CartoonModel)
	
}


class CartoonsForKids_Presenter: CartoonsList_Presenter_Protocol {
	var router: CartoonsList_Router_Protocol?
	
	var view: CartoonsList_View_Protocol?
	
	var interactor: CartoonsList_Interactor_Protocol?
	
	func viewDidLoad() {
		interactor?.getCartoonsListData()
	}
	
	func interactorWithData(result: Result<[CartoonModel], Error>) {
		switch(result) {
		case .success(let cartoons):
			view?.update(with: cartoons)
		case .failure(let error):
			print(error)
			view?.update(with: "Try again later...")
		}
	}
	
	func tapOnDetail(_ cartoon: CartoonModel) {
		router?.gotoDetailView(cartoon: cartoon)
	}
}
