//
//  DropDownView.swift
//  ground
//
//  Created by TED on 2019/11/07.
//  Copyright © 2019 WithEver. All rights reserved.
//

import UIKit

public protocol DropDownDropDownViewDelegate: class {
    func dropDownView(_ view: DropDownDropDownView, didSelectRowWith seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?, at indexPath: IndexPath)
    
    ///
    func dropDownView(_ view: DropDownDropDownView, showsVerticalScrollIndicatorFor seriesIdentifier: AnyHashable?) -> Bool
    func dropDownView(_ view: DropDownDropDownView, backgroundColorFor seriesIdentifier: AnyHashable?) -> UIColor
}

extension DropDownDropDownViewDelegate {
    public func dropDownView(_ view: DropDownDropDownView, didSelectRowWith seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?, at indexPath: IndexPath) { }
    public func dropDownView(_ view: DropDownDropDownView, showsVerticalScrollIndicatorFor seriesIdentifier: AnyHashable?) -> Bool { return true }
    public func dropDownView(_ view: DropDownDropDownView, backgroundColorFor seriesIdentifier: AnyHashable?) -> UIColor { return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0) }
}

public protocol DropDownDropDownViewDataSource: class {
    /// Drop down view's header view.
    ///
    /// - Parameter dropDownView: Current drop down view.
    /// - Returns: An UIView object to `DropDownDropDownView`.
    func headerView(for dropDownView: DropDownDropDownView) -> UIView?
    
    /// Return series `Array`
    ///
    /// If you have tow columns in drop down menu, you need to return an array with two elements which confirmes `Hashable`.
    ///
    /// - Parameter dropDownView: Current drop down view.
    /// - Returns: Series Identifiers array, `Array<AnyHashable>`
    func series(in dropDownView: DropDownDropDownView) -> [AnyHashable]
    
    /// Number of rows for different series.
    ///
    /// - Parameter view: Current drop down view.
    /// - Parameter seriesIdentifier: Identifier for table view in `DropDownDropDownView`.
    /// - Parameter subSeriesIdentifier: Sub identifier for selected subSeriesIdentifier.
    /// - Returns: Number of rows.
    func dropDownView(_ view: DropDownDropDownView, numberOfRowsFor seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?) -> Int
    
    ///
    func dropDownView(_ view: DropDownDropDownView, cellFor seriesIdentifier: AnyHashable?, and subSeriesIdentifier: AnyHashable?, at indexPath: IndexPath) -> DropDownTableViewCellType & UITableViewCell
    
    /// Set different width for each table view.
    ///
    /// - Warning: If you want to each tableview fill equally, just return nil.
    ///
    /// - Parameter view: Current drop down view.
    /// - Parameter seriesIdentifier: Identifier for table view in `DropDownDropDownView`.
    /// - Returns: The ratio of tableview's width to screen's width.
    func dropDownView(_ view: DropDownDropDownView, widthRatioFor seriesIdentifier: AnyHashable?) -> CGFloat?
}

extension DropDownDropDownViewDataSource {
    public func headerView(for dropDownView: DropDownDropDownView) -> UIView? { return nil }
    public func dropDownView(_ view: DropDownDropDownView, widthRatioFor seriesIdentifier: AnyHashable?) -> CGFloat? { return nil }
}

public class DropDownDropDownView: UIView {
    
    public weak var delegate: DropDownDropDownViewDelegate?
    public weak var dataSource: DropDownDropDownViewDataSource?
    
    /// Record selected subserise identifier.
    public var selectedSeriseIdentifier: [AnyHashable: AnyHashable] = [:]
    
    private struct RegistedCell {
        let cellCalss: AnyClass?
        let nib: UINib?
        let reuseIdentifier: String
    }
    
    private lazy var surfaceView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //
    private var seriesTableViews: [DropDownTableViewType & UITableView] = []
    
    private var registerCell: [AnyHashable: RegistedCell] = [:]
    
