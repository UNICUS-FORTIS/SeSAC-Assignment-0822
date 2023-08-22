//
//  SecondViewController.swift
//  Mission0822
//
//  Created by LOUIE MAC on 2023/08/22.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    
    let topImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "믿어핑")
        return imageView
    }()
    
    let titleTextField = {
        let tf = UITextField()
        tf.placeholder = "제목을 입력해 주세요"
        return tf
    }()
    
    let dateTextField = {
        let tf = UITextField()
        tf.placeholder = "날짜를 입력해 주세요"
        return tf
    }()
    
    let mainLabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(topImageView)
        view.addSubview(titleTextField)
        view.addSubview(dateTextField)
        view.addSubview(mainLabel)
        
        setConstraints()
        configureTextField()
    }
    
    private func configureTextField() {
        [titleTextField, dateTextField].forEach { textField in
            textField.tintColor = .lightGray
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.textAlignment = .center
        }
    }
    
    private func setConstraints() {
        topImageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(10)
            make.width.equalTo(view).multipliedBy(0.75)
            make.height.equalTo(220)
            make.centerX.equalTo(view)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(topImageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topImageView)
            make.height.equalTo(view).multipliedBy(0.05)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topImageView)
            make.height.equalTo(view).multipliedBy(0.05)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(topImageView)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
    
    
    
    
}
