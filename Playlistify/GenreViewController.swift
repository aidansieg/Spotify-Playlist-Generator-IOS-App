/*
 *   View controller for the create a playlist page in which the playlist genres are entered. The genre page allows
 *   users to select genres they would like to use for generating their playlist.
 */
import UIKit

class GenreViewController: UITableViewController {
    // Outlets
    // ADD HERE
    
    // Data passed from previous view controllers
    var playlistGenres: [String] = []
    var  playlistTitle: String!
    
    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 65
        
        // HARD-CODED GENRES FOR TESTING
        self.playlistGenres.append("EDM")
        self.playlistGenres.append("Hip-Hop")
        self.playlistGenres.append("Pop")
    }
    
      // Define how many rows to display graphically
       override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection section: Int) -> Int {
           return self.playlistGenres.count
       }
       
       // Define how to display rows graphically
       override func tableView(_ tableView: UITableView,
                               cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           // Get a new cell or use an old one that is not in use anymore
           let cell = tableView.dequeueReusableCell(withIdentifier: "GenreCell",
                                                    for: indexPath) as! GenreCell
           
           // Set text in the cell to correspond with data at the nth index of items, where
           // n = row the cell will appear in on the table view
           let genre = self.playlistGenres[indexPath.row]
           
           // Cell components to display
           cell.genreLabel.text = genre
           
           return cell
       }
       
        /*
       // Define how to move rows graphically
       override func tableView(_ tableView: UITableView,
                               moveRowAt sourceIndexPath: IndexPath,
                               to destinationIndexPath: IndexPath) {
           itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
       }
       
       // Define how to delete rows graphically
       override func tableView(_ tableView: UITableView,
                               commit editingStyle: UITableViewCell.EditingStyle,
                               forRowAt indexPath: IndexPath) {
           // Delete confirmation popup
           let alertController = UIAlertController(title: nil, message: "Are you sure you want to delete this game?", preferredStyle: .alert)
           alertController.modalPresentationStyle = .popover
           
           // Yes button in delete popup
           let yesAction = UIAlertAction(title: "Yes", style: .default)
           {
               _ in
               let item = self.itemStore.allItems[indexPath.row]
               
               // Remove item from the store...
               self.itemStore.removeItem(item)
               
               // Remove the item's image from the image store
               self.imageStore.deleteImage(forKey: item.itemKey)
               
               // ...and delete the row from the screen
               tableView.deleteRows(at: [indexPath], with: .automatic)
           }
           alertController.addAction(yesAction)
           
           // No button in delete popup
           let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
           alertController.addAction(noAction)
           
           // Display pop up when delete clicked
           present(alertController, animated: true, completion: nil)
       }*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Segues from the create a playlist genre page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "genre-page-to-year-page":
            let yearViewController = segue.destination as! YearViewController
            yearViewController.playlistGenres = playlistGenres
            yearViewController.playlistTitle  = playlistTitle
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
}
