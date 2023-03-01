//
//  ConfigurableContainerView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 3/1/23.
//

import UIKit
import FlexLayout
import PinLayout

// MARK: - cell의 contentview에 해당하는 view가 채택해야 할 프로토콜
protocol ConfigurableContainerView: UIView {
    associatedtype DataType
    associatedtype Delegate
    
    var delegate: Delegate? { get set }
    
    func configure(data: DataType)
}

// MARK: - cell이 채택해야 할 프로토콜
protocol GenericContainerCellIdentifiable {
    static var reuseIdentifier: String { get }
}

protocol ConfigurableCell: GenericContainerCellIdentifiable {
    associatedtype ViewType: ConfigurableContainerView
    
    var view: ViewType { get }
}

extension ConfigurableCell {
    static var reuseIdentifier: String {
        return String(describing: ViewType.self)
    }
}

// MARK: - contentview안에 래핑하여 사용할 수 있는 generic cell을 구성
class GenericContainerTableCell<T: ConfigurableContainerView>: UITableViewCell, ConfigurableCell {
    typealias ViewType = T
    
    let view: ViewType = ViewType()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let cv = contentView
        
        cv.flex.addItem(view) // check
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        performLayout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        performLayout()
        return contentView.frame.size
    }
    
    fileprivate func performLayout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
}

// MARK: - generic cell configurator 작성
protocol CellCOnfigurator: GenericContainerCellIdentifiable {
    func configure(cell: UIView)
    func configure(cell: UIView, delegate: AnyObject?)
}

final class TableCellConfigurator<CellType: ConfigurableCell>: CellCOnfigurator where CellType: UITableViewCell {
    
    static var cellType: CellType.Type { return CellType.self }
    static var reuseIdentifier: String { return CellType.reuseIdentifier }
    
    let item: CellType.ViewType.DataType
    
    init(item: CellType.ViewType.DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        configure(cell: cell, delegate: nil)
    }
    
    func configure(cell: UIView, delegate: AnyObject?) {
        guard let configurableInstance = cell as? CellType else {
            print("it does not configurable instance!")
            return
        }
        
        configurableInstance.view.configure(data: item)
        
        if let delegateObject = delegate as? CellType.ViewType.Delegate {
            configurableInstance.view.delegate = delegateObject
        } else {
            print("expect protocol: \(CellType.ViewType.Delegate.self). but, actual value : \(String(describing: delegate))")
        }
    }
}

// MARK: - cell, configurator 타입 별칭들을 모아놓은 구조체
struct Component {
    
    /// Cell typealias
    struct Cell {
        typealias Title = GenericContainerTableCell<TitleView> // ConfigurableContainerView를 채택한 UIView 타입
        typealias Profile = GenericContainerTableCell<ProfileView>
        typealias Content = GenericContainerTableCell<ContentView>
        typealias Date = GenericContainerTableCell<DateView>
        
        static var allTypes: [UITableViewCell.Type] {
            return [
                Cell.Title.self,
                Cell.Profile.self,
                Cell.Content.self,
                Cell.Date.self
            ]
        }
    }
    
    /// Configurator  typealias
    struct Configurator {
        typealias Title = TableCellConfigurator<Component.Cell.Title>
        typealias Profile = TableCellConfigurator<Component.Cell.Profile>
        typealias Content = TableCellConfigurator<Component.Cell.Content>
        typealias Date = TableCellConfigurator<Component.Cell.Date>
    }
    
}

final class ViewModel {
    var items: [CellCOnfigurator] = [
        Component.Configurator.Title(item: "이것이 제목이다"),
        Component.Configurator.Profile(item: .init(imageName: "profile", name: "호호")),
        Component.Configurator.Content(item: "내용"),
        Component.Configurator.Date(item: Date())
    ]
}







