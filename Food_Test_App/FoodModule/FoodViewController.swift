//
//  ViewController.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import UIKit

class FoodViewController: UIViewController {
    
    var presenter: FoodPresenterProtocol!
    private let horizontalMenu = HorizontalMenu()
    
    let horizontalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var cityButton: LocalButton = {
        let button = LocalButton()
        button.setTitle(R.Strings.Comon.cityButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var headerViewHeightConstraint: NSLayoutConstraint?

    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = R.Colors.barColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var foodView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.barColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var pizzaCategoryView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = R.Colors.barColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    //MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButtonNavigationBar()
        addViews()
        layoutViews()
        setHorizontalMenu()
        SetSwitchCategoryView()
        horizontalMenu.cellDelegate = self
    }
    
    //MARK: - SETTINGS VIEWS
    private func setButtonNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cityButton)
    }
    
    private func setHorizontalMenu() {
        addChild(horizontalMenu)
        didMove(toParent: self)
        horizontalMenu.view.frame = horizontalView.bounds
        horizontalView.addSubview(horizontalMenu.view)
        view.addSubview(horizontalView)
        
        NSLayoutConstraint.activate([
            horizontalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
            horizontalView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func SetSwitchCategoryView() {
        let pizzaCategory = PizzaViewController()
        addChild(pizzaCategory)
        didMove(toParent: self)
        pizzaCategory.view.frame = self.pizzaCategoryView.bounds
        pizzaCategoryView.addSubview(pizzaCategory.view)
    }
    
    private func addViews() {
        view.addSubviews([foodView, pizzaCategoryView])
        foodView.addSubview(tableView)
        view.addSubview(headerView)
    }
    
    private func layoutViews() {
        let headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: headerView.maxHeight)
        self.headerViewHeightConstraint = headerHeightConstraint
        
        NSLayoutConstraint.activate([
            cityButton.heightAnchor.constraint(equalToConstant: 30),
            cityButton.widthAnchor.constraint(equalToConstant: 100),
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 5),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerHeightConstraint,
            
            foodView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            foodView.leftAnchor.constraint(equalTo: view.leftAnchor),
            foodView.rightAnchor.constraint(equalTo: view.rightAnchor),
            foodView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pizzaCategoryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            pizzaCategoryView.leftAnchor.constraint(equalTo: view.leftAnchor),
            pizzaCategoryView.rightAnchor.constraint(equalTo: view.rightAnchor),
            pizzaCategoryView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            tableView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -10),
            tableView.leftAnchor.constraint(equalTo: foodView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: foodView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: foodView.bottomAnchor)
        ])
        changeHeaderStateIfNeeded()
    }
    
    // MARK: Private Calculate
    private func calculateHeaderViewHeight(for currentOffset: CGFloat) {
        if currentOffset <= 0 {
            setHeaderViewHeight(for: headerView.maxHeight)
        } else {
            var newHeight = headerView.maxHeight - currentOffset
            if newHeight < headerView.minHeight {
                newHeight = headerView.minHeight
            }
            setHeaderViewHeight(for: newHeight)
        }
    }

    private func setHeaderViewHeight(for newHeight: CGFloat) {
        if headerViewHeightConstraint?.constant != newHeight {
            headerViewHeightConstraint?.constant = newHeight
            headerView.height = newHeight
        }
    }

    private func changeHeaderStateIfNeeded() {
        var offset = CGPoint(x: 0, y: -330)
        var tableContentInset: UIEdgeInsets = .zero
        offset = CGPoint(x: 0, y: -330)
        tableContentInset.top = 250
        tableView.contentInset = tableContentInset
        tableView.setContentOffset(offset, animated: true)
        setHeaderViewHeight(for: headerView.maxHeight)
        view.layoutIfNeeded()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: - UITableViewDelegate
extension FoodViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.foodModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.reuseID, for: indexPath) as? FoodTableViewCell else { return UITableViewCell() }
        cell.configure(presenter.foodModel.map { $0[indexPath.row] }! )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}

// MARK: UIScrollView
extension FoodViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        calculateHeaderViewHeight(for: currentOffset)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        var offset: CGPoint = .zero

        let transition = UIViewPropertyAnimator(duration: 0.0, dampingRatio: 1) {
            if currentOffset < 200 {
                offset.y = -300
            } else {
                guard currentOffset < 206 else { return }
                offset.y = -230
            }
            DispatchQueue.main.async {
                self.tableView.setContentOffset(offset, animated: true)
            }
        }
        transition.startAnimation()
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee.y = max(targetContentOffset.pointee.y - 1, 1)
    }
}

extension FoodViewController: selectedItemProtocol {
    func selectItem(indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            self.foodView.isHidden = false
            self.pizzaCategoryView.isHidden = true
        default:
            self.foodView.isHidden = true
            self.pizzaCategoryView.isHidden = false
        }
    }
}

extension FoodViewController: FoodViewProtocol {
    func success() {
         reloadData()
    }
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
