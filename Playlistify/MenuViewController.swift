/*
 *   View controller for the main menu. The main menu allows users to select what action they
 *   would like to perform/where they would like to navigate.
 */
import UIKit

class MenuViewController: UIViewController {

    // View actions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Segues from main menu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "main-menu-to-login":
            // ADD STUFF TO PASS HERE
            break
        case "main-menu-to-title-page":
            // ADD STUFF TO PASS HERE
            break
        default:
            preconditionFailure("Unexpected segue identifier")
            break
        }
    }
}
