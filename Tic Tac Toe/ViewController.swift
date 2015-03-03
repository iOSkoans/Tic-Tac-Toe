//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Calvin Cheng on 28/2/15.
//  Copyright (c) 2015 Hello HQ Pte Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var turnNumber = 1
    
    var winner = 0
    
    // 0 is empty, 1 is nought, 2 is cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var restart: UIButton!
    
    @IBAction func restartPressed(sender: AnyObject) {
        
        turnNumber = 1
        
        winner = 0
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button:UIButton
        
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
            
        }
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        
        restart.alpha = 0
                
    }
    
    @IBOutlet var label: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        println(sender.tag)
        
        if gameState[sender.tag] == 0 && winner == 0 {
            
            var image = UIImage()
            
            if turnNumber % 2 == 0 {
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 2
            } else {
                image = UIImage(named: "nought.png")!
                gameState[sender.tag] = 1
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0 {
                    
                    winner = gameState[combination[0]]
                    
                }
                
            }
            
            if winner != 0 {
                
                println("We have a winner!")
                
                if winner == 1 {
                    
                    label.text = "Noughts has won!"
                    
                } else {
                    
                    label.text = "Crosses has won!"
                    
                }
                
                UIView.animateWithDuration(1, animations: {
                    println("show the winner")
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    self.restart.alpha = 1
                    
                })
                
            }
            
            turnNumber++
            
            sender.setImage(image, forState: .Normal)
            
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        println("view did layout subviews")
        if winner == 0 {
            label.center = CGPointMake(label.center.x - 400, label.center.y)
            restart.alpha = 0
        }
    }
    
}

