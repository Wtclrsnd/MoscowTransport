//
//  ViewController.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import UIKit

protocol StopsInteractorProtocol: AnyObject {
	
}

class StopsViewController: UIViewController, StopsViewControllerProtocol {

	var output: StopsInteractorProtocol?

	private lazy var stops: [Stop] = []

	private lazy var tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.delegate = self
		tableView.dataSource = self

		setUpUI()
	}

	func setUpUI() {
		view.addSubview(tableView)
		tableView.frame = view.bounds

		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Остановки"
		navigationController?.navigationBar.tintColor = .systemPink
	}
}

extension StopsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		return cell
	}


}
