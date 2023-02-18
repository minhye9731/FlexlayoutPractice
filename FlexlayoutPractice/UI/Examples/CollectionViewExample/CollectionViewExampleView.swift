//
//  CollectionViewExampleView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/12/23.
//

import UIKit

class CollectionViewExampleView: UIView {
    
    fileprivate let collectionView: UICollectionView
    fileprivate let flowLayout = UICollectionViewFlowLayout()
    fileprivate let cellTemplate = HouseCell()
    
    fileprivate var houses: [House] = []
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        super.init(frame: .zero)
        
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.headerReferenceSize = .init(width: UIScreen.main.bounds.width, height: 100)
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HouseCell.self, forCellWithReuseIdentifier: HouseCell.reuseIdentifier)
        collectionView.register(HouseHeader.self, forSupplementaryViewOfKind: collectionView.supple, withReuseIdentifier: HouseHeader.id)
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(houses: [House]) {
        self.houses = houses
        collectionView.reloadData()
    }
    
    func viewOrientationDidChange() {
        flowLayout.invalidateLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.pin.vertically().horizontally(pin.safeArea)
    }
    
}

extension CollectionViewExampleView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HouseCell.reuseIdentifier, for: indexPath) as! HouseCell
        cell.configure(house: houses[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellTemplate.configure(house: houses[indexPath.row])
        return cellTemplate.sizeThatFits(CGSize(width: collectionView.bounds.width, height: .greatestFiniteMagnitude))
    }
    
}
