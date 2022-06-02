//
//  ViewController.swift
//  flappyImage
//
//  Created by Daniel Lyubenov on 2.06.22.
//

import UIKit

class ViewController: UIViewController {

    //strong because the view doesent hold a strong refference to the imageView
    var imageView: UIImageView!
    
    var frame: Int = 1
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        imageView  = UIImageView(frame: CGRect(x: self.view.frame.minX + 15, y: self.view.frame.minY + 15, width: 100, height: 100));
        imageView.image = UIImage(named: "racoongrooving")
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        self.view.addSubview(imageView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.imageView.delete(self)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.frame += 1
            
            if self.frame > 5 {self.frame = 1}
            
            calculateMove()
        }
    }
    
    func calculateMove() {
        switch self.frame {
        case 1:
            self.x = self.view.frame.minX + 15
            self.y = self.view.frame.minY + 15
        case 2:
            self.x = self.view.frame.minX + 15
            self.y = self.view.frame.maxY - self.imageView.frame.height - 15
        case 3:
            self.x = self.view.frame.maxX - self.imageView.frame.width - 15
            self.y = self.view.frame.maxY - self.imageView.frame.height - 15
        case 4:
            self.x = self.view.frame.maxX - self.imageView.frame.width - 15
            self.y = self.view.frame.minY + 15
        case 5:
            self.x = self.view.frame.midX - self.imageView.frame.width/2
            self.y = self.view.frame.midY - self.imageView.frame.height/2
        default:
            print("error")
        }
        
        move()
    }
    
    func move() {
        UIView.animate(withDuration: 1.0) {
                    self.imageView.frame = CGRect(
                        x: self.x,
                        y: self.y,
                        width: self.imageView.frame.width,
                        height: self.imageView.frame.height
                    )
                }
    }
}

