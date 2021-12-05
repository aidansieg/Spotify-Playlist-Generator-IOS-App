

//func createPlaylist(genres[], playlistStartYear, playlistEndYear) -> [] {
//    var playlist = []
//
//    var songs = loadSongs(from: "Songs")
//
//     for song in songs {
//         if((song.year >= Int(playlistStartYear)) && (song.year <= Int(playlistEndYear))) {
//             // another if statement for genres
//             playlist.append(song)
//         }
//     }
//
//    return playlist
// }
//




/*
import UIKit

func algorithm()
{
    // Array A of arrays B each containing 1 or more criteria elements (and nil values for any empty criteria elements) and 1 importance weight.
    var constraints: [[String?]] = [] // Starting out empty list of constraints.
    // Format: {{"Genre/Subgenre", "Start Year", "End Year", "Importance"}, ...}
    // For example: constraints == {{"EDM", "2012", "2013", "0.60"}, {"Hip-Hop", "2011", "2014", "0.15"}, {"Progressive House", "2012", "2012", nil}, {"Swedish House Mafia", nil, nil, nil}, {"Nothing Was The Same", nil, nil, nil}, {"Under Control", nil, nil, nil}}
    // All permutations of possible user selections:
    // {"Genre/Subgenre/Artist/Album/Song", "Start Year", "End Year", "Importance"}
    // {"Genre/Subgenre/Artist/Album/Song", "Start Year", "End Year", nil}
    // {"Genre/Subgenre/Artist/Album/Song", nil, nil, "Importance"}
    // {nil, "Start Year", "End Year", "Importance"}
    // {"Genre/Subgenre/Artist/Album/Song", nil, nil, nil}
    // {nil, "Start Year", "End Year", nil}
    // If there are any constraints with nil values for "Importance," the playlist takes 1.00 minus the cumulative importance so far, and splits it evenly among those constraints.

    var plistSize: Int = 50 // User specifies number of songs plistSize to be recommended in the result playlist. Default 50 until user input is implemented.
    var playlist: [SPTAppRemoteTrack] // Initial empty playlist to add songs to.
    var importanceRemaining = 1.0 // How much 'importance' weight remains to be allocated (starts at 1.0).
    var onlyImp = true // If the user only specifies importance but no other criteria, there is a problem. Starts at 'true' but becomes false unless the algorithm doesn't detect another criterion.
    var nilImpCount = 0 // Keep track of the number of constraints with nil importance values, so later on, the remaining importance weight can be equally allocated among them.

    // User adds a constraint.
    var constr: [String?] = [nil, nil, nil, nil] // User input constraint (default nil criteria).
    if let genre = constr[0] // User input a genre.
    {
        onlyImp = false
        // TODO: Possibly Handle Genre Not Existing
    }
    if let startYr = constr[1] // User input a start year.
    {
        onlyImp = false
        let date = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy"
        let year = Int(dateFormat.string(from: date))
        if Int(startYr) ?? ((year ?? 2021) + 1) > (year ?? 2021)
        {
            // ERROR: Start year is later than current year.
        }
        if let endYr = constr[2] // User input an end year.
        {
            if (Int(endYr) ?? ((year ?? 2021) + 1)) < (Int(startYr) ?? (year ?? 2021))
            {
                // ERROR: End year is earlier than start year.
            }
        }
        else
        {
            constr[2] = startYr // Set end year equal to start year if user didn't input.
        }
    }
    if let importance = constr[3] // User input importance.
    {
        if onlyImp
        {
            // ERROR: Importance specified with no accompanying criteria.
        }
        else if (Double(importance) ?? 1.0) > importanceRemaining
        {
            // ERROR: Total importance exceeds 100%.
        }
        else
        {
            importanceRemaining -= (Double(importance) ?? 0.0) // Subtract from remaining importance weight to be allocated.
        }
    }
    else
    {
        nilImpCount += 1 // Increase the count of constraints with nil importance.
    }
    constraints.append(constr)

    // System generates the playlist.
    for constraint in constraints
    {
        if let g = constraint[0]
        {
            // Genre is non-nil.
            if let s = constraint[1]
            {
                // Start year and end year are non-nil.
                if let i = constraint[3]
                {
                    // Importance is non-nil.
                    for song in 1...plistSize*Int(Double(i) ?? 0.02)
                    {
                        // playlist.append(/* song from Spotify that matches genre g, start year s, and end year e */)
                    }
                }
                else
                {
                    // Importance is nil.
                    for song in 1...plistSize*Int(importanceRemaining / Double(nilImpCount))
                    {
                        // playlist.append(/* song from Spotify that matches genre g, start year s, and end year e */)
                    }
                }
            }
            else
            {
                // Start year and end year are nil.
                if let i = constraint[3]
                {
                    // Importance is non-nil.
                    for song in 1...plistSize*Int(Double(i) ?? 0.02)
                    {
                        // playlist.append(/* song from Spotify that matches genre g */)
                    }
                }
                else
                {
                    // Importance is nil.
                    for song in 1...plistSize*Int(importanceRemaining / Double(nilImpCount))
                    {
                        // playlist.append(/* song from Spotify that matches genre g */)
                    }
                }
            }
        }
        else
        {
            // Genre is nil.
            if let s = constraint[1]
            {
                // Start year and end year are non-nil.
                if let i = constraint[3]
                {
                    // Importance is non-nil.
                    for song in 1...plistSize*Int(Double(i) ?? 0.02)
                    {
                        // playlist.append(/* song from Spotify that matches start year s and end year e */)
                    }
                }
                else
                {
                    // Importance is nil.
                    for song in 1...plistSize*Int(importanceRemaining / Double(nilImpCount))
                    {
                        // playlist.append(/* song from Spotify that matches start year s and end year e */)
                    }
                }
            }
        }
    }
}
*/
