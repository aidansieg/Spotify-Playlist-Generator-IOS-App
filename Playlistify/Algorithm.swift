import UIKit

// Array A of arrays B each containing 1 or more criteria elements (and nil values for any empty criteria elements) and 1 importance weight.
let constraints: [String?]
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

var plistSize: Int // User specifies number of songs plistSize to be recommended in the result playlist.
var playlist: [Song]
var importanceRemaining = 1.0
var onlyImp = true
var nilImpCount = 0

// User adds a constraint.
var constr: [String?]
if let genre = constr[0]
{
    onlyImp = false
    if !Spotify.getGenres.contains(genre)
    {
        // ERROR: Genre doesn't exist.
    }
}
if let startYr = constr[1]
{
    onlyImp = false
    if Int(startYr) > Date.getYear
    {
        // ERROR: Start year is later than current year.
    }
    if let endYr = constr[2]
    {
        if Int(endYr) < startYr
        {
            // ERROR: End year is earlier than start year.
        }
    }
    else
    {
        constr[2] = startYr
    }
}
if let importance = constr[3]
{
    if onlyImp
    {
        // ERROR: Importance specified with no accompanying criteria.
    }
    else if Double(importance) > importanceRemaining
    {
        // ERROR: Total importance exceeds 100%.
    }
    else
    {
        importanceRemaining -= Double(importance)
    }
}
else
{
    nilImpCount += 1
}

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
                for song in 1...plistSize*i
                {
                    playlist.append(SpotifyAPI.getSong(genre = g, startYr = s, endYr = e))
                }
            }
            else
            {
                // Importance is nil.
                for song in 1...plistSize*(importanceRemaining / nilImpCount)
                {
                    playlist.append(SpotifyAPI.getSong(genre = g, startYr = s, endYr = e))
                }
            }
        }
        else
        {
            // Start year and end year are nil.
            if let i = constraint[3]
            {
                // Importance is non-nil.
                for song in 1...plistSize*i
                {
                    playlist.append(SpotifyAPI.getSong(genre = g))
                }
            }
            else
            {
                // Importance is nil.
                for song in 1...plistSize*(importanceRemaining / nilImpCount)
                {
                    playlist.append(SpotifyAPI.getSong(genre = g))
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
                for song in 1...plistSize*i
                {
                    playlist.append(SpotifyAPI.getSong(startYr = s, endYr = e))
                }
            }
            else
            {
                // Importance is nil.
                for song in 1...plistSize*(importanceRemaining / nilImpCount)
                {
                    playlist.append(SpotifyAPI.getSong(startYr = s, endYr = e))
                }
            }
        }
    }
}
