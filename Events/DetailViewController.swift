//
//  DetailViewController.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/1/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

protocol PlaceDelegate {
    func changedPlace(row: Int, place: Place)
}

protocol SaveButtonDelegate {
    func addSaveButtonPressed()
}

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, SaveButtonDelegate{

    
    var row: Int!
    var place: Place!
    var placeDelegate: PlaceDelegate!
    var addButton: UIButton!
    var addBarButtonItem: UIBarButtonItem!
    var detailtableView: UITableView!
    var search: UISearchBar!
    var events: [Events] = [Events]()
    var searchedEvents: [Events]=[]
    
    let reuseIdentifier = "cell"
    let textFieldColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 0.1)
    
    let cellHeight: CGFloat = 120
    let searchController=UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = place.name
        view.backgroundColor = .white
        
       // createEvents()
        
        addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        view.addSubview(addButton)
        
        addBarButtonItem = UIBarButtonItem(customView: addButton)
        self.navigationItem.rightBarButtonItem = addBarButtonItem
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Events"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //Setup the Search Bar
        search = UISearchBar()
        search.placeholder = "Search for Events"
        search.barTintColor = .white
        search.layer.borderWidth = 1
        search.delegate = self
        search.layer.cornerRadius = 10
        search.translatesAutoresizingMaskIntoConstraints = false
        let textFieldInsideSearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        textFieldInsideSearchBar?.textColor = .gray
        view.addSubview(search)

        detailtableView = UITableView(frame: .zero)
        detailtableView.translatesAutoresizingMaskIntoConstraints = false
        detailtableView.delegate = self as UITableViewDelegate
        detailtableView.dataSource = self
        detailtableView.register(EventTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(detailtableView)
        
        setupConstraints()
        getEvents()
    }
    
    // MARK: - Private instance methods
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            detailtableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailtableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailtableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            detailtableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    

    @objc func addButtonPressed() {
        let addVC = addViewController()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    @objc func dismissviewcontroller(){
        dismiss(animated: true, completion: nil)
    }
    
    func addSaveButtonPressed() {
        // send info to database: send a post request using the values we obtained from the survey
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        searchedEvents = events.filter({( event: Events) -> Bool in
            return event.name.lowercased().contains(searchText.lowercased())
        })
        
        detailtableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventTableViewCell
        let event: Events
        if isFiltering() {
            event = searchedEvents[indexPath.row]
        } else {
            event = events[indexPath.row]
        }
        cell.configure(for: event)
//        let event = events[indexPath.row]
//        cell.eventNameLabel.text = event.name
//        cell.infoLabel.text = "\(event.date) • \(event.time) • \(event.tags)"
//        cell.infoLabel2.text = "\(event.organizerName) • \(event.organizerContact)"
//        cell.infoLabel3.text = "\(event.description)"
        cell.backgroundColor = textFieldColor
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return searchedEvents.count
        }
        
        return events.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func getEvents(){
        NetworkManager.getEvents { events in
            self.events = events
            DispatchQueue.main.async {
                self.detailtableView.reloadData()
            }
            
        }
    }
}

////extension ViewController: UISearchResultsUpdating {
////    // MARK: - UISearchResultsUpdating Delegate
////    func updateSearchResults(for searchController: UISearchController) {
////        filterContentForSearchText(searchController.searchBar.text!)
////    }
//}



