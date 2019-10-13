//
//  SearchBarViewController.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 12/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI
import UIKit

struct SearchBarViewController: UIViewControllerRepresentable {
    
    func makeCoordinator() -> SearchBarViewController.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SearchBarViewController>) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<SearchBarViewController>) {
        return
    }
    
    typealias UIViewControllerType = UIViewController
    
    class Coordinator: NSObject {
        var parent: SearchBarViewController

        init(_ searchBarViewController: SearchBarViewController) {
            self.parent = searchBarViewController
        }
        
        func doAction(action: @escaping () -> Void) {
            action()
        }
    }
}
