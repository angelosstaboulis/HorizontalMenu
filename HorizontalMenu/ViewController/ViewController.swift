//
//  ViewController.swift
//  HorizontalMenu
//
//  Created by Angelos Staboulis on 4/4/21.
//

import UIKit
protocol collectionProtocol:AnyObject{
    func setupCell(collectionView:UICollectionView,indexPath:IndexPath)
}
class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    let menus = ["Add Record","Edit","Delete","Change","Browse"]
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Do any additional setup after loading the view.
    }

    
}
extension ViewController{
    func setupView(){
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:MenuCell = collectionView.cellForItem(at: indexPath) as! MenuCell
        cell.lblCaption.textColor = .black
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell:MenuCell = collectionView.cellForItem(at: indexPath) as! MenuCell
        cell.lblCaption.textColor = .white
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return setupCell(collectionView: collectionView, indexPath: indexPath)
    }
    func setupCell(collectionView:UICollectionView,indexPath:IndexPath)->UICollectionViewCell{
        let cell:MenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCell
      
        if indexPath.row < menus.count {
            cell.lblCaption.text = String(menus[indexPath.row])
            cell.lblCaption.textColor = .white
        }
        return cell
    }
    
}
