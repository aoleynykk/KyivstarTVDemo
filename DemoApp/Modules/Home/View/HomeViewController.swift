//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Pete Shpagin on 31.03.2021.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
   
    private var homeView: HomeView!
    
    private var viewModel: HomeViewModel!
    
    private var cancellables = Set<AnyCancellable>()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        setupCollectionView()
        setupDataSource()
        setupBindings()
    }

    private func setupCollectionView() {
        homeView.collectionView.registerReusableCell(PromotionCell.self)
        homeView.collectionView.registerReusableCell(CategoryCell.self)
        homeView.collectionView.registerReusableCell(SeriesCell.self)
        homeView.collectionView.registerReusableCell(LivechannelCell.self)
        homeView.collectionView.registerReusableCell(EpgCell.self)
    }

    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: homeView.collectionView) { collectionView, indexPath, item in
            switch item {
            case .promotion(let promotion):
                let cell: PromotionCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.model = promotion
                return cell

            case .category(let category):
                let cell: CategoryCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.model = category
                return cell

            case .series(let series):
                let cell: SeriesCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.model = series
                return cell

            case .livechannel(let livechannel):
                let cell: LivechannelCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.model = livechannel
                return cell

            case .epg(let epg):
                let cell: EpgCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.model = epg
                return cell
            }
        }
    }

    private func applySnapshot(snapshotItems: [Section: [Item]]) {
        DispatchQueue.main.async {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()

            let orderedSections: [Section] = [.promotions, .categories, .series, .livechannels, .epgs]

            orderedSections.forEach { section in
                if let items = snapshotItems[section], !items.isEmpty {
                    snapshot.appendSections([section])
                    snapshot.appendItems(items, toSection: section)
                }
            }

            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }


    private func appendItemsToSnapshot<T>(items: [T], section: Section, into snapshot: inout NSDiffableDataSourceSnapshot<Section, Item>) {
        let mappedItems = items.compactMap { item in
            return mapItemToEnum(item: item)
        }
        snapshot.appendItems(mappedItems, toSection: section)
    }

    private func setupBindings() {
        viewModel.$snapshotItems
            .sink { [weak self] snapshotItems in
                self?.applySnapshot(snapshotItems: snapshotItems)
            }
            .store(in: &cancellables)
    }


    private func mapItemToEnum(item: Any) -> Item? {
        switch item {
        case let promotion as Promotion:
            return .promotion(promotion)
        case let category as Category:
            return .category(category)
        case let series as Asset:
            return .series(series)
        case let livechannel as Asset:
            return .livechannel(livechannel)
        case let epg as Asset:
            return .epg(epg)
        default:
            return nil
        }
    }
}
