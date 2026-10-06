//
//  ContentView.swift
//  BSMacOS
//
//  Created by jack on 07/07/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
           SidebarView()
        } detail: {
            ContentUnavailableView("Welcome To BSMacOS", systemImage: "doc.text.image.fill")
        }
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink{
                DownloadView()
            }label: {
                Label("Download Versions", systemImage: "tray.and.arrow.down")
            }
            
            NavigationLink{
                Text("shared")
            } label: {
                Label("Shared Content", systemImage: "square.and.arrow.up.circle")
            }
            
            Divider()
            
            NavigationLink{
                GameView()
            } label: {
                Label("1.40.8", systemImage: "gamecontroller")
            }
            
            NavigationLink{
                ProgressView()
                Text("Game is Installing")
            } label: {
                Label("1.40.8", systemImage: "arrow.down.circle.dotted")
            }
        }
        .navigationTitle("Sidebar")
    }
}

struct DownloadView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())]){
            DownloadVersionView(imagePath: "urp", versionID: "1.44.2", releaseDate: "00/00/0000" )
            DownloadVersionView(imagePath: "urp", versionID: "1.44.2", releaseDate: "00/00/0000" )
            DownloadVersionView(imagePath: "urp", versionID: "1.44.2", releaseDate: "00/00/0000" )
            DownloadVersionView(imagePath: "urp", versionID: "1.44.2", releaseDate: "00/00/0000" )
            DownloadVersionView(imagePath: "urp", versionID: "1.44.2", releaseDate: "00/00/0000" )
            DownloadVersionView(imagePath: "urp", versionID: "1.44.2", releaseDate: "00/00/0000" )

        }

    }}

struct DownloadVersionView : View {
    let imagePath: String
    let versionID: String
    let releaseDate: String
    var body: some View {
        GroupBox{
            VStack(alignment: .leading, spacing: 5){
                Image(imagePath).resizable()  .aspectRatio(contentMode: .fit)
                    .frame(width: 180).cornerRadius(8)
                HStack{
                    VStack(alignment: .leading){
                        Text(versionID).font(.title2)
                        Text("Released \(releaseDate)").font(.caption)
                    }
                }
                HStack{
                    Button(action: { },
                           label: { Text("Install").font(.caption) }
                    ).buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 8))
                        .tint(.blue)
                    ProgressView(value: 0).frame(maxWidth: 120)
                }
            }.padding(.vertical, 4)
        }
    }
}


struct GameView : View {
    @State private var FPFC = true
    @State private var Debug = true
    @State private var DebugSrv = true
    @State private var LaunchArgs = ""
    var body: some View {
        VStack{
            Text("1.40.8").font(.largeTitle)
            HStack{
                Toggle(isOn: $FPFC) {
                        Text("FPFC")
                }.toggleStyle(.button)
                Toggle(isOn: $Debug) {
                        Text("Debug Mode")
                }.toggleStyle(.button)
                Toggle(isOn: $DebugSrv) {
                        Text("Enable Debug Server")
                }.toggleStyle(.button)
            }
            TextField(text: $LaunchArgs, prompt: Text("Custom Launch Arguments")) {}.frame(maxWidth: 300)
            Spacer()
            Button(action: { },
                   label: {
                Label("Launch Game", systemImage: "play")
                
            }
            ).buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .tint(.blue)
            Spacer()
            
        }}
}
#Preview {
    ContentView()
}
