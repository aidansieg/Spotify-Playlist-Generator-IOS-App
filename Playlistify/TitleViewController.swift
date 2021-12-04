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
    
    // Continue button
    @IBAction func continueToNextPage(_ sender: UIButton) {
        if let test = playlistTitle.text {
            if test.count >= 5 && test.count <= 20 {
                self.performSegue(withIdentifier: "title-page-to-genre-page", sender: nil)
            } else {
                // PLAYLIST TITLE ALERT STYLE CAN BE EDITED HERE
                DispatchQueue.main.async {
                    let controller = UIAlertController(title: "Invalid Playlist Title", message: "Playlist title must be between 5 and 20 characters.",
                                                       preferredStyle: .alert)
                    let action     = UIAlertAction(title: "OK", style: .default, handler: nil)
                    
                    controller.addAction(action)
                    self.present(controller, animated: true)
                }
            }
        }
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
