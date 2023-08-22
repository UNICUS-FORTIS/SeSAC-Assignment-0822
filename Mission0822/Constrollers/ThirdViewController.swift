//
//  ThirdViewController.swift
//  Mission0822
//
//  Created by LOUIE MAC on 2023/08/22.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {
    
    let backgroundImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    let closeButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    let bottomView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let talkingBubble = {
        let button = UIButton()
        var attString = AttributedString("나와의 채팅")
        attString.font = .systemFont(ofSize: 13, weight: .light)
        attString.foregroundColor = .white
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = attString
        configuration.image = UIImage(systemName: "message.fill")
        configuration.imagePadding = 10
        configuration.baseBackgroundColor = .clear
        configuration.imagePlacement = .top
        button.configuration = configuration
        
        return button
    }()
    
    let profileEdit = {
        let button = UIButton()
        var attString = AttributedString("프로필 편집")
        attString.font = .systemFont(ofSize: 13, weight: .light)
        attString.foregroundColor = .white
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = attString
        configuration.image = UIImage(systemName: "pencil")
        configuration.imagePadding = 10
        configuration.baseBackgroundColor = .clear
        configuration.imagePlacement = .top
        button.configuration = configuration

        return button
    }()
    
    let storyButton = {
        let button = UIButton()
        var attString = AttributedString("카카오스토리")
        attString.font = .systemFont(ofSize: 13, weight: .light)
        attString.foregroundColor = .white
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = attString
        configuration.image = UIImage(systemName: "bookmark.fill")
        configuration.imagePadding = 10
        configuration.baseBackgroundColor = .clear
        configuration.imagePlacement = .top
        button.configuration = configuration
        
        return button
    }()
    
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [talkingBubble, profileEdit, storyButton])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .center
        sv.distribution = .equalSpacing
        return sv
    }()
    
    let profileImage = {
        let view = UIImageView()
        view.image = UIImage(named: "FairyOrb")
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = view.layer.frame.width/2
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNavigationItems()
        setupUI()
        setConstraints()
    }
    
    func setupUI() {
        view.addSubview(backgroundImage)
        view.addSubview(closeButton)
        view.addSubview(bottomView)
        view.addSubview(mainStackView)
        view.addSubview(profileImage)
        
        let borderLine = CALayer()
        borderLine.borderWidth = 5
        borderLine.borderColor = UIColor.init(white: 1, alpha: 0.2).cgColor
        borderLine.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 2)
        bottomView.layer.addSublayer(borderLine)
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.isTranslucent = true
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        
        navigationItem.standardAppearance = appearance
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setupNavigationItems() {
        let qrCodeImage = UIImage(systemName: "qrcode.viewfinder")!
        let qrCodeButton = UIButton(frame: CGRect(x: 0, y: 0, width: qrCodeImage.size.width, height: qrCodeImage.size.height))
        qrCodeButton.setImage(qrCodeImage, for: .normal)
        
        let giftButtonImage = UIImage(systemName: "gift")!
        let giftButton = UIButton(frame: CGRect(x: 0, y: 0, width: giftButtonImage.size.width, height: giftButtonImage.size.height))
        giftButton.setImage(giftButtonImage, for: .normal)
        
        let settingsImage = UIImage(systemName: "gearshape.fill")!
        let settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: settingsImage.size.width, height: settingsImage.size.height))
        settingsButton.setImage(settingsImage, for: .normal)
        
        let qrCodeBarButton = UIBarButtonItem(customView: qrCodeButton)
        let giftBarButton = UIBarButtonItem(customView: giftButton)
        let settingBarButton = UIBarButtonItem(customView: settingsButton)
        
        let closeBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(cancelButtonTapped))
        
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.leftBarButtonItem = closeBarButton
        self.navigationItem.rightBarButtonItems =
        [settingBarButton, qrCodeBarButton, giftBarButton]
    }
    
    
    
    func setConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view)
            make.bottom.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.16)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomView.snp.top).offset(20)
        }
        
        profileImage.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(mainStackView.snp.top).offset(-110)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
}

