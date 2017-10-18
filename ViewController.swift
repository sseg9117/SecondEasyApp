//
//  ViewController.swift
//  SecondEasyApp
//
//  Created by Segota, Sheradon on 10/10/17.
//  Copyright © 2017 Segota, Sheradon. All rights reserved.
//

import UIKit

class ViewController: UIViewController
    {
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var soundSlider: UISlider!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var firstButton:UIButton!
    
    @IBAction func imageButton() -> Void
    {
        switchImage()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    @IBAction func firstMethod(_ sender: UIButton)
    {
        if (firstButton.backgroundColor == .black)
        {
            firstButton.backgroundColor = .yellow
        }
        else
        {
            firstButton.backgroundColor = .cyan
        }
        view.backgroundColor = createRandomColor()
        firstButton.setTitleColor (createRandomColor(), for: .normal)
        firstButton.backgroundColor = createRandomColor()
    }
    
    @IBAction func soundSlider(_ sender: UISlider) {
    }
    private func createRandomColor() -> UIColor
    {
        let newColor :UIColor
        let redAmount = CGFloat (Double (arc4random_uniform(256))/255.00)
        let greenAmount = CGFloat (Double (arc4random_uniform(256))/255.00)
        let blueAmount = CGFloat (Double (arc4random_uniform(256))/255.00)
        newColor = UIColor(red: redAmount, green: greenAmount, blue: blueAmount, alpha: CGFloat(1.0))
        
        return newColor
    }
    @IBAction func soundButton(_ sender: UIButton) {
    }
    
    @IBAction func imageButton(_ sender: UIButton) {
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func switchImage() -> Void
    {
        if (imageCounter > 2)
        {
            imageCounter = 0
        }
        if (imageCounter == 0)
        {
            imageFrame.image = UImage(named: " image 1. ")
        }
        else if (imageCounter == 1 )
        {
            imageFrame.image = UIImage(named:" image 123 ")
        }
        else
        {
            imageFrame.image = UIImage(named:" image 3 ")
        }
        
        imageCounter += 1
    }
}

