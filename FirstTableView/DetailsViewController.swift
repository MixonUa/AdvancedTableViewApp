//
//  DetailsViewController.swift
//  FirstTableView
//
//  Created by Михаил Фролов on 17.01.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet private weak var cityImageView: UIImageView!
    
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityImageView.contentMode = .scaleAspectFit
        cityImageView.backgroundColor = .darkGray
        
        title = city?.name ?? "default"
        cityImageView.image = city?.image
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
