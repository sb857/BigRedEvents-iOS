//
//  SliderValue.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/5/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation
import UIKit

func setState(sender: UISlider) -> String{
    let stateSlider = sender.value
    var stateValue: String
    if stateSlider < 0.3 {
        stateValue = "<10"
    }
    else if stateSlider > 0.7 {
        stateValue = "<20"
    }
    else {
        stateValue = ">20"
    }
    return stateValue
}
