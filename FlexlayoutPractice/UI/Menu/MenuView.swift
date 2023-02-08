//
//  MenuView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/9/23.
//

import UIKit

protocol MenuViewDelegate: AnyObject {
    func didSelect(pageType: PageType)
}

class MenuView: UIView {
    
    weak var delegate: MenuViewDelegate?
    
    fileprivate let cellIdentifier = "MenuViewCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .orange
        addSubview(tableView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        tableView.pin.size(frame.size)
    }
}

// MARK: UITableViewDataSource
extension MenuView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PageType.count.rawValue
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = PageType(rawValue: indexPath.row)?.text ?? "FlexLayout Example"
        cell.textLabel?.font = .systemFont(ofSize: 12)
        return cell
    }
}

// MARK: UITableViewDelegate
extension MenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pageType = PageType(rawValue: indexPath.row) {
            delegate?.didSelect(pageType: pageType)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

