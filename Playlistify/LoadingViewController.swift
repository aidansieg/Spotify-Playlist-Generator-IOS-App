/*
 *   View controller for the playlist creation loading screen. The playlist is generated in the background
 *   while the loading screen is displayed and then passed to the final display screen when it is done.
 */
import UIKit

class LoadingViewController: UIViewController {
    // Outlets
    // ADD ANY OUTLETS HERE
    
    // Data passed from previous view controllers
    var    playlistGenres: [String]!
    var     playlistTitle: String!
    var playlistStartYear: String!
    var   playlistEndYear: String!
    var    selectedGenres: [String]!
    
    // Playlist to be created
    var createdPlaylist: [[String:String]] = []
    
    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.createPlaylist()
        }
    }
    
    // Segues from the create a playlist title page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "loading-page-to-playlist-page":
            let playlistViewController = segue.destination as! PlaylistViewController
            playlistViewController.createdPlaylist   = createdPlaylist
            playlistViewController.playlistGenres    = playlistGenres
            playlistViewController.playlistTitle     = playlistTitle
            playlistViewController.playlistStartYear = playlistStartYear
            playlistViewController.playlistEndYear   = playlistEndYear
            playlistViewController.selectedGenres    = selectedGenres
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
    
    //********************************************* Helper functions *********************************************//

    // If Spotify API were working, this would be where the playlist-generating algorithm would
    // be called and passed to the final display screen.
    func createPlaylist() {
        // Simulate playlist creation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.createdPlaylist = generatePlaylist(self.playlistStartYear, self.playlistEndYear, self.selectedGenres)
            self.performSegue(withIdentifier: "loading-page-to-playlist-page", sender: nil)
        }
    }
}
