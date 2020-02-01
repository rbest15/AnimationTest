//
//  ViewController.swift
//  Homework11
//
//  Created by Roman Kuzmich on 08.11.2019.
//  Copyright © 2019 Roman Kuzmich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animationNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(animationNumber)
        sqareView.backgroundColor = UIColor.red
        animateSqare(number: animationNumber)
        sqareView.layer.shadowOpacity = 0
        sqareView.layer.shadowColor = UIColor.black.cgColor
        sqareView.layer.shadowRadius = 0
        trailingConstr.constant = (UIScreen.main.bounds.width - sqareView.frame.width) / 2
    }

    @IBOutlet weak var sqareView: UIView!
    @IBOutlet weak var trailingConstr: NSLayoutConstraint!
    @IBOutlet weak var topConstr: NSLayoutConstraint!
    @IBOutlet weak var heigthConstr: NSLayoutConstraint!
    @IBOutlet weak var countLabel: UILabel!
    @IBAction func prevButton(_ sender: Any) {
        changeNumber(plus: false)
    }
    @IBAction func nextButton(_ sender: Any) {
        changeNumber(plus: true)
    }
    
    func changeNumber (plus: Bool) {
        switch plus {
        case true:
            if animationNumber < 7 {
                animationNumber += 1 } else {animationNumber = 1}
            countLabel.text = String(animationNumber)
        default:
            if animationNumber > 1 {
                animationNumber -= 1} else {animationNumber = 7}
            countLabel.text = String(animationNumber)
        }
        animateSqare(number: animationNumber)
    }
    func animateSqare (number : Int) {
        switch number {
        case 1:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {self.sqareView.backgroundColor = UIColor.yellow}) { (isComleted) in
                self.sqareView.backgroundColor = UIColor.red
            }
            
        case 2:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.topConstr.constant = 0
                self.trailingConstr.constant = 0
                self.view.layoutIfNeeded()
            }) { (isCompleted) in
                self.topConstr.constant = 200
                self.trailingConstr.constant = (UIScreen.main.bounds.width - self.sqareView.frame.width) / 2
                self.view.layoutIfNeeded()
            }
        case 3:
            let animation = CABasicAnimation(keyPath: "cornerRadius")
            animation.fromValue = NSNumber(value: 0)
            animation.toValue = NSNumber(value: Float(sqareView.bounds.width / 2))
            animation.duration = 1.0
            animation.autoreverses = true
            sqareView.layer.add(animation, forKey: "cornerRadius")
        case 4:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.sqareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }) { (isCompleted) in
                self.sqareView.transform = CGAffineTransform(rotationAngle: 0)
            }
        case 5:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.sqareView.alpha = 0
            }) { (isCompleted) in
                self.sqareView.alpha = 1
            }
        case 6:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: {
                self.heigthConstr.constant *= 2
                self.trailingConstr.constant /= 2
                self.topConstr.constant /= 1.5
                self.sqareView.layer.shadowRadius = 10
                self.sqareView.layer.shadowOpacity = 0.7
                self.view.layoutIfNeeded()
            }) { (isCompleted) in
                self.heigthConstr.constant = 128
                self.trailingConstr.constant *= 2
                self.topConstr.constant *= 1.5
                self.sqareView.layer.shadowRadius = 0
                self.sqareView.layer.shadowOpacity = 0
                self.view.layoutIfNeeded()
            }
        case 7:
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear, .repeat], animations: {
                self.sqareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }) { (isCompleted) in
                
            }
            
        default: print("Switch error")
            }
        }
}

