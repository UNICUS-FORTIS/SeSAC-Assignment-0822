//
//  ViewController.swift
//  Mission0822
//
//  Created by LOUIE MAC on 2023/08/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    let nextButton = {
        let button = UIButton()
        button.setTitle("첫번째 화면으로", for: .normal)
        button.backgroundColor = .systemPink
        return button
    }()
    
    let secondNextButton = {
        let button = UIButton()
        button.setTitle("두번째 화면으로", for: .normal)
        button.backgroundColor = .systemPurple
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        secondNextButton.addTarget(self, action: #selector(secondNextButtonTapped), for: .touchUpInside)
        setConstraints()
    }
    
    
    private func setConstraints() {
        view.addSubview(nextButton)
        view.addSubview(secondNextButton)
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(view).multipliedBy(0.3)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        secondNextButton.snp.makeConstraints { make in
            make.width.equalTo(nextButton)
            make.height.equalTo(nextButton)
            make.centerX.equalTo(view)
            make.top.equalTo(nextButton.snp.bottom).offset(40)
        }
        
        
        
    }
    
    @objc private func nextButtonTapped() {
        let vc = SecondViewController()
        present(vc, animated: true)
    }
    
    @objc private func secondNextButtonTapped() {
        let vc = ThirdViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen

        present(nav, animated: true)
    }
    
    
    
    
    
}

