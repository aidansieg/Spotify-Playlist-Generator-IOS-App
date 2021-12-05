//
//  SongData.swift
//  Playlistify
//
//  Created by Aidan Siegel on 12/5/21.
//

import Foundation

struct Song: Identifiable {
    var title: String = ""
    var artist: String = ""
    var genre: String = ""
    var year: String = ""
    var id = UUID()
    
    init(raw: [String]) {
        title = raw[0]
        artist = raw[1]
        genre = raw[2]
        year = raw[3]
    }
}

func loadSongs(from csvName: String) -> [Song] {
    var csvToStruct = [Song]()
    
    // locate cvs file
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    // convert file contents into one array
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    // split big array into small arrays for each row
    var rows = data.components(separatedBy: "\n")
    
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    for row in rows {
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == columnCount {
            let songStruct = Song.init(raw: csvColumns)
            csvToStruct.append(songStruct)
        }
    }
    
    return csvToStruct
}
