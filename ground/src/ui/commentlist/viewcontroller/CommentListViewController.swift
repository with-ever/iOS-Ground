//
//  CommentListViewController.swift
//  ground
//
//  Created by TED on 2019/11/11.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class CommentListViewController: BaseViewController {

    // MARK: views
    @IBOutlet weak var tableCommentList: UITableView!
    @IBOutlet weak var viewComment: UIView!
    @IBOutlet weak var fieldComment: UITextField!
    
    // MARK: constraint
    @IBOutlet weak var constraintCommentEditHeight: NSLayoutConstraint!
    
    // MARK: variable
    var comment: CommentVO!
    
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
        
        // Keyboard
        viewComment.drawRoundBorder(color: Color.clear, borderWidth: 0.0, radius: 24)
        useKeyboardEvent(delegate: self)
        
        // TableView - delegate
        tableCommentList.delegate = self
        tableCommentList.dataSource = self
        tableCommentList.estimatedRowHeight = UITableView.automaticDimension
        tableCommentList.rowHeight = UITableView.automaticDimension

        // TableView - contents
        tableCommentList.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)

        // TableView - register
        tableCommentList.register(UINib.init(nibName: CELL_COMMENT, bundle: nil), forCellReuseIdentifier: CELL_COMMENT)
        tableCommentList.register(UINib.init(nibName: CELL_RE_COMMENT, bundle: nil), forCellReuseIdentifier: CELL_RE_COMMENT)
    }
    
    private func initData() {
        comment = CommentVO.init(comment: "가봐도 좋지 않을까요?",
                                 recomment: [ReCommentVO.init(comment: "그럴까요"),
                                             ReCommentVO.init(comment: "아마두요"),
                                             ReCommentVO.init(comment: "정말요?"),
                                             ReCommentVO.init(comment: "그런거같아요")])
    }

}

///----------------------------------------------------
/// TNavigationBarDelegate
///----------------------------------------------------
extension CommentListViewController: TNavigationBarDelegate {
    func actionLeftButton() {
        pushBack()
    }
}


// MARK: Keybaord
///----------------------------------------------------
/// BaseKeyboardDelegate
///----------------------------------------------------
extension CommentListViewController: BaseKeyboardDelegate {
    func showKeyboard(keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.constraintCommentEditHeight.constant = keyboardHeight
        })
    }
    
    func hideKeyboard(keyboardHeight: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.constraintCommentEditHeight.constant = 56
        })
    }
}





///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension CommentListViewController: UITableViewDataSource {
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
        if section == 0 {
            return 1
        }
        return comment.recomment.count
    }
    
    /**
     * 각 row 마다 데이터 세팅.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section as Int
        let index = indexPath.row as Int
        
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_COMMENT, for: indexPath) as! CommentTableViewCell
            cell.setData(indexPath: indexPath, data: comment)
            return cell
        default:
            let recomment = comment.recomment[index]
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_RE_COMMENT, for: indexPath) as! ReCommentTableViewCell
            cell.setData(indexPath: indexPath, data: recomment)
            return cell
        }
    }
}


///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension CommentListViewController: UITableViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
