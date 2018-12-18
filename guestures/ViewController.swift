//
//  ViewController.swift
//  guestures
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.width)
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "骚"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowOpacity = 1
        view.addSubview(label)
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        label.isUserInteractionEnabled =  true;
    }
    
    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x;
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    @IBAction func move(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel {
                UIView.animate(withDuration: 1){
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                }
            }
        }
        
    }
    
    @IBAction func deleteall(_ sender: Any) {
        for label in view.subviews {
            if label is UILabel{
                label.removeFromSuperview()
        }
    }
}
}
