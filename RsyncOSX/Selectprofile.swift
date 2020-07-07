//
//  Selectprofile.swift
//  RsyncOSX
//
//  Created by Thomas Evensen on 16/06/2019.
//  Copyright © 2019 Thomas Evensen. All rights reserved.
//
// swiftlint:disable line_length

import Foundation

final class Selectprofile {
    var profile: String?
    weak var newProfileDelegate: NewProfile?
    weak var snapshotnewProfileDelegate: NewProfile?
    weak var loggdataProfileDelegate: NewProfile?
    weak var restoreProfileDelegate: NewProfile?

    init(profile: String?, selectedindex: Int?) {
        self.profile = profile
        self.newProfileDelegate = ViewControllerReference.shared.getvcref(viewcontroller: .vctabmain) as? ViewControllerMain
        self.snapshotnewProfileDelegate = ViewControllerReference.shared.getvcref(viewcontroller: .vcsnapshot) as? ViewControllerSnapshots
        self.loggdataProfileDelegate = ViewControllerReference.shared.getvcref(viewcontroller: .vcloggdata) as? ViewControllerLoggData
        self.restoreProfileDelegate = ViewControllerReference.shared.getvcref(viewcontroller: .vcrestore) as? ViewControllerRestore
        if self.profile == NSLocalizedString("Default profile", comment: "default profile") {
            newProfileDelegate?.newProfile(profile: nil, selectedindex: selectedindex)
        } else {
            newProfileDelegate?.newProfile(profile: self.profile, selectedindex: selectedindex)
        }
        self.snapshotnewProfileDelegate?.newProfile(profile: nil, selectedindex: selectedindex)
        self.loggdataProfileDelegate?.newProfile(profile: nil, selectedindex: selectedindex)
        self.restoreProfileDelegate?.newProfile(profile: nil, selectedindex: selectedindex)
        // Close edit and parameters view if open
        if let view = ViewControllerReference.shared.getvcref(viewcontroller: .vcrsyncparameters) as? ViewControllerRsyncParameters {
            weak var closeview: ViewControllerRsyncParameters?
            closeview = view
            closeview?.closeview()
        }
        if let view = ViewControllerReference.shared.getvcref(viewcontroller: .vcedit) as? ViewControllerEdit {
            weak var closeview: ViewControllerEdit?
            closeview = view
            closeview?.closeview()
        }
    }
}
