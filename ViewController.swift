//
//  ViewController.swift
//  SecondEasyApp
//
//  Created by Segota, Sheradon on 10/10/17.
//  Copyright © 2017 Segota, Sheradon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
    {
    private var soundPlayer : AVAudioPlayer?
    private var imageCounter : Int = 0
    private lazy var color : ColorTools = ColorTools()
    
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var soundSlider: UISlider!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var firstButton:UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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

    @IBAction func soundButton(_ sender: UIButton)
    {
    }
    @IBAction func changePicture(_ sender: UIButton)
    {
        switchImage()
    }

    private func switchImage() -> Void
    {
        if (imageCounter > 2)
        {
            imageCounter = 0
        }
        
        if (imageCounter == 0)
        {
            imageFrame.image = UIImage(named: "lel")
        }
            
        else if (imageCounter == 1)
        {
            imageFrame.image = UIImage(named: "Poke")
        }
        else
        {
            imageFrame.image = UIImage(named: "images 2")
        }
        view.backgroundColor = color.createRandomColor();
        imageCounter += 1
    }

    @IBAction func soundPlay()
    {
        playMusicFile()
    }
    
    private func playMusicFile() -> Void
{
    if let isPlaying = soundPlayer?.isPlaying
    {
        if (isPlaying)
        {
            soundPlayer?.pause()
        }
    }
    
    if (soundPlayer?.isPlaying)!
    {
        soundPlayer?.pause()
    }
        
    else
    {
        soundPlayer?.play()
    }
}

private func loadAudioFile() -> Void
{
    if let soundURL = NSDataAsset(name: "Sound")
    {
        do
        {
            try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try! AVAudioSession.sharedInstance().setActive(true)
        
            try soundPlayer = AVAudioPlayer(data: soundURL.data)
        
            soundSlider.maximumValue = Float ((soundPlayer?.duration)!)
            Timer.scheduledTimer (timeInterval: 0.2, target: self, selector: (#selector(self.updateSlider)), userInfo: nil, repeats: true)
        }
        catch
        {
            print("Audio File Load Error")
        }
    }
    
    }
    @objc private func updateSlider() -> Void
    {
        soundSlider.value = Float ((soundPlayer?.currentTime)!)
    }
    @IBAction func slidingSound(  sender: UISlider)
    {
        let seekTime = Double (soundSlider.value)
        soundPlayer?.currentTime = seekTime
    }
}

