//
//  IndustryViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/9/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class IndustryViewController: UIViewController {
    var industriesList : [IndustryData]?
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(IndustryCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(named: "background-text-icon-color")
        
        return cv
    }()
    
//MARK: - ViewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        fecthIndustries()
        
        setUpNavBar()
        
        view.addSubview(collectionView)
        setCollectionViewConstraints()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
//MARK:  - API Request Handlers
    func fecthIndustries(){
        let urlString = "http://localhost:8000/api/industries/?format=json"
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let myIndustries = self.parseJSON(industryData: safeData)
                    self.industriesList = myIndustries
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(industryData: Data) -> [IndustryData]{
        let decoder = JSONDecoder()
        var industriesList : [IndustryData] = []
        
        do{
            let decodedData = try decoder.decode([IndustryData].self, from: industryData)
            industriesList = decodedData
        }catch{
            print(error)
        }
        
        return industriesList
    }
    
    //MARK: - Constraint Functions
    func setUpNavBar(){
        navigationController?.navigationBar.backgroundColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.barTintColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //Text Styling
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 24)!, .foregroundColor: UIColor(named: "background-text-icon-color")!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        self.title = "Select Industry"
    }
    
    func setCollectionViewConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

//MARK: - Colction View Protocols
extension IndustryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return industriesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IndustryCell
        cell.backgroundColor = .white
        cell.labelView.text = industriesList![indexPath.row].industry_name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.bounds.width-30)/2, height: collectionView.bounds.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC = CompaniesTableViewController()
        newVC.title = industriesList![indexPath.row].industry_name
        newVC.selectedIndustryId = industriesList![indexPath.row].id
        newVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}
