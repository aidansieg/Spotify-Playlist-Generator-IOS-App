/*
 *   View controller for the create a playlist page in which the playlist title is entered. The title page allows
 *   users to select a name they would like to have for their newly generated playlist.
 */
import UIKit

class TitleViewController: UIViewController {
    // Outlets
    @IBOutlet var playlistTitle: UITextField!
    
    // View actions
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    // Segues from the create a playlist title page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "title-page-to-genre-page":
            let genreViewController = segue.destination as! GenreViewController
            genreViewController.playlistTitle = playlistTitle.text
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
}
