//
//  AlarmViewController.swift
//  ground
//
//  Created by TED on 2019/10/22.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class NoticeViewController: BaseViewController {

    @IBOutlet weak var tableNotice: UITableView!
    
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
        // Navigation Bar
        setBackNavigationBar(delegate: self)
        useSwipeBackScreen()
        
        // TableView - delegate
        tableNotice.delegate = self
        tableNotice.dataSource = self
        tableNotice.estimatedRowHeight = UITableView.automaticDimension
        tableNotice.rowHeight = UITableView.automaticDimension
        
        // TableView - contents
        tableNotice.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
    }
    
    private func initData() {
        
    }
    
}

///----------------------------------------------------
/// TNavigationBarDelegate
///----------------------------------------------------
extension NoticeViewController: TNavigationBarDelegate {
    func actionLeftButton() {
        pushBack()
    }
}

///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension NoticeViewController: UITableViewDataSource {
    /**
     * Section 갯수
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    /**
     * table row 갯수
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 20
        default:
            return 0
        }
    }
    
    /**
     * 각 row 마다 데이터 세팅.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section as Int
//        let index = indexPath.row as Int
        
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeHeaderTableViewCell", for: indexPath) as! NoticeHeaderTableViewCell
            cell.setData()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell", for: indexPath) as! NoticeTableViewCell
            cell.setData()
            return cell
        default:
            return UITableViewCell()
        }
    }
}


///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension NoticeViewController: UITableViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}


///----------------------------------------------------
/// NoticeHeaderDelegate
///----------------------------------------------------
extension NoticeViewController: NoticeHeaderDelegate {
    
    func actionMyPosts() {
        tableNotice.scrollTop()
    }
    
    func actionOtherPosts() {
        tableNotice.scrollTop()
    }
    
}
