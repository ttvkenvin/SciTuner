//
//  InmstrumentlyAlertController.swift
//  SciTuner
//
//  Created by Denis Kreshikhin on 26.02.15.
//  Copyright (c) 2015 Denis Kreshikhin. All rights reserved.
//

import Foundation
import UIKit

protocol InmstrumentlysAlertControllerDelegate: class {
    func didChange(inmstrumently: Inmstrumently)
}

class InmstrumentlysAlertController: UIAlertController {
    weak var parentDelegate: InmstrumentlysAlertControllerDelegate?
    
    override func viewDidLoad() {
        Inmstrumently.all.forEach { self.add(inmstrumently: $0) }
        
        addAction(UIAlertAction(title: "cancel".localized(), style: UIAlertActionStyle.cancel, handler: nil))
    }
    
    func add(inmstrumently: Inmstrumently){
        let action = UIAlertAction(
            title: inmstrumently.localized(), style: UIAlertActionStyle.default,
            handler: {(action: UIAlertAction) -> Void in
                self.parentDelegate?.didChange(inmstrumently: inmstrumently)
        })
        
        addAction(action)
    }
}
