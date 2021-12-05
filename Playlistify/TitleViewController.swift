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
        if let title = playlistTitle.text {
            // Title length check
            if self.validateTitle(title) {
                self.performSegue(withIdentifier: "title-page-to-genre-page", sender: nil)
            } else {
                self.presentAlertController(title: "Invalid Playlist Title",
                                            message: "Playlist title must be between 5 and 20 characters.",
                                            buttonTitle: "OK")
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
    
    //********************************************* Helper functions *********************************************//
    
    // Used to make sure playlist title is a valid length
    func validateTitle(_ title: String) -> Bool {
        if (title.count >= 2 && title.count <= 20) {
            return true
        } else {
            return false
        }
    }
    
    func presentAlertController(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action     = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true)
        }
    }
}
