//
//  ReportType.swift
//  PositiveOne
//
//  Created by 임영선 on 2023/06/26.
//

import Foundation

enum ReportType: String {
    case user = "계정"
    case feed = "피드"
}

class Report {
    static let shared = Report()
    var reportType: ReportType?
    init(reportType: ReportType? = nil) {
        self.reportType = reportType
    }
}
