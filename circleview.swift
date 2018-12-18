//
//  circleview.swift
//  guestures
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
@IBDesignable
class circleview: UIView {

   @IBInspectable var fillColor:UIColor?
   @IBInspectable var storkeColor:UIColor?
    
    func setup(){
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.numberOfTouchesRequired = 1
    }
    @objc func tap(recognizer:UITapGestureRecognizer){
        switch recognizer.state {
        case .recognized:
            print("double clicked")
            
        default:
            break
        }
    }
    @objc func pinch(recognizer:UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
    }
    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x;
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        fillColor?.setFill()
        storkeColor?.setStroke()
        path.fill()
        path.stroke()
    }
 

}
