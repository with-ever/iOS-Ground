//
//  MainBookmarkViewController.swift
//  ground
//
//  Created by TED on 19/09/2019.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class MainBookmarkViewController: BaseViewController {

    @IBOutlet weak var tableBookMark: UITableView!
    @IBOutlet weak var viewDropDownTitle: UIView!
    @IBOutlet weak var viewDropDown: UIView!
    
    var dropDownTitle: DropDownTitle!
    
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
        setMainNavigationBar(delegate: self)
        
        // TableView - delegate
        tableBookMark.delegate = self
        tableBookMark.dataSource = self
        tableBookMark.estimatedRowHeight = UITableView.automaticDimension
        tableBookMark.rowHeight = UITableView.automaticDimension
        
        // TableView - contents
        tableBookMark.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        
        // TableView - register
        tableBookMark.register(UINib.init(nibName: CELL_COMMON_FILTER, bundle: nil), forCellReuseIdentifier: CELL_COMMON_FILTER)
        tableBookMark.register(UINib.init(nibName: CELL_POSTING_TEXT, bundle: nil), forCellReuseIdentifier: CELL_POSTING_TEXT)
        tableBookMark.register(UINib.init(nibName: CELL_POSTING_IMAGE, bundle: nil), forCellReuseIdentifier: CELL_POSTING_IMAGE)
        
        
        // DropDownTitle
        dropDownTitle = DropDownTitle.instanceFromNib()
        dropDownTitle.delegate = self
        viewDropDownTitle.addSubview(dropDownTitle)
        
        // DropDownView
        viewDropDown.isHidden = true
    }
    
    private func initData() {
        // DropDownTitle
        dropDownTitle.setData(title: "Bulletin Board")
        
    }
    
}


///----------------------------------------------------
/// TNavigationBarDelegate
///----------------------------------------------------
extension MainBookmarkViewController: TNavigationBarDelegate {
    func actionLeftButton() {
        
    }
    
    func actionRightButton() {
        pushView(storyBoard: "Notice", viewControllerName: "NoticeViewController")
    }
}


///----------------------------------------------------
/// DropDownTitleDelegate
///----------------------------------------------------
extension MainBookmarkViewController: DropDownTitleDelegate {
    func actionDropDown(title: String) {
        
    }
}





///----------------------------------------------------
/// TableView - CommonFilterDelegate
///----------------------------------------------------
extension MainBookmarkViewController: CommonFilterDelegate {
    func actionFilter() {
        self.view.makeToast("필터 선택")
    }
}

///----------------------------------------------------
/// TableView - PostingTextDelegate, PostingImageDelegate
///----------------------------------------------------
extension MainBookmarkViewController: PostingTextDelegate, PostingImageDelegate {
    func actionPostingDetail(indexPath: IndexPath) {
        self.view.makeToast("포스팅 상세")
    }
    
    func actionLike(indexPath: IndexPath) {
        self.view.makeToast("Like")
    }
    
    func actionComment(indexPath: IndexPath) {
        self.view.makeToast("Comment")
    }
    
    func actionShare(indexPath: IndexPath) {
        self.view.makeToast("Share")
    }
    
    func actionBookmark(indexPath: IndexPath) {
        self.view.makeToast("Bookmark")
    }
}

///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension MainBookmarkViewController: UITableViewDataSource {
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
        //필터
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_COMMON_FILTER, for: indexPath) as! CommonFilterTableViewCell
            cell.delegate = self
            return cell

        // 포스팅
        case 1:
            if index % 2 == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_POSTING_TEXT, for: indexPath) as! PostingTextTableViewCell
                cell.delegate = self
                cell.setData(indexPath: indexPath)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_POSTING_IMAGE, for: indexPath) as! PostingImageTableViewCell
                cell.delegate = self
                cell.setData(indexPath: indexPath)
                return cell
            }
            
        default:
            return UITableViewCell()
        }
    }
}


///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension MainBookmarkViewController: UITableViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
