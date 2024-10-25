//
//  CustomView.swift
//  HW26
//
//  Created by Никита Сорочинский on 24.10.2024.
//
import UIKit

class CustomView: UIView {
    var elementName: String?
    var delegate: ICustomViewDelegate?
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color: UIColor, text: String){
        super.init(frame: .zero)
        elementName = text
        self.backgroundColor = color
        addLabel(text)
    }
    
    private func addLabel(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
    }
}

//MARK: - Setup HitTest
extension CustomView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let foundView = super.hitTest(point, with: event)
        if foundView is CustomView {
            delegate?.didHitView(foundView!)
        }
        return foundView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let foundPoint = super.point(inside: point, with: event)
        if foundPoint {
            return true
        } else {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                return subview.point(inside: convertedPoint, with: event)
            }
        }
        return false
    }
}
