//
//  customUIButton.swift
//  CalculatorFinal
//
//  Created by Priya Xavier on 6/17/17.
//  Copyright © 2017 Priya. All rights reserved.
//



import UIKit

class CustomUIButton: UIButton {
  
  required init?(coder aDecoder: NSCoder) {
    
    super.init(coder: aDecoder)
    
    //self.layer.cornerRadius = 20.0;
    self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    self.layer.borderWidth = 0.5
    //self.tintColor = UIColor.white
    self.setTitleColor(UIColor.black, for: .normal)
    //   self.titleLabel?.textColor = UIColor.black
    self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    
    // self.titleLabel?.font.withSize(20)
    
  }
}
