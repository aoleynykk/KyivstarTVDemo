//
//  HomeView.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import UIKit

class HomeView: UIView {

    var collectionView: UICollectionView = {
        let obj = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .clear
        return obj
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .colors(.background)
        addSubview(collectionView)

        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, environment in
            return self?.createSectionLayout(for: sectionIndex)
        }

        collectionView.collectionViewLayout = layout

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func createSectionLayout(for section: Int) -> NSCollectionLayoutSection? {
        guard let snapshot = (collectionView.dataSource as? UICollectionViewDiffableDataSource<Section, Item>)?.snapshot() else {
            return createDefaultLayout()
        }
        switch snapshot.sectionIdentifiers[section] {
        case .promotions:
            return createHorizontalLayout(itemWidth: .absolute(UIScreen.main.bounds.width/1.15), itemHeight: .absolute(UIScreen.main.bounds.width/2.1), groupHeight: .absolute(UIScreen.main.bounds.width/2.1), itemSpacing: 8, groupSpacing: 20)
        case .categories:
            return createHorizontalLayout(itemWidth: .absolute(UIScreen.main.bounds.width/3.6), itemHeight: .absolute(UIScreen.main.bounds.width/3.6), groupHeight: .absolute(UIScreen.main.bounds.width/3.6), itemSpacing: 8, groupSpacing: 20)
        case .series:
            return createHorizontalLayout(itemWidth: .absolute(UIScreen.main.bounds.width/3.6), itemHeight: .absolute(UIScreen.main.bounds.width/3.6), groupHeight: .absolute(UIScreen.main.bounds.width/3.6), itemSpacing: 8, groupSpacing: 20)
        case .livechannels:
            return createHorizontalLayout(itemWidth: .absolute(UIScreen.main.bounds.width/3.6), itemHeight: .absolute(UIScreen.main.bounds.width/3.6), groupHeight: .absolute(UIScreen.main.bounds.width/3.6), itemSpacing: 8, groupSpacing: 20)
        case .epgs:
            return createHorizontalLayout(itemWidth: .absolute(UIScreen.main.bounds.width/3.6), itemHeight: .absolute(UIScreen.main.bounds.width/3.6), groupHeight: .absolute(UIScreen.main.bounds.width/3.6), itemSpacing: 8, groupSpacing: 20)
        }
    }

    private func createHorizontalLayout(itemWidth: NSCollectionLayoutDimension, itemHeight: NSCollectionLayoutDimension, groupHeight: NSCollectionLayoutDimension, itemSpacing: CGFloat, groupSpacing: CGFloat) -> NSCollectionLayoutSection {
        // Define the size of the item (square or flexible)
        let itemSize = NSCollectionLayoutSize(widthDimension: itemWidth, heightDimension: itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Add spacing between items
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(itemSpacing), top: nil, trailing: .fixed(itemSpacing), bottom: nil)

        // Define the group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Add spacing between items within the group
        group.interItemSpacing = .fixed(groupSpacing)

        // Section setup
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        // Define section insets (padding around the section)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)

        return section
    }


    private func createDefaultLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }
}
