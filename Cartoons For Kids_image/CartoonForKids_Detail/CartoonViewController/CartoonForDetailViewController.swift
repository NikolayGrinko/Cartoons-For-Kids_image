//
//  CartoonForDetailViewController.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 28.08.2024.
//

import Foundation
import UIKit


protocol ICartoonDetailViewProtocol {
	var presenter: ICartoonDetailPresenterProtocol? {get set}
	
	func update(with cartoon: CartoonModelEntity)
	func update(with error: String)
}

class CartoonDetailViewController: UIViewController, ICartoonDetailViewProtocol {
	
	// MARK: - COMPONENT
	let stackView = UIStackView()
	let label = UILabel()
	let imageView = UIImageView()
	
	
	// MARK: - PROPERTY
	var presenter: ICartoonDetailPresenterProtocol?
	
	// MARK: - LIFE CYCLE
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "CartoonDetail"
		
		style()
		layout()
		presenter?.viewSetData()
	}
}

extension CartoonDetailViewController {
	func style() {
		view.backgroundColor = .white
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 20
		
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Dummy"
		label.font = UIFont.preferredFont(forTextStyle: .title1)
		label.textAlignment = .center
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
	}
	
	func layout() {
		stackView.addArrangedSubview(label)
		stackView.addArrangedSubview(imageView)
		
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		])
	}
}

// MARK: - CartoonDetailViewController
extension CartoonDetailViewController {
	
	func update(with cartoon: CartoonModelEntity) {
		
		label.textColor = .black
		label.text = cartoon.title
		
		if let url = URL(string: cartoon.image ?? "") {
			imageView.load(url: url)
			imageView.isHidden = false
		} else {
			imageView.isHidden = true
		}
	}
	
	func update(with error: String) {
		imageView.isHidden = true
		label.text = error
		label.textColor = .red
	}
}
