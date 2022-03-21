//
//  HomeScreen.swift
//  voice memos clone swiftui
//
//  Created by Mushthak Ibrahim on 3/20/22.
//

import SwiftUI

struct HomeScreen: View {
    var recordings:[RecordingCellVM] = []

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {

                //Recording Lists
                List(recordings) {
                    RecordingCellView(recording: $0)
                }.listStyle(PlainListStyle())

                //Bottom Controller
                BottomRecordingView()

            }
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationTitle("All Recordings")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let mockRecordings = PreviewHelpers.mockRecordingsVMs
        HomeScreen(recordings: mockRecordings)
    }
}

extension HomeScreen {

    struct BottomRecordingView: View {

        @State private var showingSheet = false

        var body: some View {
            ZStack(alignment: .top) {

                //TODO: Calculate width & height from geometric reader
                //TODO: Add namespace to animate to SheetView

                //Background
                AppTheme.bottomSheetBackground.frame(width: UIScreen.main.bounds.width, height:130)

                //Record Controller
                RecordButtonView(clickHandler: {
                    showingSheet.toggle()
                }).padding(.top)


                    //Bottom Sheet
                    .bottomSheet(isPresented: $showingSheet) {
                        RecordingExpandedView(onClose: {
                            showingSheet.toggle()
                        })
                            .interactiveDismissDisabled(true)
                    } onClose: {
                        showingSheet.toggle()
                    }

            }
        }
    }

}
