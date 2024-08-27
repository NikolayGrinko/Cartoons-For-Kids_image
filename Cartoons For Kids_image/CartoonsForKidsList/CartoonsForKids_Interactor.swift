//
//  CartoonsForKids_Interactor.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit

protocol CartoonsList_Interactor_Protocol {
	var presenter: CartoonsList_Presenter_Protocol? {get set}
	
	func getCartoonsListData()
}

class CartoonsForKids_Interactor: CartoonsList_Interactor_Protocol {
	var presenter: CartoonsList_Presenter_Protocol?
 
 func getCartoonsListData() {
	 
	 guard let url = URL(string: "https://api.sampleapis.com/cartoons/cartoons2D") else { return }
	 let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
		 guard let data = data, error == nil else {
			 print(data!)
			 self?.presenter?.interactorWithData(result: .failure(NetworkError.serverError))
			 return
		 }
		 
		 do {
			 let cartoons = try JSONDecoder().decode([Cartoon].self, from: data)
			 self?.presenter?.interactorWithData(result: .success(cartoons))
			 print(cartoons)
		 } catch {
			 self?.presenter?.interactorWithData(result: .failure(NetworkError.deodingError))
		 }
	 }
	 
	 task.resume()
 }
}
