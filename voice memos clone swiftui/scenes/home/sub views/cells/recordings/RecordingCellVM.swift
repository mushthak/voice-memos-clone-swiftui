//
//  RecordingCellVM.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/14/22.
//

import Foundation

struct RecordingCellVM: Identifiable {
    var id: UUID
    let name:String
    let recordingTime: String
    let duration:String
}
