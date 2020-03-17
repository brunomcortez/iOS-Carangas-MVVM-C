//
//  AddEditViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    @IBOutlet weak var tfBrand: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var scGasType: UISegmentedControl!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var viewModel: AddEditViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else { return }
        title = viewModel.title
        tfBrand.text = viewModel.brand
        tfName.text = viewModel.name
        tfPrice.text = viewModel.price
        scGasType.selectedSegmentIndex = viewModel.gasType
        btAddEdit.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    @IBAction func addEdit(_ sender: UIButton) {
        viewModel?.refreshCar(
            name: tfName.text!,
            brand: tfBrand.text!,
            gasType: scGasType.selectedSegmentIndex,
            price: Int(tfPrice.text!) ?? 0,
            onComplete: { (result) in
                switch result {
                    case .failure:
                        print("Error")
                    case .success:
                        self.goBack()
                }
        })
    }
    
    func goBack() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    
}
