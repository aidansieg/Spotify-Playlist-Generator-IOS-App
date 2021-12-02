/*
 *   View controller for the create a playlist page in which the generated playlist is displayed. The playlist page allows
 *   users to review their generated playlist and determine whether or not they would like to save it.
 */
import UIKit

class PlaylistViewController: UIViewController {
    var playlistTitle: String?
    @IBOutlet var playlistTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTitleLabel.text = playlistTitle
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
