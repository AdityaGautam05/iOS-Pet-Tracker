//
//  ViewController.swift
//  PetTracker
//
//  Created by Aditya Gautam on 30/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "horizontalCell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pets List"
        view.backgroundColor = .white
        setupTableView()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.rowHeight = 175
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -200).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.self.description())
        tableView.register(ContainerViewType1Cell.self, forCellReuseIdentifier: ContainerViewType1Cell.self.description())
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2.5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCell", for: indexPath) as! CustomCell
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(Profile(), animated: true)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContainerViewType1Cell.self.description()) else { return UITableViewCell() }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //navigationController?.pushViewController(DogProfile(), animated: true)
//        //showToast(controller: UIViewController(), message: "Test", seconds: 5)
//        view.backgroundColor = .red
//    }
    
}

class ContainerViewType1Cell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let dogimage = UIImage(named: "dog-test")
        let dogoImage = UIImageView(image: dogimage)
        dogoImage.sizeToFit()

        dogoImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dogoImage)
        
        dogoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive=true
        dogoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.5).isActive=true
        dogoImage.widthAnchor.constraint(equalToConstant: 150).isActive=true
        dogoImage.heightAnchor.constraint(equalToConstant: 150).isActive=true

        let dogDescription = UILabel()
        dogDescription.numberOfLines = 0
        dogDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        contentView.addSubview(dogDescription)
        dogDescription.translatesAutoresizingMaskIntoConstraints = false
        dogDescription.leftAnchor.constraint(equalTo: dogoImage.rightAnchor,constant: 10).isActive=true
        dogDescription.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dogDescription.widthAnchor.constraint(equalToConstant: 200).isActive=true
        dogDescription.heightAnchor.constraint(equalToConstant: 175).isActive=true
        //dogDescription.bottomAnchor.constraint(equalTo: dogoImage.bottomAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomCell: UICollectionViewCell {
    
    fileprivate let bg: UIImageView = {
        let image = UIImage(named: "vet-doc")
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
                iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        let docName = UILabel()
        docName.numberOfLines = 0
        docName.text = "Consult the Doctor"
        docName.font = .boldSystemFont(ofSize: 8)
        contentView.addSubview(docName)
        docName.translatesAutoresizingMaskIntoConstraints = false
        docName.leftAnchor.constraint(equalTo: contentView.centerXAnchor,constant: -40).isActive=true
        docName.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 10).isActive = true
        docName.widthAnchor.constraint(equalToConstant: 200).isActive=true
        docName.heightAnchor.constraint(equalToConstant: 20).isActive=true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