    private let configuration: DropDownConfigurationType
    
    private var topConstriant: NSLayoutConstraint!
    
    public init(configuration: DropDownConfigurationType) {
        self.configuration = configuration
        super.init(frame: .zero)
        setup()
    }
    
    public override init(frame: CGRect) {
        self.configuration = DropDownDefaultConfiguration()
        super.init(frame: frame)
        setup()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.configuration = DropDownDefaultConfiguration()
        super.init(coder: aDecoder)
        setup()
    }
}

// MARK: Public
extension DropDownDropDownView {
    /// Display drop down view with animation.
    public func display(withCompletion completion: ((Bool) -> Void)? = nil) {
        isHidden = false
        func displaySurface() {
            let effect = UIBlurEffect(style: configuration.surface.blurEffectStyle)
            surfaceView.effect = effect
        }
        
        func moveUpAnimation() {
            topConstriant.constant = 0
            UIView.animate(withDuration: configuration.animation.moveDuration, animations: {
                self.layoutIfNeeded()
            }, completion: completion)
        }
        
        UIView.animate(withDuration: configuration.animation.duration, animations: {
            displaySurface()
        }) { _ in
            moveUpAnimation()
        }
    }
    
    /// Hide drop down view with animationHide.
    public func hide(withCompletion completion: ((Bool) -> Void)? = nil) {
        func hideSurface() {
            surfaceView.effect = nil
        }
        
        topConstriant.constant = -configuration.menu.maximumHeight
        UIView.animate(withDuration: configuration.animation.moveDuration, animations: {
            self.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: self.configuration.animation.duration, animations: {
                hideSurface()
            }, completion: completion)
        }
    }
    
    /// Reload drop down view's data.
    public func reloadData(for seriseIdentifier: AnyHashable? = nil) {
        if let identifier = seriseIdentifier, let tableView = seriesTableViews.first(where: { $0.seriesID == identifier }) { // 指定加载数据的标识符
            tableView.reloadData()
        } else {
            if seriesTableViews.isEmpty { // 首次加载数据
                assembleSeriesTableViews()
            } else {
                seriesTableViews.forEach { $0.reloadData() }
            }
        }
    }
    
    public func register(_ cellCalss: AnyClass?, forSeriseIdentifier seriseIdentifier: AnyHashable, andReuseIdentifier reuseIdentifier: String) {
        registerCell[seriseIdentifier] = RegistedCell(cellCalss: cellCalss, nib: nil, reuseIdentifier: reuseIdentifier)
    }
    
    public func register(_ nib: UINib?, forSeriseIdentifier seriseIdentifier: AnyHashable, andReuseIdentifier reuseIdentifier: String) {
        registerCell[seriseIdentifier] = RegistedCell(cellCalss: nil, nib: nib, reuseIdentifier: reuseIdentifier)
    }
    
    public func dequeueReusableCell(withIdentifier reuseIdentifier: String, for indexPath: IndexPath, andSeriseIdentifier seriseIdentifier: AnyHashable?) -> UITableViewCell & DropDownTableViewCellType {
        if let tableView = seriesTableViews.first(where: { $0.seriesID == seriseIdentifier }), let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UITableViewCell & DropDownTableViewCellType {
            return cell
        }
        fatalError("The cell used in DropDown didn't confirm DropDownTableViewCellType protocol.")
    }
    
    public func dequeueReusableCell(withIdentifier reuseIdentifier: String, forSeriseIdentifier seriseIdentifier: AnyHashable?) -> (UITableViewCell & DropDownTableViewCellType)? {
        if let tableView = seriesTableViews.first(where: { $0.seriesID == seriseIdentifier }) {
            return tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? UITableViewCell & DropDownTableViewCellType
        }
        fatalError("The cell used in DropDown didn't confirm DropDownTableViewCellType protocol.")
    }
}

