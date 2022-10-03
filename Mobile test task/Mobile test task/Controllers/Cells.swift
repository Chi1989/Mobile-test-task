//
//  Cells.swift
//  Mobile test task
//
//  Created by Mac on 30/09/2022.
//

import UIKit
//MARK: OBjects properties for table cells
class Cells: UITableViewCell {
    
    let identifier = "Cell"
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var accountNumberLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneNumberLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor =  .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
        setupViews()
    }
    //MARK: Setting of the views and constraints
    func setupViews() {
        self.addSubview(nameLabel)
        self.addSubview(accountNumberLabel)
        self.addSubview(phoneNumberLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            accountNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            accountNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: accountNumberLabel.bottomAnchor, constant: 5),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Configuring the multiple cells data
    func configure(with model: CellsData) {
        nameLabel.text = model.name
        accountNumberLabel.text = model.accountNumber
        phoneNumberLabel.text = model.phoneNumber
    }
}
