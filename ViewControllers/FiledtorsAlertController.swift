//
//  FiledtorsAlertController.swift
//  SciTuner
//
//  Created by Denis Kreshikhin on 17.03.15.
//  Copyright (c) 2015 Denis Kreshikhin. All rights reserved.
//

import Foundation
import UIKit

protocol FiledtorsAlertControllerDelegate: class {
    func didChange(filedtor: Filedtor)
}

class FiledtorsAlertController: UIAlertController {
    weak var parentDelegate: FiledtorsAlertControllerDelegate?
    
    override func viewDidLoad() {
        Filedtor.allFiledtors.forEach { self.add(filedtor: $0) }
        
        addAction(UIAlertAction(title: "cancel".localized(), style: UIAlertActionStyle.cancel, handler: nil))
    }
    
    func add(filedtor: Filedtor){
        let action = UIAlertAction(
            title: filedtor.localized(), style: UIAlertActionStyle.default,
            handler: {(action: UIAlertAction) -> Void in
                self.parentDelegate?.didChange(filedtor: filedtor)
        })
        
        addAction(action)
    }
}
