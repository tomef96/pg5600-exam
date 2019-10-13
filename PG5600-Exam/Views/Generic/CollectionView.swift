//
//  CollectionView.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import SwiftUI
// https://www.averyvine.com/blog/programming/2019/06/07/uicollectionview-and-uicollectionviewdiffabledatasource-in-swiftui
struct CollectionView: UIViewRepresentable {
    
    func makeCoordinator() -> CollectionView.Coordinator {
        return Coordinator()
    }
    
    
    class Coordinator: NSObject, UICollectionViewDelegate {
        
        var dataSource: UICollectionViewDiffableDataSource<MySection, Album>?
        
    }
    
    enum MySection {
        case main
    }

    // This represents a model object that we would have in our collection. When using UICollectionViewDiffableDataSource, the model must be Hashable
    class MyModelObject: Hashable {
        let id = UUID()

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: MyModelObject, rhs: MyModelObject) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<CollectionView>) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "albumCell")
        let dataSource = UICollectionViewDiffableDataSource<MySection, Album>(collectionView: collectionView) { collectionView, indexPath, myModelObject in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath)
            cell.backgroundColor = .red
            // ...
            // Do whatever customization you want with your cell here!
            // ...
            return cell
        }
        populate(dataSource: dataSource)
        context.coordinator.dataSource = dataSource
        return collectionView
    }
    
    func populate(dataSource: UICollectionViewDiffableDataSource<MySection, Album>) {
        var snapshot = NSDiffableDataSourceSnapshot<MySection, Album>()
        snapshot.appendSections([.main])
        snapshot.appendItems([
            Album(id: "1", name: "Yolo", artist: "Swag"),
            Album(id: "2", name: "Yolo", artist: "Swag"),
            Album(id: "3", name: "Yolo", artist: "Swag")
        ])
        dataSource.apply(snapshot)
    }
    
    func updateUIView(_ uiView: UICollectionView, context: UIViewRepresentableContext<CollectionView>) {
        uiView.dataSource = context.coordinator.dataSource
    }
    
    typealias UIViewType = UICollectionView
    
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

