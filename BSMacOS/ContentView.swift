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
                    Text("Destination 1")
                } label: {
                    Label("1.40.8", systemImage: "gamecontroller")
                }
                
                NavigationLink{
                    Text("Destination 1")
                } label: {
                    Label("1.40.8", systemImage: "arrow.down.circle.dotted")
                }
            }
            .navigationTitle("Sidebar")
        } detail: {
            ContentUnavailableView("Select an element from the sidebar", systemImage: "doc.text.image.fill")
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            SidebarView()
//            DownloadView()
//        }
//    }
//}

struct SidebarView: View {
    var body: some View {
            List{
                Label("Download Versions", systemImage: "tray.and.arrow.down")
                Label("Shared Content", systemImage: "square.and.arrow.up.circle")
                Divider()
                Label("1.40.8", systemImage: "gamecontroller")
                Label("1.40.8", systemImage: "arrow.down.circle.dotted")
            }
            .frame(minWidth: 200)
    }
}

struct DownloadView: View {
    var body: some View {
        List{
            VersionView()
        }

    }}

struct VersionView : View {
    var body: some View {
        GroupBox{
            VStack(alignment: .leading, spacing: 5){
                Image("urp").resizable()  .aspectRatio(contentMode: .fit)
                    .frame(width: 120).cornerRadius(8)
                HStack{
                    VStack(alignment: .leading){
                        Text("1.44.2").font(.title2)
                    }
                    Button("Install"){} .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 8))
                        .tint(.blue)
                    
                }
                ProgressView(value: 0).frame(maxWidth: 120)
            }.padding(.vertical, 4)
        }
    }
}

#Preview {
    ContentView()
}
