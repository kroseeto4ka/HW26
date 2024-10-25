//
//  ViewController.swift
//  HW26
//
//  Created by brubru on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewA = CustomView(color: .lightGray, text: "A")
	private let viewB = CustomView(color: .red, text: "B")
	private let viewC = CustomView(color: .blue, text: "C")
	private let viewD = CustomView(color: .yellow, text: "D")
	private let viewE = CustomView(color: .green, text: "E")
    private let messageLabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubViews()
		setupViews()
        setupDelegate()
        setupLabel()
		setupLayout()
	}
}

// MARK: - Setup View
private extension ViewController {
	func addSubViews() {
		view.addSubview(viewA)
		
		viewA.addSubview(viewB)
		viewA.addSubview(viewC)
		viewB.addSubview(viewD)
		viewC.addSubview(viewE)
	}
	
	func setupViews() {
		view.backgroundColor = .white
	}
    
    func setupLabel() {
        messageLabel.backgroundColor = .systemTeal
        messageLabel.textColor = .white
        messageLabel.font = .systemFont(ofSize: 40, weight: .bold)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 3
        messageLabel.text = "Здесь будет название выбранной вью"
        
        view.addSubview(messageLabel)
    }
    
    private func setupDelegate() {
        viewA.delegate = self
        viewB.delegate = self
        viewC.delegate = self
        viewD.delegate = self
        viewE.delegate = self
    }
	
}

// MARK: Setup constraints
private extension ViewController {
	func setupLayout() {
		viewA.translatesAutoresizingMaskIntoConstraints = false
		viewB.translatesAutoresizingMaskIntoConstraints = false
		viewC.translatesAutoresizingMaskIntoConstraints = false
		viewD.translatesAutoresizingMaskIntoConstraints = false
		viewE.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			viewA.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
			viewA.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			viewA.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
			viewA.heightAnchor.constraint(equalToConstant: 300),
			
			viewB.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewB.leadingAnchor.constraint(equalTo: viewA.leadingAnchor, constant: 20),
			viewB.widthAnchor.constraint(equalToConstant: 150),
			viewB.heightAnchor.constraint(equalToConstant: 150),
			
			viewC.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewC.trailingAnchor.constraint(equalTo: viewA.trailingAnchor, constant: -20),
			viewC.widthAnchor.constraint(equalToConstant: 150),
			viewC.heightAnchor.constraint(equalToConstant: 150),
			
			viewD.bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: -20),
			viewD.leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: 20),
			viewD.widthAnchor.constraint(equalToConstant: 100),
			viewD.heightAnchor.constraint(equalToConstant: 50),
			
			viewE.topAnchor.constraint(equalTo: viewC.topAnchor, constant: 60),
			viewE.centerXAnchor.constraint(equalTo: viewC.centerXAnchor),
			viewE.widthAnchor.constraint(equalToConstant: 80),
			viewE.heightAnchor.constraint(equalToConstant: 120),
            
            messageLabel.topAnchor.constraint(equalTo: viewA.bottomAnchor, constant: 50),
            messageLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: viewA.bottomAnchor, constant: 450)
		])
	}
}

// MARK: Setup delegate
extension ViewController: ICustomViewDelegate {
    func didHitView(_ view: UIView) {
        if let view = view as? CustomView {
            messageLabel.text = "\(view.elementName ?? "Error")"
        }
    }
}
