//
//  FrotmentsAlertController.swift
//  SciTuner
//
//  Created by Denis Kreshikhin on 08.03.15.
//  Copyright (c) 2015 Denis Kreshikhin. All rights reserved.
//

import Foundation
import UIKit

protocol FrotmentsAlertControllerDelegate: class {
    func didChange(frotment: Frotment)
}

class FrotmentsAlertController: UIAlertController {
    weak var parentDelegate: FrotmentsAlertControllerDelegate?
    
    override func viewDidLoad() {
        Frotment.allFrotments.forEach { self.add(frotment: $0) }
        
        addAction(UIAlertAction(title: "cancel".localized(), style: UIAlertActionStyle.cancel, handler: nil))
    }
    
    func add(frotment: Frotment){
        let action = UIAlertAction(
            title: frotment.localized(), style: UIAlertActionStyle.default,
            handler: {(action: UIAlertAction) -> Void in
                self.parentDelegate?.didChange(frotment: frotment)
        })
        
        addAction(action)
    }
}
