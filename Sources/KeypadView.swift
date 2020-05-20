//
//  KeypadView.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 1/10/20.
//  Copyright © 2020 Prashant Shrestha. All rights reserved.
//

import UIKit

public class KeyPadView: UIView {
    
    
    public var delegate: KeyPadDelegate?
    
    public var themeColor: UIColor?
    
    
    lazy var one: UIButton = {
        return makeButton(with: "1")
    }()
    
    lazy var two: UIButton = {
        return makeButton(with: "2")
    }()
    lazy var three: UIButton = {
        return makeButton(with: "3")
    }()
    
    lazy var four: UIButton = {
        return makeButton(with: "4")
    }()
    
    lazy var five: UIButton = {
        return makeButton(with: "5")
    }()
    
    lazy var six: UIButton = {
        return makeButton(with: "6")
    }()
    
    lazy var seven: UIButton = {
        return makeButton(with: "7")
    }()
    
    lazy var eight: UIButton = {
        return makeButton(with: "8")
    }()
    
    lazy var nine: UIButton = {
        return makeButton(with: "9")
    }()
    
    lazy var zero: UIButton = {
        return makeButton(with: "0")
    }()
    
    lazy var clear: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(podImageName: "icn_delete"), for: .normal)
        view.tag = 0
        view.backgroundColor = themeColor ?? UIColor.accentLight
        view.alpha = 0.2
        view.layer.masksToBounds = true
        view.layer.cornerRadius = KeyboardConfig.BaseDimension.buttonHeight * 0.5
        view.addTarget(self, action: #selector(clearAction(_:)), for: .touchUpInside)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: KeyboardConfig.BaseDimension.buttonHeight).isActive = true
        view.heightAnchor.constraint(equalToConstant: KeyboardConfig.BaseDimension.buttonHeight).isActive = true
        return view
    }()
    
    private lazy var stackView1: UIStackView = {
        let subViews = [one, two, three]
        let view = UIStackView(arrangedSubviews: subViews)
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = KeyboardConfig.BaseDimension.verticalSpacing
        return view
    }()
    private lazy var stackView2: UIStackView = {
        let subViews = [four, five, six]
        let view = UIStackView(arrangedSubviews: subViews)
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = KeyboardConfig.BaseDimension.verticalSpacing
        return view
    }()
    private lazy var stackView3: UIStackView = {
        let subViews = [seven, eight, nine]
        let view = UIStackView(arrangedSubviews: subViews)
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = KeyboardConfig.BaseDimension.verticalSpacing
        return view
    }()
    private lazy var stackView4: UIStackView = {
        let subViews = [makeButton(with: ""), zero, clear]
        let view = UIStackView(arrangedSubviews: subViews)
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = KeyboardConfig.BaseDimension.verticalSpacing
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let subViews = [stackView1, stackView2, stackView3, stackView4]
        let view = UIStackView(arrangedSubviews: subViews)
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = KeyboardConfig.BaseDimension.horizontalSpacing
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    convenience init() {
        typealias baseDimension = KeyboardConfig.BaseDimension
        let height = (baseDimension.buttonHeight * 4) + (baseDimension.horizontalSpacing * 3) + (baseDimension.topMargin) + (baseDimension.bottomMargin)
        self.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    func makeUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: KeyboardConfig.BaseDimension.topMargin).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: KeyboardConfig.BaseDimension.sideMargin).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -KeyboardConfig.BaseDimension.sideMargin).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -KeyboardConfig.BaseDimension.sideMargin).isActive = true
    }
    
    func makeButton(with title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.tag = Int(title) ?? 0
        button.titleLabel?.font = KeyboardConfig.Font.buttonFont
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: KeyboardConfig.BaseDimension.buttonHeight).isActive = true
        button.widthAnchor.constraint(equalToConstant: KeyboardConfig.BaseDimension.buttonHeight).isActive = true
        
        button.backgroundColor = themeColor ?? UIColor.accentLight
        button.alpha = title == "" ? 0.0 : 0.2
        button.isEnabled = title != ""
        button.layer.masksToBounds = true
        button.layer.cornerRadius = KeyboardConfig.BaseDimension.buttonHeight * 0.5
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(buttonActions(_:)), for: .touchUpInside)
        return button
    }
    
    
    private var inputText: String = "" {
        didSet {
            delegate?.inputString(text: inputText)
        }
    }
    
    @objc func buttonActions(_ sender: UIButton) {
        let tag = sender.tag
        inputText.append("\(tag)")
        delegate?.didTapNumber(number: "\(tag)")
    }
    @objc func clearAction(_ sender: Any) {
        if !inputText.isEmpty {
            inputText.removeLast()
        }
        delegate?.didTapClear()
    }
    
}
