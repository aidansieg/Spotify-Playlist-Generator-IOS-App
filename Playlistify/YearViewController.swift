/*
 *   View controller for the create a playlist page in which the playlist start year and end year is entered. The year page allows
 *   users to select a range of years they would like to include songs from in their generated playlist.
 */
import UIKit

class YearViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Segues from the create a playlist year page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "year-page-to-playlist-page":
            // ADD STUFF TO PASS HERE
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
    
}
