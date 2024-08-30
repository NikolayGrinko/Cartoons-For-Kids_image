//
//  Extention+UIImageView.swift
//  Cartoons For Kids_image
//
//  Created by Николай Гринько on 28.08.2024.
//

import Foundation
import UIKit

extension UIImageView {
	func load(url: URL) {
		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
