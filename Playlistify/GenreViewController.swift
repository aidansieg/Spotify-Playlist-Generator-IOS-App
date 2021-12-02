/*
 *   View controller for the create a playlist page in which the playlist genres are entered. The genre page allows
 *   users to select genres they would like to use for generating their playlist.
 */
import UIKit

class GenreViewController: UITableViewController {
    var playlistTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Segues from the create a playlist genre page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "genre-page-to-year-page":
            let yearViewController = segue.destination as! YearViewController
            yearViewController.playlistTitle = playlistTitle
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
    
}
