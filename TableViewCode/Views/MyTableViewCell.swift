//
//  MyTableViewCell.swift
//  TableViewCode
//
//  Created by 오정석 on 7/12/2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView:UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 8
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        
        setConstraints()
    }
    
    func setupStackView() {
        // self.addSubview보다 self.contentView.addSubview로 잡는게 더 정확⭐️
        // (cell은 기본뷰로 contentView를 가지고 있기 때문)
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)
        
        //스택 뷰 위에 레이블 올리기
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
            
        ])
    }
    

}
