//
//  HistoryTableViewController.swift
//  RockPaperScissors
//
//  Created by Jeffrey Duhamel on 3/17/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryTableViewController: UIViewController, UITableViewDataSource {
    var history: [RPSMatch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let match = history[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell") as RPSTableHistoryCell
        cell.userImage.image = imageForRPS(match.p1)
        cell.cpuImage.image = imageForRPS(match.p2)
        cell.resultLabel.text = resultString(match)
        
        return cell
        
    }
    
    @IBAction func doneButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func resultString(match: RPSMatch) -> String {
        if match.p1 == match.p2{
            return "It was a tie."
        }else{
            return match.p1.defeats(match.p2) ? "You Won!!!" : "You Lost."
        }
    }
    
    func imageForRPS(selection:RPS)->UIImage?{
        var image:UIImage?
        
        switch(selection){
        case .Paper:
            image = UIImage(named: "paper")
        case .Rock:
            image = UIImage(named: "rock")
        case .Scissors:
            image = UIImage(named: "scissors")
        default:
            image = nil
            
        }
        if image? != nil{
            image = imageResize(image!, sizeChange: CGSize(width: 32, height: 32))
        }

        return image
    }
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }

}

