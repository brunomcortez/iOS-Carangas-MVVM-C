//
//  CarsTableViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {

    lazy var viewModel: CarsViewModel = CarsViewModel()
    weak var coordinator: CarsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.carsLoaded = carsLoaded
        refreshControl?.addTarget(self, action: #selector(loadCars), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCars()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.destination {
//
//            case let carViewController as CarViewController:
//                let indexPath = tableView.indexPathForSelectedRow!
//                let car = viewModel.getCarAt(indexPath: indexPath)
//                carViewController.viewModel = CarViewModel(car: car)
//                break
//
//            case let addEditViewController as AddEditViewController:
//                addEditViewController.viewModel = AddEditViewModel()
//                break
//
//            default:
//                break
//            }
//        }
    
//    @IBAction createCar(selnder: Any) {
//
//    }
    
    @objc func loadCars() {
        viewModel.loadCars()
    }
    
    func carsLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CarTableViewCell else { fatalError("") }
        let carCellViewModel = viewModel.viewModelFor(indexPath: indexPath)
        cell.configure(with: carCellViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteCar(at: indexPath) { (result) in
                switch result {
                case .success:
                    print("Success")
                case .failure:
                    print("error")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = viewModel.getCarAt(indexPath: indexPath)
        coordinator?.showCar(car)
    }
}
