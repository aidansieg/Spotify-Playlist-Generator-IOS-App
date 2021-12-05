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
    
    // TESTING STUFF
    var allowMultipleSelection: Bool = true
    var songs = loadSongs(from: "Songs")
    var selectedGenres: [String] = []
    
    
    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display genres
        for song in songs {
            if(!self.playlistGenres.contains(song.genre)) {
                self.playlistGenres.append(song.genre)
            }
        }
        // Additional behavior
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    // Continue button
    @IBAction func continueToNextPage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "genre-page-to-year-page", sender: nil)
    }
    
    // Reload table view content when view updated
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
            yearViewController.selectedGenres = selectedGenres
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
    
    //***************************************** Table View Configuration *****************************************//

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
 
    // Define actions to take on selected rows
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        // Highlight selected cell
        cell.contentView.backgroundColor = UIColor.darkGray
        self.selectedGenres.append(self.playlistGenres[indexPath.row])
    }
}
