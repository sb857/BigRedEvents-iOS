//
//  MainTabBarController.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/5/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit
import MapKit

class MainTabBarController: UITabBarController  {
    
    var tableViewPlaces : UITableView!
    var explore : UIButton!
    var map: UIButton!
    var favorites: UIButton!
    
    var homeV : ViewController!
    //var favoriteV : FavoritesViewController!
    //var mapV : MapViewController!
    
    var placesArray: [Place]! = []
    
    let padding : CGFloat = 10
    
    /**override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.getPlaces { (places) in
            self.placesArray = places
            
            self.homeV.loadPlaces(pl: self.placesArray)
            self.mapV.mapPlaces(self.placesArray)
            self.favoriteV.loadPlaces(pl: self.placesArray)
        }
        tabBar.barTintColor = UIColor(red:0.82, green:0.42, blue:0.42, alpha:1.0)
        tabBar.shadowImage = UIImage()
        
        setUpTabBar()
    }
    
    func setUpTabBar() {
        
        homeV = ViewController()
        //favoriteV = FavoritesViewController(places: placesArray)
        mapV = MapViewController(places: placesArray)
        
        let homeController = createNavContoller(vc: homeV, selectedImage: UIImage(named: "blackhouse")!, unselectedImage: UIImage(named: "whitehouse")!)
        let mapController = createNavContoller(vc: mapV, selectedImage: UIImage(named: "blackplaceholder"), unselectedImage: UIImage(named: "whiteplaceholder"))
        let favoriteController = createNavContoller(vc: favoriteV, selectedImage: UIImage(named: "blackheart"), unselectedImage: UIImage(named: "whiteheart"))
        
        viewControllers = [homeController, mapController, favoriteController]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        }
        
    }
    
    public func updateTime() {
        self.placesArray = []
        NetworkManager.getPlaces { (places) in
            self.placesArray = places
            
            self.homeV.loadPlaces(lib: self.placesArray)
            self.mapV.mapPlaces(self.placesArray)
            self.favoriteV.loadPlaces(pl: self.placesArray)
        }
    }
}

extension UITabBarController {
    func createNavContoller(vc : UIViewController, selectedImage: UIImage, unselectedImage: UIImage) -> UINavigationController {
        let viewContoller = vc
        let navController = UINavigationController(rootViewController: viewContoller)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        return navController
    }
}*/
}
