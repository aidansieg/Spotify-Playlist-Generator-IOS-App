/*
 *   View controller for the login menu. The connection to Spotify is established when the login
 *   button is pressed and is used throughout the app.
 */
import UIKit

class LoginViewController: UIViewController, SPTSessionManagerDelegate, SPTAppRemoteDelegate  {
    
    //*************************************** Login Screen Display/Actions ***************************************//
    
    // When login view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Login button
    @IBAction func login(_ sender: UIButton) {
        // Set scopes here to specify what types of data the application can access. The
        // user will have to grant permission for the scopes when running the app.
        // Scopes documentation: https://developer.spotify.com/web-api/using-scopes/.
        let scope: SPTScope = [.appRemoteControl, .playlistReadPrivate]
        
        if #available(iOS 11, *) {
            // Use this on iOS 11 and above to take advantage of SFAuthenticationSession
            sessionManager.initiateSession(with: scope, options: .clientOnly)
        } else {
            // Use this on iOS versions < 11 to use SFSafariViewController
            sessionManager.initiateSession(with: scope, options: .clientOnly, presenting: self)
        }
        
        // Navigate to the main menu only if the user was successfully able to log in to Spotify
        if (appRemote.isConnected || simulatorDisplayMode == true) {
            self.performSegue(withIdentifier: "login-to-main-menu", sender: nil)
        }
    }
    
    // Segue to main menu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //****************************************** Spotify configuration *******************************************//
    
    // Spotify authorization
    private let SpotifyClientID    = "ClientID"
    private let SpotifyRedirectURI = URL(string: "spotify-ios-quick-start://spotify-login-callback")!

    // Spotify configuration for connection
    lazy var configuration: SPTConfiguration = {
        let configuration = SPTConfiguration(clientID: SpotifyClientID, redirectURL: SpotifyRedirectURI)
        // URI specifies song that Spotify will play after authenticating (if player is enabled) and is required for
        // connecting to Spotify. If URI is empty, Spotify will resume playback of last song or play a random song.
        configuration.playURI = ""

        // URLs containing the secret to exchange for an access token
        configuration.tokenSwapURL    = URL(string: "http://localhost:1234/swap")
        configuration.tokenRefreshURL = URL(string: "http://localhost:1234/refresh")
        return configuration
    }()
    
    // Spotify session manager
    lazy var sessionManager: SPTSessionManager = {
        let manager = SPTSessionManager(configuration: configuration, delegate: self)
        return manager
    }()
    
    // Spotify app remote connection
    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.delegate = self
        return appRemote
    }()
    
    
    //********************************************* Spotify Actions **********************************************//
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        presentAlertController(title: "Authorization Failed", message: error.localizedDescription, buttonTitle: "Bummer")
    }

    func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {
        presentAlertController(title: "Session Renewed", message: session.description, buttonTitle: "Sweet")
    }

    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        appRemote.connectionParameters.accessToken = session.accessToken
        appRemote.connect()
    }

    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        
    }

    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        
    }

    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        
    }

    
    //********************************************* Helper functions *********************************************//
    
    private func presentAlertController(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action     = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
            
            controller.addAction(action)
            self.present(controller, animated: true)
        }
    }
}
