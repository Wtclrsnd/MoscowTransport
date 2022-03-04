//
//  RouteCollectionViewCell.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 03.03.2022.
//

import UIKit

final class RouteCollectionViewCell: UICollectionViewCell {

	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillEqually
		stack.layer.cornerRadius = 12
		stack.spacing = 3
		return stack
	}()

	lazy var busLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .boldSystemFont(ofSize: 30)
		label.backgroundColor = .systemPink
		label.textColor = .white
		label.textAlignment = .center
		label.layer.cornerRadius = 12
		return label
	}()

	lazy var timeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 10)
		label.numberOfLines = 3
		label.backgroundColor = .clear
		label.textAlignment = .center
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		contentView.addSubview(stack)
		stack.addArrangedSubview(busLabel)
		stack.addArrangedSubview(timeLabel)

		busLabel.heightAnchor.constraint(equalToConstant: 6).isActive = true
		timeLabel.heightAnchor.constraint(equalToConstant: 5).isActive = true
		stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
		stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
		stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
		stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

		contentView.clipsToBounds = true
		contentView.layer.cornerRadius = 12
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
