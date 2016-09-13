//
//  YMProductViewController.swift
//  DanTang
//
//  Created by peterfei on 16/9/13.
//  Copyright © 2016年 hrscy. All rights reserved.
//

import UIKit
let collectionCellID = "YMCollectionViewCell"
class YMProductViewController: YMBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, YMCollectionViewCellDelegate {
    var products = [YMProduct]()
    var collectionView: UICollectionView?


    override func viewDidLoad() {
        /// 设置collectionView
        
        setupCollectionView()
        
        weak var weakSelf = self
        YMNetworkTool.shareNetworkTool.loadProductData { (products) in
            weakSelf!.products = products
            weakSelf!.collectionView!.reloadData()
        }

    }
    
    /// 设置collectionView
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        let nib = UINib(nibName: String(YMCollectionViewCell), bundle: nil)
        collectionView.delegate = self
        collectionView.backgroundColor = YMColor(240, g: 240, b: 240, a: 1)
        print("collectionView background color is \(view.backgroundColor)")
        collectionView.dataSource = self
        collectionView.registerNib(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellID, forIndexPath: indexPath) as! YMCollectionViewCell
        cell.product = products[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let productDetailVC = YMProductDetailViewController()
        productDetailVC.title = "商品详情"
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.mainScreen().bounds.width - 20) / 2
        let height: CGFloat = 245
        return CGSizeMake(width, height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    // MARK: - YMCollectionViewCellDelegate
    func collectionViewCellDidClickedLikeButton(button: UIButton) {
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
