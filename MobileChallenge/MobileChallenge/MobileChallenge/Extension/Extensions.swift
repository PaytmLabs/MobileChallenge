//
//  Extensions.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-27.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable: class {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func dequeReusableCell<T: UITableViewCell>(_ index: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: index) as! T
    }
    
    func dequeReusableView<T: UITableViewCell>() -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.identifier) as! T
    }
}

extension UICollectionView {
    func dequeReusableCell<T: UICollectionViewCell>(_ index: IndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: index) as! T
    }
}

extension UIViewController {
    func hideKeyboardWhenViewIsTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