// MARK: Private
extension DropDownDropDownView {
    private func setup() {
        isHidden = true
        addSubview(surfaceView)
        surfaceView.contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
                surfaceView.topAnchor.constraint(equalTo: topAnchor),
                surfaceView.leadingAnchor.constraint(equalTo: leadingAnchor),
                surfaceView.trailingAnchor.constraint(equalTo: trailingAnchor),
                surfaceView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    private func assembleSeriesTableViews() {
        let topConstriant = verticalStackView.topAnchor.constraint(equalTo: surfaceView.contentView.topAnchor, constant: -configuration.menu.maximumHeight)
        
        NSLayoutConstraint.activate([
            topConstriant,
            verticalStackView.widthAnchor.constraint(equalTo: surfaceView.contentView.widthAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: surfaceView.contentView.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: configuration.menu.maximumHeight)
            ])
        
        self.topConstriant = topConstriant
        
        guard let series = dataSource?.series(in: self) else { return }
        
        if let headerView = dataSource?.headerView(for: self) {
            verticalStackView.insertArrangedSubview(headerView, at: 0)
        }
        
        seriesTableViews = series.map { serie -> DropDownTableView in
            let tableView = DropDownTableView()
            tableView.seriesID = serie
            tableView.backgroundColor = configuration.menu.backgroundColor
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.delegate = self
            tableView.dataSource = self
            tableView.showsVerticalScrollIndicator = delegate?.dropDownView(self, showsVerticalScrollIndicatorFor: serie) ?? true
            tableView.backgroundColor = delegate?.dropDownView(self, backgroundColorFor: serie)
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.separatorStyle = .none
            tableView.estimatedRowHeight = 44
            // register cell
            if let registedCell = registerCell[serie] {
                if let nib = registedCell.nib {
                    tableView.register(nib, forCellReuseIdentifier: registedCell.reuseIdentifier)
                } else if let cellClass = registedCell.cellCalss {
                    tableView.register(cellClass, forCellReuseIdentifier: registedCell.reuseIdentifier)
                }
            }
            horizontalStackView.addArrangedSubview(tableView)
            
            if let widthRatio = dataSource?.dropDownView(self, widthRatioFor: serie) {
                horizontalStackView.distribution = .equalSpacing
                NSLayoutConstraint.activate([
                        tableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: widthRatio)
                    ])
            } else {
                horizontalStackView.distribution = .fillEqually
            }

            return tableView
        }
    }
}

// UITableViewDelegate
extension DropDownDropDownView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableView = tableView as? DropDownTableView
            , let cell = tableView.cellForRow(at: indexPath) as? UITableViewCell & DropDownTableViewCellType
            else {
                return
        }
        if let seriesID = cell.seriesID {
            selectedSeriseIdentifier[seriesID] = cell.subSeriesID
            delegate?.dropDownView(self, didSelectRowWith: cell.seriesID, and: cell.subSeriesID, at: indexPath)
        }
    }
}

/// UITableViewDataSource
extension DropDownDropDownView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableView = tableView as? DropDownTableView, let seriesID = tableView.seriesID else { return 0 }
        if let selectedSubseriseIdentifier = selectedSeriseIdentifier[seriesID] {
            return dataSource?.dropDownView(self, numberOfRowsFor: seriesID, and: selectedSubseriseIdentifier) ?? 0
        }
        return dataSource?.dropDownView(self, numberOfRowsFor: seriesID, and: nil) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = tableView as? DropDownTableView, let seriesID = tableView.seriesID else { fatalError("The tableview used in DropDown must be DropDownTableView.") }
        let subSeriesID = selectedSeriseIdentifier[seriesID]
        if var cell = dataSource?.dropDownView(self, cellFor: seriesID, and: subSeriesID, at: indexPath) {
            cell.seriesID = seriesID
            return cell
        } else {
            fatalError("The cell in DropDown is not given.")
        }
    }
}
