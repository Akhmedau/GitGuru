//
//  SwipeViewController.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 18/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class SwipeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let swipeItems = [
        SwipeItem(headline: "Welcome !", subheadline: "Would you like to follow the tuttorial ?You can also reach it from te menu."),
        SwipeItem(headline: "What is git ?", subheadline: "Git is a mature, actively maintained open source revision control system"),
        SwipeItem(headline: "2 What is git ?", subheadline: "Git is a mature, actively maintained open source revision control system")
    ]
    
    let previousButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let pageControl = UIPageControl()
    let bottomStackView = UIStackView()
    let nextScreenButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return swipeItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SwipeCell.reuseIdentifier, for: indexPath) as! SwipeCell
        let swipeItem = swipeItems[indexPath.item]
        cell.update(headline: swipeItem.headline, subheadline: swipeItem.subheadline)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    @objc func previousButtonDidTap() {
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func nextButtonDidTap() {
        let nextIndex = min(pageControl.currentPage + 1, swipeItems.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @objc func nextScreenButtonDidTap() {
        // Создаем следующий UIViewController
            let nextViewController = MyViewController()

            // Создаем UINavigationController и устанавливаем его корневой контроллер
            let navigationController = UINavigationController(rootViewController: nextViewController)

            // Переходим на следующий экран с анимацией
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
    }
    
    func configureBottomStackView() {
        previousButton.setTitle("PREV", for: .normal)
        previousButton.setTitleColor(.white, for: .normal)
        previousButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        previousButton.addTarget(self, action: #selector(previousButtonDidTap), for: .touchUpInside)
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = swipeItems.count
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
        nextScreenButton.setTitle("Next VC", for: .normal)
        nextScreenButton.setTitleColor(.black, for: .normal)
        nextScreenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        nextScreenButton.addTarget(self, action: #selector(nextScreenButtonDidTap), for: .touchUpInside)
                
        bottomStackView.addArrangedSubview(previousButton)
        bottomStackView.addArrangedSubview(pageControl)
        bottomStackView.addArrangedSubview(nextButton)
        bottomStackView.addArrangedSubview(nextScreenButton)
        
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomStackView)
    }
    
    func configureViewController() {
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: SwipeCell.reuseIdentifier)
        
        configureBottomStackView()
        
        NSLayoutConstraint.activate([
            bottomStackView.heightAnchor.constraint(equalToConstant: 100),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
