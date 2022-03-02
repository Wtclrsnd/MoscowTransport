//
//  ViewController.swift
//  MoscowTransport
//
//  Created by Emil Shpeklord on 01.03.2022.
//

import UIKit

protocol StopsInteractorProtocol: AnyObject {
	func getData()
	func getStopData(id: String, completion: @escaping (CurrentStop) -> Void)
}

class StopsViewController: UIViewController, StopsViewControllerProtocol {

	var output: StopsInteractorProtocol?

	private lazy var stops: [Stop] = [] {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}

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

		output?.getData()
	}

	func setUpUI() {
		view.addSubview(tableView)
		tableView.frame = view.bounds

		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Остановки"
		navigationController?.navigationBar.tintColor = .systemPink
	}

	//the presenter method
	func getData(stops: [Stop]) {
		self.stops = stops
	}
}

extension StopsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return stops.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = stops[indexPath.row].name
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = MapViewController()
		//here i break VIP Cycle. Sssooory...
		output?.getStopData(id: stops[indexPath.row].id, completion: { stop in vc.stop = stop
		} )
		navigationController?.pushViewController(vc, animated: true)
	}
}
