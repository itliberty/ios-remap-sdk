//
//  MSRetailType.swift
//  MoyskladiOSRemapSDK
//
//  Created by Антон Ефименко on 25.07.2018.
//  Copyright © 2018 Andrey Parshakov. All rights reserved.
//

import Foundation

public protocol MSRetailType: MSGeneralDocument {
    var retailShift: MSEntity<MSReportRetailShift>? { get set }
}
