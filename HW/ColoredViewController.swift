//
//  ColoredViewController.swift
//  HW
//
//  Created by Айдар Рахматуллин on 31.10.2020.
//

import UIKit

protocol ColorPickerDelegate {
    func setupColor(_ color: UIColor)
}

class ColoredViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorPickerVC = segue.destination as? ColorPickerViewController else { return }
        colorPickerVC.delegate = self
        colorPickerVC.color = view.backgroundColor
    }
}

extension ColoredViewController: ColorPickerDelegate {
    func setupColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
