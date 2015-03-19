//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Jeffrey Duhamel on 3/19/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    var villain:Villain!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        villainImage.image = UIImage(named: villain.imageName)
        villainLabel.text = villain.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
