//
//  Profile.swift
//  PetTracker
//
//  Created by Aditya Gautam on 01/04/21.
//

import UIKit

class Profile: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: containerViewType1Cell.self.description()) else { return UITableViewCell() }
        return cell
    }
    

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let Dog = UIImage(named: "dog-test")
        let imageView = UIImageView(image: Dog)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 120).isActive=true
        imageView.leftAnchor.constraint(equalTo: view.centerXAnchor,constant: -100).isActive=true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive=true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive=true
        setupTableView()
    }
    
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.rowHeight = 400
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 375).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.self.description())
        tableView.register(containerViewType1Cell.self, forCellReuseIdentifier: containerViewType1Cell.self.description())
    }

}


class containerViewType1Cell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label1 = UILabel()
        label1.numberOfLines = 0
        label1.text = "Scoob"
        label1.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.leadingAnchor.constraint(equalTo: contentView.centerXAnchor,constant: -25).isActive = true
        label1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        let label2 = UILabel()
        label2.numberOfLines = 0
        label2.text = "8 Years Old"
        label2.textColor = .gray
        contentView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -45).isActive = true
        label2.topAnchor.constraint(equalTo: label1.topAnchor,constant: 20).isActive = true
        //label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -150).isActive = true
        
        let label3 = UILabel()
        label3.numberOfLines = 0
        label3.text = "Owner"
        label3.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label3.topAnchor.constraint(equalTo: label2.topAnchor, constant: 25).isActive = true
        //label3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        
        let label4 = UILabel()
        label4.numberOfLines = 0
        label4.text = "Naveen"
        label4.textColor = .gray
        contentView.addSubview(label4)
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label4.topAnchor.constraint(equalTo: label3.topAnchor, constant: 20).isActive = true
        //label4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70).isActive = true
        
        let label5 = UILabel()
        label5.numberOfLines = 0
        label5.text = "The American Eskimo Dog is a breed of companion dog, originating in Germany. The American Eskimo Dog is a member of the Spitz family. The breed's progenitors were German Spitz, but due to anti-German sentiment during the First World War, it was renamed American Eskimo Dog.Although white was not always a recognized color in the various German Spitz breeds, it was generally the preferred color in the US.[2] In a display of patriotism in the era around World War I, dog owners began referring to their pets as American Spitz rather than German Spitz."
        label5.textColor = .gray
        contentView.addSubview(label5)
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        //label4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -50).isActive=true
        label5.topAnchor.constraint(equalTo: label4.topAnchor,constant: 25).isActive = true
        //label5.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label5.widthAnchor.constraint(equalTo: contentView.widthAnchor,constant: -3).isActive = true
        //label5.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

