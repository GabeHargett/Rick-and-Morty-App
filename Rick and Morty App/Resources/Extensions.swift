//
//  Extensions.swift
//  Rick and Morty App
//
//  Created by Tanner Rozier on 3/15/23.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
