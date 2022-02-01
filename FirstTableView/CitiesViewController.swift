//
//  CitiesViewController.swift
//  FirstTableView
//
//  Created by Михаил Фролов on 16.01.2022.
//

import UIKit

class CitiesViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    
    private var citiesImages: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities"
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        citiesImages = MockGenerator.generateRandomCities()
        cityTableView.reloadData() // после изменения масива нужно обновить таблицу
    }
    
    @IBAction func editButtonDidPressed(_ sender: Any) {
        cityTableView.isEditing = !cityTableView.isEditing
    }
    @IBAction func refreshButtonDidPressed(_ sender: Any) {
        citiesImages = MockGenerator.generateRandomCities()
        cityTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails" else { return }
        guard let destinationVC = segue.destination as? DetailsViewController else { return }
        guard let cityCell = sender as? UITableViewCell else { return }
        guard let indexPath = cityTableView.indexPath(for: cityCell) else { return }
        let city = citiesImages[indexPath.row]
        destinationVC.city = city
        
    }
}
    //MARK: - UITableViewDelegate & UITableViewDataSource
extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesImages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell // as? + guard let
        let currentCity = citiesImages[indexPath.row]
        cell.updateCell(name: currentCity.name, image: currentCity.image) //image (Literal) -> нажать на квадрат и выбрать
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
    // MOVE Cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let pickedCell = citiesImages[sourceIndexPath.row]
        citiesImages.remove(at: sourceIndexPath.row)
        citiesImages.insert(pickedCell, at: destinationIndexPath.row)
    }
    
    // DELETE Cell
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            citiesImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
    

