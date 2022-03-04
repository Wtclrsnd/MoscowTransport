//
//  SheetViewController.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 03.03.2022.
//

import UIKit

class SheetViewController: UIViewController {

	var name: String?
	var type: String?
	var routes: [RoutePath] = []
	var colors: [UIColor] = [.systemPink, .orange, .blue, .cyan, .magenta, .green, .link, .brown, .purple, .red, .gray, .darkGray]

	private let reusableIdentifier = "myCell"

	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fill
		stack.spacing = 5
		return stack
	}()

	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 35)
		return label
	}()

	private lazy var typeLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 20)
		return label
	}()


	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let width = UIScreen.main.bounds.width
		layout.sectionInset = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 20)
		layout.itemSize = CGSize(width: (width - 60) / 3, height: width / 4)
		layout.minimumInteritemSpacing = 5
		layout.minimumLineSpacing = 10

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(RouteCollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)

		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .systemBackground
		self.sheetPresentationController?.largestUndimmedDetentIdentifier = .medium
		self.sheetPresentationController?.prefersGrabberVisible = true

		setUpUI()
	}

	private func setUpUI() {
		nameLabel.text = name
		typeLabel.text = type

		stack.addArrangedSubview(nameLabel)
		stack.addArrangedSubview(typeLabel)
		stack.addArrangedSubview(collectionView)
		view.addSubview(stack)

		stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
		stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true

		collectionView.reloadData()
	}
}

extension SheetViewController: UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return routes.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: reusableIdentifier,
			for: indexPath) as? RouteCollectionViewCell else { return UICollectionViewCell() }
		cell.backgroundColor = .clear
		cell.busLabel.backgroundColor = colors[indexPath.row]
		cell.busLabel.text = routes[indexPath.row].number
		var arrivals = ""
		guard let stackArrivals = routes[indexPath.row].timeArrival else { return cell }

		for i in stackArrivals {
			arrivals += i + " "
		}
		cell.timeLabel.text = "Прибудет\nчерез\n" + arrivals
		return cell
	}
}
