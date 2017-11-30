

import Foundation
import UIKit

class FavouritesList{

    static let sharedFavouritesList =  FavouritesList()
    private(set) var favourites:[String]
    
    // constructor
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
        
    }
    
    //This method adds font to the user preferences files
    func addFavourite(fontName: String) {
        if !favourites.contains(fontName){
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    //this method saves font favourites to the user prefernce files
    func saveFavourites() {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    //this method removes a favourites from the user prefernce files
    func removeFavourites(fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
}
