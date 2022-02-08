//
//  FavoriteAdressesViewController.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 03/02/2022.
//

import UIKit

class FavoriteAddressesViewController: UIViewController {
    
    @IBOutlet weak var favoriteList: UITableView!
    let viewModel = FavouriteAddressesViewModel()
    var delegate = AdressListDelegate([])
    
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        bindReachability()
        setupTableView()
        bindTableView()
        loadFavouriteList()
    }
        
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Favourite"
        self.navigationController?.topViewController?.navigationItem.searchController = nil

    }
    
    func setupTableView() {
        favoriteList.register(UINib(nibName: String(describing: AddressDetailsCellController.self) , bundle: nil), forCellReuseIdentifier:AddressDetailsCellController.cellIdentifier)
        favoriteList.register(UINib(nibName: String(describing: EmptySearchBarCellController.self) , bundle: nil), forCellReuseIdentifier:EmptySearchBarCellController.cellIdentifier)
        favoriteList.dataSource = viewModel.dataSource
        favoriteList.delegate = delegate
        
        //RefreshControl setup
        favoriteList.refreshControl = UIRefreshControl()
        favoriteList.refreshControl?.addTarget(self, action: #selector(loadFavouriteList), for: .valueChanged)
    }
    
    func bindTableView() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadFavouriteList), name: .updateDB, object: nil)
        
        delegate.shouldPopupCell = {[weak self] vc in
            self?.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func loadFavouriteList() {
        viewModel.loadFavouritelist {[weak self] in
            DispatchQueue.main.async {[weak self] in
                self?.delegate.addressesList = self?.viewModel.favourites ?? []
                self?.favoriteList.reloadData()
                self?.favoriteList.refreshControl?.endRefreshing()
            }
        }
    }
    
    deinit {
        unbindReachability()
    }
}

