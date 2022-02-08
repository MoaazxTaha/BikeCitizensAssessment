//
//  ViewController.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 02/02/2022.
//

import UIKit

class SearchAddressViewController: UIViewController{
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bufferingView: UIView!
    @IBOutlet var searchAddressList: UITableView!
    lazy private var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
    lazy private var leftNavBarButton = UIBarButtonItem(customView:searchBar)
    
    private var timer = Timer()
    private let viewModel = SearchAddressViewModel()
    private var delegate: AdressListDelegate = AdressListDelegate([])
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindReachability()
        
        // Presentation style
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .formSheet
        
        setupTableView()
        bindTableView()
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadAddresses()
    }
    
    private func configureNavigationBar() {
        searchBar.delegate = self
        self.navigationController?.topViewController?.navigationItem.setLeftBarButton(leftNavBarButton, animated: true)
    }
    
    private func setupTableView() {
        searchAddressList.register(UINib(nibName: String(describing: AddressDetailsCellController.self) , bundle: nil), forCellReuseIdentifier:AddressDetailsCellController.cellIdentifier)
        searchAddressList.register(UINib(nibName: String(describing: EmptySearchBarCellController.self) , bundle: nil), forCellReuseIdentifier:EmptySearchBarCellController.cellIdentifier)
        searchAddressList.tableHeaderView?.frame.size.height = 80
        searchAddressList.backgroundColor = .white
        searchAddressList.dataSource = viewModel.dataSource
        searchAddressList.delegate = delegate
        
        //RefreshControl setup
        searchAddressList.refreshControl = UIRefreshControl()
        searchAddressList.refreshControl?.addTarget(self, action: #selector(loadAddresses), for: .valueChanged)
    }
    
    private func bindTableView() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadAddresses), name: .updateDB, object: nil)

        delegate.shouldPopupCell = {[weak self] vc in
            self?.present(vc, animated: true, completion: nil)
        }
    }
    
    deinit {
        // should remove all NotificationCenter observers
        unbindReachability()
    }
}

//MARK: -Actions
extension SearchAddressViewController {
    
    // ActivityIndicator utils
    func showBuffering(){
        self.activityIndicator.startAnimating()
        self.bufferingView.isHidden = false
    }
    
    func hideBuffering(){
        activityIndicator.stopAnimating()
        bufferingView.isHidden = true
    }
    
    @objc func loadAddresses() {
        viewModel.fetchAdressList {[weak self] in
            DispatchQueue.main.async {[weak self] in
                guard let self = self else { return }
                self.delegate.addressesList = self.viewModel.addressesList
                self.searchAddressList.reloadData()
                self.hideBuffering()
                self.searchAddressList.refreshControl?.endRefreshing()
                
            }
        }
    }
}


//MARK: - searchbar Delegate
extension SearchAddressViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(performSearch), userInfo: nil, repeats: false)
    }
    
    @objc func performSearch() {
        if let serachingTerm = searchBar.searchTextField.text {
            showBuffering()
            viewModel.searchingTerm = serachingTerm
            loadAddresses()
        }
    }
    
    
}
