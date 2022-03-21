//
//  PreviewHelpers.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/14/22.
//

import Foundation

struct PreviewHelpers {
    static let mockRecordingsVMs = [
        RecordingCellVM
            .init(id: UUID(),
                  name: "Infopark Entrance",
                  recordingTime: "11:29 AM",
                  duration: "00:16"),
        RecordingCellVM
            .init(id: UUID(),
                  name: "Cochin Metro",
                  recordingTime: "Friday",
                  duration: "00:24")
    ]
}
