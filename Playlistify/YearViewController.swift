/*
 *   View controller for the create a playlist page in which the playlist start year and end year is entered. The year page allows
 *   users to select a range of years they would like to include songs from in their generated playlist.
 */
import UIKit

class YearViewController: UIViewController {
    // Outlets
    @IBOutlet var playlistStartYear: UITextField!
    @IBOutlet var   playlistEndYear: UITextField!
    
    // Data passed from previous view controllers
    var playlistGenres: [String]!
    var  playlistTitle: String!

    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Create-playlist button
    @IBAction func createPlaylist(_ sender: UIButton) {
        if let startYear = playlistStartYear.text, let endYear = playlistEndYear.text {
            // Title length check
            if self.validateYears(startYear, endYear) {
                self.performSegue(withIdentifier: "year-page-to-loading-page", sender: nil)
            } else {
                self.presentAlertController(title: "Invalid Playlist Year Range",
                                            message: "Playlist year range should be between 1920-2021 and be valid years.",
                                            buttonTitle: "OK")
            }
        }
    }
    
    // Segues from the create a playlist year page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "year-page-to-loading-page":
            let loadingViewController = segue.destination as! LoadingViewController
            loadingViewController.playlistGenres    = playlistGenres
            loadingViewController.playlistTitle     = playlistTitle
            loadingViewController.playlistStartYear = playlistStartYear.text
            loadingViewController.playlistEndYear   = playlistEndYear.text
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
    
    //********************************************* Helper functions *********************************************//
    
    // Used to make sure playlist year is valid
    func validateYears(_ startYear: String, _ endYear: String) -> Bool {
        if (Int(startYear) == nil || Int(endYear) == nil) {
            return false
        } else if (Int(endYear)! < Int(startYear)!) {
            return false
        } else if (Int(startYear)! < 1920 || Int(startYear)! > 2021) || Int(endYear)! < 1920 || Int(endYear)! > 2021 {
            return false
        } else {
            return true
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
