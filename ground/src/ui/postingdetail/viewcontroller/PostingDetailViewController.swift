//
//  PostingDetailViewController.swift
//  ground
//
//  Created by TED on 2019/10/25.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

class PostingDetailViewController: BaseViewController {

    // MARK: views
    @IBOutlet weak var tablePostingDetail: UITableView!
    @IBOutlet weak var viewComment: UIView!
    @IBOutlet weak var fieldComment: UITextField!
    
    // MARK: constraint
    @IBOutlet weak var constraintCommentEditHeight: NSLayoutConstraint!
    
    // MARK: variable
    var listPostingDetail: [PostingDetailVO] = []
    var listComment: [CommentVO] = []
    
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
        useSwipeBackScreen()
        
        // Keyboard
        viewComment.drawRoundBorder(color: Color.clear, borderWidth: 0.0, radius: 24)
        useKeyboardEvent(delegate: self)
//        useKeyboard(scrollView: tablePostingDetail)
        
        // TableView - delegate
        tablePostingDetail.delegate = self
        tablePostingDetail.dataSource = self
        tablePostingDetail.estimatedRowHeight = UITableView.automaticDimension
        tablePostingDetail.rowHeight = UITableView.automaticDimension
        
        // TableView - contents
        tablePostingDetail.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        
        // TableView - register
        tablePostingDetail.register(UINib.init(nibName: CELL_COMMON_FILTER, bundle: nil), forCellReuseIdentifier: CELL_COMMON_FILTER)
        tablePostingDetail.register(UINib.init(nibName: CELL_COMMENT, bundle: nil), forCellReuseIdentifier: CELL_COMMENT)
        tablePostingDetail.register(UINib.init(nibName: CELL_COMMENT_MORE, bundle: nil), forCellReuseIdentifier: CELL_COMMENT_MORE)
        tablePostingDetail.register(UINib.init(nibName: CELL_RE_COMMENT, bundle: nil), forCellReuseIdentifier: CELL_RE_COMMENT)
    }
    
    private func initData() {
        listPostingDetail = [
            PostingDetailVO.init(type: .TEXT, textContents: "아는 지인이 스타트업으로 오퍼과 왔다는데\n처음 가는거라 연봉 때문에 갈지 말지 고민이라고하네요", imgURL: ""),
            PostingDetailVO.init(type: .IMAGE, textContents: "", imgURL: "http://cdn.dfy.co.kr/about/images/about_kv_01.jpg"),
            PostingDetailVO.init(type: .TEXT, textContents: "어떻게 해야할까요?? 가는게 맞을까요?", imgURL: ""),
            PostingDetailVO.init(type: .IMAGE, textContents: "", imgURL: "http://www.ciokorea.com/sites/default/files/image/marketing-ts-100593659-primary_idge.jpg")
        ]
        
        listComment = [
            CommentVO.init(comment: "가봐도 좋지 않을까요?", recomment: [ReCommentVO.init(comment: "그럴까요"), ReCommentVO.init(comment: "그런거같아요")]),
            CommentVO.init(comment: "대기업이 짱인듯", recomment: []),
            CommentVO.init(comment: "연봉이..", recomment: []),
            CommentVO.init(comment: "스타트업 조심하세요", recomment: [ReCommentVO.init(comment: "흠...")])
        ]
        
        tablePostingDetail.reloadData()
    }
    
    
    ///----------------------------------------------------
    /// Button action
    ///----------------------------------------------------
    @IBAction func actionBack(_ sender: Any) {
        pushBack()
    }
    
    @IBAction func actionCommentSend(_ sender: Any) {
        
    }
    
    @IBAction func actionCommentCamera(_ sender: Any) {
        
    }
}


// MARK: Keybaord
///----------------------------------------------------
/// BaseKeyboardDelegate
///----------------------------------------------------
extension PostingDetailViewController: BaseKeyboardDelegate {
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



// MARK: TableView
///----------------------------------------------------
/// TableView - CommonFilterDelegate
///----------------------------------------------------
extension PostingDetailViewController: CommonFilterDelegate {
    func actionFilter() {
        self.view.makeToast("필터 선택")
    }
}

///----------------------------------------------------
/// TableView - UITableViewDelegate
///----------------------------------------------------
extension PostingDetailViewController: UITableViewDataSource {
    /**
     * Section 갯수
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 + listComment.count
    }
    
    /**
     * table row 갯수
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            // 타이틀
        case 0: return 1
            // 포스팅 내용
        case 1: return listPostingDetail.count
            // Info, 필터
        case 2: return 2
            
            // 댓글
        case 3...numberOfSections(in: tableView):
            let recommentCount = listComment[(section - 3)].recomment.count
            if recommentCount > 0 {
                return recommentCount + 2
            }
            return 1
        default: return 0
        }
    }
    
    /**
     * 각 row 마다 데이터 세팅.
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section as Int
        let index = indexPath.row as Int
        
        switch section {
        // 타이틀
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_POSTING_DETAIL_TITLE, for: indexPath) as! PostingDetailTitleTableViewCell
            cell.setData(indexPath: indexPath)
            return cell
        
        // 포스팅 내용
        case 1:
            let detail = listPostingDetail[index]
            if detail.type == .TEXT {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_POSTING_DETAIL_TEXT, for: indexPath) as! PostingDetailTextTableViewCell
                cell.setData(indexPath: indexPath, data: detail)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_POSTING_DETAIL_IMAGE, for: indexPath) as! PostingDetailImageTableViewCell
                cell.setData(indexPath: indexPath, data: detail)
                return cell
            }
            
        // Info, 필터
        case 2:
            if index == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_POSTING_DETAIL_INFO, for: indexPath) as! PostingDetailInfoTableViewCell
                cell.setData(indexPath: indexPath)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_COMMON_FILTER, for: indexPath) as! CommonFilterTableViewCell
                cell.delegate = self
                cell.setData(indexPath: indexPath)
                return cell
            }
            
        // 댓글
        case 3...numberOfSections(in: tableView):
            let comment = listComment[section - 3]
            switch index {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_COMMENT, for: indexPath) as! CommentTableViewCell
                cell.setData(indexPath: indexPath, data: comment)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_COMMENT_MORE, for: indexPath) as! CommentMoreTableViewCell
                cell.setData(indexPath: indexPath, data: comment)
                return cell
            default:
                let reComment = comment.recomment[index - 2]
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_RE_COMMENT, for: indexPath) as! ReCommentTableViewCell
                cell.setData(indexPath: indexPath, data: reComment)
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
extension PostingDetailViewController: UITableViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
