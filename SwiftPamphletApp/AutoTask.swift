//
//  AutoTask.swift
//  SwiftPamphletApp
//
//  Created by Ming Dai on 2022/2/10.
//

import Foundation

struct AutoTask {
    
    static func buildContentMarkdownFile() {
        let a = ["guide-syntax","guide-features","guide-subject","lib-Combine","lib-Concurrency","lib-SwiftUI"]
        var mk = ""
        for e in a {
            let fc:[CustomIssuesModel] = loadBundleJSONFile(e + ".json")
            if e == "guide-syntax" {
                mk += "## 语法速查\n\n"
            }
            if e == "guide-feature" {
                mk += "## 特性\n\n"
            }
            if e == "guide-subject" {
                mk += "## 专题\n\n"
            }
            if e == "lib-Combine" {
                mk += "## Combine\n\n"
            }
            if e == "lib-Concurrency" {
                mk += "## Concurrency\n\n"
            }
            if e == "lib-SwiftUI" {
                mk += "## SwiftUI\n\n"
            }
            for e1 in fc {
                mk += "### \(e1.name)\n\n"
                for e2 in e1.issues {
                    mk += "#### \(e2.title)\n\n"
                    let str = loadBundleString(String(e2.number) + ".md")
                    mk += str + "\n\n"
                }
            }
        }
        writeToDownload(fileName: "read.md", content: mk)
    }
    
}







