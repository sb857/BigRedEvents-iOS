//
//  ViewController.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/1/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PlaceDelegate, UISearchBarDelegate {
    
    var search: UISearchBar!
    var refresh: UIRefreshControl!
    var tableView: UITableView!
    var place: [Place]!=[]
    var searchedPlaces: [Place]=[]
    let myColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)
    
    let reuseIdentifier = "cell"
    
    let cellHeight: CGFloat = 150
    
    let defaults=UserDefaults.standard
    let searchController=UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Events"
        view.backgroundColor = .white
        
        let f = Place(name: "Court Kay Bauer",  placeimagestring: "court")
        let g = Place(name: "Mary Donlon",placeimagestring: "donlon")
        let h = Place(name: "Low Rise 7", placeimagestring: "lowrise")
        let i = Place(name: "High Rise 5", placeimagestring: "highrise")
        let j = Place(name: "Clara Dickson", placeimagestring: "dickson")
        
        place = [f, g, h, i, j]
        
        searchedPlaces=place
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Dorms"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //Setup the Search Bar
        search = UISearchBar()
        search.placeholder = "Search for Dorms"
        search.barTintColor = .white
        search.layer.borderColor = myColor.cgColor
        search.layer.borderWidth = 1
        search.delegate = self
        search.layer.cornerRadius = 10
        search.translatesAutoresizingMaskIntoConstraints = false
        let textFieldInsideSearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        textFieldInsideSearchBar?.textColor = .gray
        view.addSubview(search)
        
        // Initialize tableView
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private instance methods
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        searchedPlaces = place.filter({( place: Place) -> Bool in
            return place.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension ViewController: UITableViewDataSource {
    
    /// Tell the table view how many rows should be in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return searchedPlaces.count
        }
        
        return place.count
    }
    
    /// Tell the table view what cell to display for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PlaceTableViewCell
        let places: Place
        if isFiltering() {
            places = searchedPlaces[indexPath.row]
        } else {
            places = place[indexPath.row]
        }
        cell.configure(for: places)
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 5
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        return cell
        
    }
}
extension ViewController: UITableViewDelegate {
    
    /// Tell the table view what height to use for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    /// Tell the table view what should happen if we select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //p[let song = songs![IndexPath]
        let places = place[indexPath.row]
        let destination = DetailViewController()
        destination.row = indexPath.row
        destination.place = places
        destination.placeDelegate = self
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    func changedPlace(row: Int, place: Place) {
        tableView.reloadData()
    }
    
    /// Tell the table view what should happen if we deselect a row
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deselected")
    }
    
}


