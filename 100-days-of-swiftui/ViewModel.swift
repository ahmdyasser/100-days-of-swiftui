//
//  ViewModel.swift
//  100-days-of-swiftui
//
//  Created by Ahmad Yasser on 28/03/2023.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var buttonIsHidden = false
    func configureRemoteConfig() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "remote_config_defaults")

        buttonIsHidden = remoteConfig.configValue(forKey: "buttonIsEnabled").boolValue
        remoteConfig.addOnConfigUpdateListener { configUpdate, error in
            guard let configUpdate, error == nil else {
                print("Error listening for config updates: \(error)")
                return
            }

            print("Updated keys: \(configUpdate.updatedKeys)")

            remoteConfig.activate { changed, error in
                guard error == nil else { return print("Error") }
                DispatchQueue.main.async {
                    self.buttonIsHidden = remoteConfig.configValue(forKey: "buttonIsEnabled").boolValue
                }
            }
        }
    }
}
