//
//  ViewController.swift
//  AnimationUIKit
//
//  Created by Apple on 03.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tap: UIButton!
    
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo.withAlphaComponent(1.5)
        
        imageView = UIImageView(image: UIImage(named: "Cube"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
               imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ])
    }

    @IBAction func tapped(_ sender: UIButton) {
        tap.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, animations: {
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                self.imageView.transform = .identity
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5:
                self.imageView.transform = .identity
            default:
                break
            }
        }) { finished in
            self.tap.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 5 {
            currentAnimation = 0
        }
    }
    
}

