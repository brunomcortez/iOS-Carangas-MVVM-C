//
//  CarTableViewCell.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    func configure(with viewModel: CarCellViewModel) {
        textLabel?.text = viewModel.name
        detailTextLabel?.text = viewModel.brand
    }
}
