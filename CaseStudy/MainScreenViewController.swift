//
//  MainScreenViewController.swift
//  CaseStudy
//
//  Created by Mehmet Dolasan on 2.06.2022.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var shoesCollectionView: UICollectionView!
    
    var shoeList = [Shoes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //back button title
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.backgroundColor = .init(_colorLiteralRed: 0.965, green: 0.965, blue: 0.965, alpha: 100)
        
        
        
        
        //cell design
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.shoesCollectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (width - 10)
        
        design.minimumLineSpacing = 25
        
        design.itemSize = CGSize(width: cellWidth, height: cellWidth/3.2)
        shoesCollectionView.collectionViewLayout = design
        
        //delegate
        shoesCollectionView.delegate = self
        shoesCollectionView.dataSource = self
        
        //Tab Bar
        tabBarController?.tabBar.layer.borderWidth = 1
        tabBarController?.tabBar.layer.borderColor = UIColor.gray.cgColor
        
        
        
        //View
        topView.layer.cornerRadius = 20
        
        //shoes init
        let shoe1 = Shoes(shoeId: 1, shoeImgName: "img_shoe1", shoeName: "Nike", shoeInfo: "Airforce 1 Jester XX Black Sonic Yellow", shoePrice: 96)
        let shoe2 = Shoes(shoeId: 2, shoeImgName: "img_shoe2", shoeName: "Nike", shoeInfo: "Air Jordan 1 Retro High Obsidian UNC", shoePrice: 196)
        let shoe3 = Shoes(shoeId: 3, shoeImgName: "img_shoe3", shoeName: "New Balance", shoeInfo: "574 Unisex", shoePrice: 96)
        let shoe4 = Shoes(shoeId: 4, shoeImgName: "img_shoe4", shoeName: "Nike", shoeInfo: "Airforce 1 Shadow Beige Pale Ivory", shoePrice: 115)
        
        shoeList.append(shoe1)
        shoeList.append(shoe2)
        shoeList.append(shoe3)
        shoeList.append(shoe4)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //nav cont hidden
        navigationController?.navigationBar.isHidden = true
        
        //Status bar
        if #available(iOS 13, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let statusBar = UIView(frame: (keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = .white
            keyWindow?.addSubview(statusBar)
        }
        //
     
        //tabbar appear
        tabBarController?.tabBar.isHidden = false
        
    }

}

extension MainScreenViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let shoe = shoeList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoeCell", for: indexPath) as! ShoeViewCellCollectionViewCell
        
        cell.shoeName.text = shoe.shoeName!
        cell.shoeInfo.text = shoe.shoeInfo!
        cell.shoePrice.text = "$\(shoe.shoePrice!)"
        cell.shoeImg.image = UIImage(named: shoe.shoeImgName!)
        
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 30
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "mainToDetail", sender: nil)
        
    }
    
    
    
}


