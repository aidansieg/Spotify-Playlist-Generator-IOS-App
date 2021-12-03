/*
 *   View controller for the create a playlist page in which the generated playlist is displayed. The playlist page allows
 *   users to review their generated playlist and determine whether or not they would like to save it.
 */
import UIKit

class PlaylistViewController: UIViewController {
    // Outlets
    @IBOutlet var playlistGenreLabel: UILabel!
    @IBOutlet var playlistTitleLabel: UILabel!
    @IBOutlet var playlistYearsLabel: UILabel!
    
    // Data passed from previous view controllers
    //var    playlistGenres: [String]!
    var     playlistTitle: String?
    var playlistStartYear: String?
    var   playlistEndYear: String?
    
    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Labels
        playlistTitleLabel.text = playlistTitle ?? ""
        //playlistGenreLabel.text = "\(playlistGenres[0])"
        playlistYearsLabel.text = "\(playlistStartYear ?? "")-\(playlistEndYear ?? "")"
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
    
}
