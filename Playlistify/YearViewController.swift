/*
 *   View controller for the create a playlist page in which the playlist start year and end year is entered. The year page allows
 *   users to select a range of years they would like to include songs from in their generated playlist.
 */
import UIKit

class YearViewController: UIViewController {
    @IBOutlet var playlistStartYear: UITextField!
    @IBOutlet var   playlistEndYear: UITextField!
    
    var playlistTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Segues from the create a playlist year page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "year-page-to-playlist-page":
            let playlistViewController = segue.destination as! PlaylistViewController
            playlistViewController.playlistTitle     = playlistTitle
            playlistViewController.playlistStartYear = playlistStartYear.text ?? ""
            playlistViewController.playlistEndYear   =   playlistEndYear.text ?? ""
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
    
}
