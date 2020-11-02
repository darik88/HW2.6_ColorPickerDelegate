//
//  ColorPickerViewController.swift
//  HW
//
//  Created by Айдар Рахматуллин on 17.10.2020.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    @IBOutlet var mixedColorView: UIView!
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    var delegate: ColorPickerDelegate!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mixedColorView.layer.cornerRadius = 10
        mixedColorView.backgroundColor = color
        updateValues(slider: redColorSlider)
        updateValues(slider: greenColorSlider)
        updateValues(slider: blueColorSlider)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateColor()
        updateValues(slider: sender)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setupColor(color)
        dismiss(animated: true)
    }
    
    private func updateColor() {
        color = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        mixedColorView.backgroundColor = color
    }
    
    private func updateValues(slider: UISlider) {
        switch slider {
        case redColorSlider:
            slider.value = Float(color.components.red)
            redColorValueLabel.text = String(format: "%.2f", slider.value)
        case greenColorSlider:
            slider.value = Float(color.components.green)
            greenColorValueLabel.text = String(format: "%.2f", slider.value)
        case blueColorSlider:
            slider.value = Float(color.components.blue)
            blueColorValueLabel.text = String(format: "%.2f", slider.value)
        default:
            break
        }
    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
