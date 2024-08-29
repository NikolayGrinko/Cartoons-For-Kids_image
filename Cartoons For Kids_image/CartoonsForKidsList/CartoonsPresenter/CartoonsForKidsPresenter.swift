//
//  CartoonsForKids_Presenter.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit

protocol ICartoonsListPresenterProtocol {
	var router: ICartoonsListRouterProtocol? {get set}
	var view: ICartoonsListViewProtocol? {get set}
	var interactor: ICartoonsListInteractorProtocol? {get set}
	
	func viewDidLoad()
	func interactorWithData(result: Result<[CartoonModelEntity], Error>)
	func tapOnDetail(_ cartoon: CartoonModelEntity)
	
}


class CartoonsForKidsPresenter: ICartoonsListPresenterProtocol {
	var router: ICartoonsListRouterProtocol?
	
	var view: ICartoonsListViewProtocol?
	
	var interactor: ICartoonsListInteractorProtocol?
	
	func viewDidLoad() {
		interactor?.getCartoonsListData()
	}
	
	func interactorWithData(result: Result<[CartoonModelEntity], Error>) {
		switch(result) {
		case .success(let cartoons):
			view?.update(with: cartoons)
		case .failure(let error):
			print(error)
			view?.update(with: "Try again later...")
		}
	}
	
	func tapOnDetail(_ cartoon: CartoonModelEntity) {
		router?.gotoDetailView(cartoon: cartoon)
	}
}
