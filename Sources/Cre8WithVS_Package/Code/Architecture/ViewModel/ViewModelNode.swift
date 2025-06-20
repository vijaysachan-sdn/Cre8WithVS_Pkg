//
//  ViewModelArchitecture.swift
//  Cre8WithVS_Package
//
//  Created by Vijay Sachan on 6/20/25.
//
import SwiftUI

@MainActor
class ViewModelNode: ObservableObject{
    @Published var rootNode: ModelViewNode?
    public init(){
        print(String(describing: type(of: self)))
    }
    /// Asynchronously loads the root node using a background thread
    func loadDataAsync() async {
        let node = await Task.detached(priority: .userInitiated) {
            return self.createRootNode()
        }.value
        self.rootNode = node
    }
    /// Synchronously loads the root node
    func loadDataSync()->ViewModelNode{
        let node = createRootNode()
        self.rootNode = node
        return self
    }
    /// Creates the root node using provided parent and children
     nonisolated func createRootNode() -> ModelViewNode{
        fatalError("Subclasses must override createRootNode()")
    }

}
