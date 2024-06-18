//
//  EduProgressView.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.05.2024.
//

import UIKit
import SnapKit

final class EduProgressView: UIView {
    
    var progress: Float = 0 {
        didSet {
            progressView.setProgress(progress, animated: true)
        }
    }
    
    private let shadowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor(hexString: "#C9C9C9").cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor(hexString: "#41AF0D")
        progressView.trackTintColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = 7.0
        return progressView
    }()
    
    init() {
        super.init(frame: .zero)
        setConstraints()
        
        progressView.progress = progress
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.addSubview(shadowContainer)
        shadowContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        shadowContainer.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
    }
}


