//
//  Cartoons_Model.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 27.08.2024.
//

import UIKit


struct CartoonModel: Decodable {
	let title: String
	let year: Int
	let creator: [String]
	let rating: String?
	let genre: [String]?
	let runtime_in_minutes: Int
	let episodes: Int?
	let image: String?
	let id: Int?
}

