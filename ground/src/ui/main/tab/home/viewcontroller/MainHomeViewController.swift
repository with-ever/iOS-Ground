//
//  MainHomeViewController.swift
//  ground
//
//  Created by TED on 19/09/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class MainHomeViewController: BaseViewController {

    @IBOutlet weak var tableHome: UITableView!
    
    ///----------------------------------------------------
    /// Life cycle
    ///----------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initLanguage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    ///----------------------------------------------------
    /// Initialization
    ///----------------------------------------------------
    private func initLanguage() {
        
    }
    
    private func initLayout() {
//        // Navigation Bar
//        setBackNavigationStyle(title: "ExternalWebView")
//        useSwipeBackScreen()
        
        // TableView - delegate
        tableHome.delegate = self
        tableHome.dataSource = self
        tableHome.estimatedRowHeight = UITableView.automaticDimension
        tableHome.rowHeight = UITableView.automaticDimension
        
        // TableView - contents
        tableHome.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    private func initData() {
        
    }
}




///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension MainHomeViewController: UITableViewDataSource {
    /**
     * Section 갯수
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    /**
     * table row 갯수
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return addressList.count
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    /**
     * 각 row 마다 데이터 세팅.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section as Int
        let index = indexPath.row as Int
        
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTopBannerTableViewCell", for: indexPath) as! HomeTopBannerTableViewCell
//            cell.indexPath = indexPath
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFilterTableViewCell", for: indexPath) as! HomeFilterTableViewCell
            //            cell.indexPath = indexPath
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePostingTableViewCell", for: indexPath) as! HomePostingTableViewCell
            //            cell.indexPath = indexPath
            return cell
        default:
            return UITableViewCell()
        }
    }
}


///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension MainHomeViewController: UITableViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
