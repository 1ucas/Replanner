//
//  PanelView.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import SwiftUI

enum AppFeature: String, CaseIterable {
    case kanban = "🗓️ Kanban"
    case dashboard = "📊 Big Numbers"
}

enum AppAreas {
    case settings
}

struct PanelView: View {
    
    @EnvironmentObject var reminderStore: ReminderStore

    var body: some View {
        NavigationSplitView {
            sideView
                .toolbar {
                    Button("Refresh") {
                        Task {
                            await reminderStore.readAll()
                        }
                    }
                }
                .navigationSplitViewColumnWidth(200.0)
                .onAppear {
                    Task {
                        await reminderStore.requestAccess()
                        await reminderStore.readAll()
                    }
                }
        } detail: {
            Text("Select a Feature")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var sideView: some View {
        VStack(alignment: .center) {
            connectionStateView
            featuresView
                .disabled(reminderStore.state.permissionStatus != .connected)
            Spacer()
            if reminderStore.state.permissionStatus == .connected {
                settingsView
            } else {
                Button("Authorize") {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
                .padding()
            }
        }
        .padding(.top)
    }
    
    private var connectionStateView: some View {
        HStack {
            Label(reminderStore.state.permissionStatus.description, systemImage: "circle.fill")
                .foregroundColor(reminderStore.state.permissionStatus.color)
                .padding(.leading)
            Spacer()
        }
    }
    
    private var featuresView: some View {
        List(AppFeature.allCases, id: \.rawValue) { feature in
            NavigationLink(value: feature) {
                Text(feature.rawValue.capitalized)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.vertical, 4)
            }
        }
        .padding(.top)
        .scrollContentBackground(.hidden)
        .listStyle(.sidebar)
        .navigationDestination(for: AppFeature.self) { feature in
            switch feature {
            case .kanban:
                KanbanView(kanban: Kanban(projects: reminderStore.state.projects))
                    .navigationTitle(feature.rawValue)
                    .navigationBarTitleDisplayMode(.inline)
            case .dashboard:
                DashboardView(dashboard: Dashboard(projects: reminderStore.state.projects))
                    .navigationTitle(feature.rawValue)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private var settingsView: some View {
        NavigationLink(value: AppAreas.settings) {
            Label("Settings", systemImage: "gear")
        }
        .padding()
        .navigationDestination(for: AppAreas.self) { area in
            switch area {
            case .settings:
                SettingsView()
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PanelView_Previews: PreviewProvider {
    
    static var reminderStore: ReminderStore {
        ServiceLocator.toggleMock = true
        return ReminderStore()
    }
    
    static var previews: some View {
        PanelView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(reminderStore)
    }
}
