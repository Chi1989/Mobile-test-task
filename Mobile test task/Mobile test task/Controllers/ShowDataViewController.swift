//
//  ShowDataViewController.swift
//  Mobile test task
//
//  Created by Mac on 30/09/2022.
//

import UIKit
//MARK: - Objects properties
class ShowDataViewController: UIViewController {
    let apiCall = ApiCall()
    var cellsData = [CellsData]()
    var personalData = [Welcome]()
    lazy var searchTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        return label
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.returnKeyType = .continue
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .systemGray5
        textField.placeholder = "search for name, phone, account number..."
        return textField
    }()
    
    lazy var tableview: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.reloadData()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(Cells.self, forCellReuseIdentifier: "Cell")
        table.separatorColor = .clear
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        apiCall.getData {_ in
            self.tableview.reloadData()
            print("success: \(self.personalData.count)")
        }
    }
    //MARK: Setting of the views and constraints
    func setupViews() {
        view.addSubview(searchTitleLabel)
        view.addSubview(searchTextField)
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            searchTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            searchTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: searchTitleLabel.bottomAnchor, constant: 20),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            searchTextField.widthAnchor.constraint(equalToConstant: 350),
            
            tableview.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}
//MARK: - Extending the datasource and delegates of the tableviews.
extension ShowDataViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath) as? Cells else { fatalError() }
        cell.configure(with: cellsData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

