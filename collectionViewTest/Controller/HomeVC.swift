//
//  ViewController.swift
//  collectionViewTest
//
//  Created by Umer Khan on 22/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let announcementContainerView          = UIView()
    let dailySpecialsContainerView          = UIView()
    let liveFeedsContainerView              = UIView()
    
    
    let topLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(20)
        lbl.sizeToFit()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let middleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(20)
        lbl.sizeToFit()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let bottomLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = lbl.font.withSize(20)
        lbl.sizeToFit()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    fileprivate let announcementCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let acv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        acv.translatesAutoresizingMaskIntoConstraints = false
        acv.register(AnnouncementCell.self, forCellWithReuseIdentifier: "annCell")
        return acv
    }()
    
    
    fileprivate let dailySpecialsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let dscv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        dscv.translatesAutoresizingMaskIntoConstraints = false
        dscv.register(DailySpecialsCell.self, forCellWithReuseIdentifier: "dailySpecialCell")
        return dscv
    }()
    
    
    fileprivate let liveFeedsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let lfcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        lfcv.translatesAutoresizingMaskIntoConstraints = false
        lfcv.register(LiveFeedsCell.self, forCellWithReuseIdentifier: "liveFeedCell")
        return lfcv
    }()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        configureAnnContainerView()
        configureLabelForAnn()
        configureCVforAnn()
        
        configureDailySpecialsContainerView()
        configureMiddleLabelForDS()
        configureCVforDS()
        
        configureLiveFeedsContainerView()
        configureBottomLabelForLF()
        configureCVforLF()
    }
    
    fileprivate func configureView() {
        self.view.backgroundColor = .white
    }
    
    
    fileprivate func configureAnnContainerView() {
        view.addSubview(announcementContainerView)
        announcementContainerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.size.width, height: 184))
    }
    
    fileprivate func configureLabelForAnn() {
        announcementContainerView.addSubview(topLabel)
        topLabel.anchor(top: announcementContainerView.topAnchor, leading: announcementContainerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .init(width: 140, height: 25))
        topLabel.text = "Announcement"
    }
    
    fileprivate func configureCVforAnn() {
        
        announcementContainerView.addSubview(announcementCollectionView)
        announcementCollectionView.backgroundColor = .white
        announcementCollectionView.dataSource = self
        announcementCollectionView.delegate = self
        announcementCollectionView.anchor(top: topLabel.bottomAnchor, leading: announcementContainerView.leadingAnchor, bottom: nil, trailing: announcementContainerView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 118, height: 144))
        
    }
    
    
    fileprivate func configureDailySpecialsContainerView() {
        view.addSubview(dailySpecialsContainerView)
        //dailySpecialsContainerView.backgroundColor = .orange
        dailySpecialsContainerView.anchor(top: announcementContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.size.width, height: 163))
    }
    
    
    fileprivate func configureMiddleLabelForDS() {
        
        dailySpecialsContainerView.addSubview(middleLabel)
        middleLabel.text = "Daily Specials in your area"
        middleLabel.anchor(top: dailySpecialsContainerView.topAnchor, leading: dailySpecialsContainerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .init(width: 245, height: 25))
    }
    
    
    fileprivate func configureCVforDS() {
        dailySpecialsContainerView.addSubview(dailySpecialsCollectionView)
        //dailySpecialsCollectionView.backgroundColor = .red
        dailySpecialsCollectionView.backgroundColor = .white
        dailySpecialsCollectionView.dataSource = self
        dailySpecialsCollectionView.delegate = self
        
        dailySpecialsCollectionView.anchor(top: middleLabel.bottomAnchor, leading: dailySpecialsContainerView.leadingAnchor, bottom: nil, trailing: dailySpecialsContainerView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 96, height: 114))
    }
    
    
    fileprivate func configureLiveFeedsContainerView() {
        view.addSubview(liveFeedsContainerView)
        //liveFeedsContainerView.backgroundColor = .gray
        liveFeedsContainerView.anchor(top: dailySpecialsContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.size.width, height: 136))
    }
    
    
    fileprivate func configureBottomLabelForLF() {
        liveFeedsContainerView.addSubview(bottomLabel)
        bottomLabel.text = "Live Feeds"
        bottomLabel.anchor(top: liveFeedsContainerView.topAnchor, leading: liveFeedsContainerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0), size: .init(width: 97, height: 25))
    }
    
    
    fileprivate func configureCVforLF() {
        liveFeedsContainerView.addSubview(liveFeedsCollectionView)
        liveFeedsCollectionView.dataSource = self
        liveFeedsCollectionView.delegate = self
        //liveFeedsCollectionView.backgroundColor = .brown
        liveFeedsCollectionView.backgroundColor = .white
        liveFeedsCollectionView.anchor(top: bottomLabel.bottomAnchor, leading: liveFeedsContainerView.leadingAnchor, bottom: nil, trailing: liveFeedsContainerView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 96, height: 96))
    }
}


extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.announcementCollectionView { return 10 }
        else if collectionView == self.dailySpecialsCollectionView { return 5 }
        else if collectionView == self.liveFeedsCollectionView { return 9 }
        else { return 1 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.announcementCollectionView {
            let cell = announcementCollectionView.dequeueReusableCell(withReuseIdentifier: "annCell", for: indexPath) as! AnnouncementCell
            //cell.backgroundColor = .red
            cell.logo.image = #imageLiteral(resourceName: "ann")
            cell.label.text = "Comming"
            return cell
            
        }
        else if collectionView == self.dailySpecialsCollectionView {
            let cell = dailySpecialsCollectionView.dequeueReusableCell(withReuseIdentifier: "dailySpecialCell", for: indexPath) as! DailySpecialsCell
            cell.label.text = "Daily"
            cell.logo.image = #imageLiteral(resourceName: "up")
            return cell
        } else if collectionView == self.liveFeedsCollectionView {
            let cell = liveFeedsCollectionView.dequeueReusableCell(withReuseIdentifier: "liveFeedCell", for: indexPath) as! LiveFeedsCell
            cell.logo.image = #imageLiteral(resourceName: "live")
            cell.label.text = "Feed"
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.announcementCollectionView {
            return CGSize(width: announcementCollectionView.frame.width / 3, height: announcementCollectionView.frame.width / 2.6)
        } else if collectionView == self.dailySpecialsCollectionView {
            return CGSize(width: dailySpecialsCollectionView.frame.width / 3.8, height: dailySpecialsCollectionView.frame.width / 3.3)
        } else if collectionView == self.liveFeedsCollectionView {
            return CGSize(width: liveFeedsCollectionView.frame.width / 3.7, height: liveFeedsCollectionView.frame.width / 3.89)
        }
        else {
            return CGSize(width: 0, height: 0)
        }
        
        
        
        
    }
}
