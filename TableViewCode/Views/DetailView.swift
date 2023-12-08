//
//  DetailView.swift
//  TableViewCode
//
//  Created by 오정석 on 8/12/2023.
//

import UIKit

final class DetailView: UIView {

    let mainImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupStackView() {
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        self.addSubview(stackView)
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            mainImageView.heightAnchor.constraint(equalToConstant: 240),
            mainImageView.widthAnchor.constraint(equalToConstant: 240),
            
            movieNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
    }
    
}
