/*
 *   View controller for the create a playlist page in which the generated playlist is displayed. The playlist page allows
 *   users to review their generated playlist and determine whether or not they would like to save it.
 */
import UIKit

class PlaylistViewController: UITableViewController {
    // Outlets
    @IBOutlet var playlistTitleLabel: UILabel!
    //@IBOutlet var playlistGenreLabel: UILabel!
    //@IBOutlet var playlistTitleLabel: UILabel!
    //@IBOutlet var playlistYearsLabel: UILabel!
    
    // Data passed from previous view controllers
    var   createdPlaylist: [[String:String]]!
    var    playlistGenres: [String]!
    var     playlistTitle: String!
    var playlistStartYear: String!
    var   playlistEndYear: String!
    var    selectedGenres: [String]!
    
    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Labels
        playlistTitleLabel.text = self.playlistTitle
        //playlistGenreLabel.text = "\(selectedGenres!)"
        //playlistYearsLabel.text = "\(playlistStartYear!)-\(playlistEndYear!)"
    }
    
    // Segues from the create a playlist playlist page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "playlist-page-to-main-menu":
            // ADD STUFF HERE
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
        return self.createdPlaylist.count
    }
       
    // Define how to display rows graphically
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new cell or use an old one that is not in use anymore
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell",
                                                for: indexPath) as! PlaylistCell
           
        // Set text in the cell to correspond with data at the nth index of items, where
        // n = row the cell will appear in on the table view
        let song = self.createdPlaylist[indexPath.row]
           
        // Cell components to display
        cell.songNameLabel.text   = song["name"]
        cell.songArtistLabel.text = song["artist"]
           
        return cell
    }
}
