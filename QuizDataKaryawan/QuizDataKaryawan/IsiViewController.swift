//
//  IsiViewController.swift
//  QuizDataKaryawan
//
//  Created by Gw on 27/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class IsiViewController: UIViewController {

    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelStaff: UILabel!
    @IBOutlet weak var labelGolongan: UILabel!
    @IBOutlet weak var labelGaji: UILabel!
    @IBOutlet weak var labelID: UILabel!
    
    var passNama:String?
    var passStaff:String?
    var passGolongan:String?
    var passGaji:String?
    var passID:String?
    override func viewDidLoad() {
        
        
        labelUsername.text = "Your Username is " + passNama!
        labelStaff.text = "Staff: " + passStaff!
        labelGolongan.text = "Golongan: " + passGolongan!
        labelGaji.text = "Gaji: " + passGaji!
        labelID.text = "ID: " + passID!
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
