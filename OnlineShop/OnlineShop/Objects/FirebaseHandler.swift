//
//  FirebaseHandler.swift
//  OnlineShop
//
//  Created by Arseniy on 27.01.2021.
//

import Foundation
import FirebaseDatabase

struct FirebaseHandler {
    private let value: Codable?

    init(_ value: Codable? = nil) {
        self.value = value
    }

    private var children: [String] = []

    private var actualReference: DatabaseReference {
        var ref = Database.database().reference()

        for child in children {
            ref = ref.child(child)
        }

        return ref
    }

    func back() -> FirebaseHandler {
        var new = self
        new.children.removeLast()
        return new
    }

    @discardableResult
    func read<T: Codable>(closure: ((T?) -> Void)?) -> FirebaseHandler {
        actualReference.observeSingleEvent(of: .value) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let model = try? T(from: dict)
                closure?(model)
            } else {
                closure?(nil)
            }
        }

        return self
    }

    func to(_ value: String) -> FirebaseHandler {
        var new = self
        new.children.append(value)
        return new
    }

    func auto() -> FirebaseHandler {
        return to(UUID().uuidString)
    }

    func setValue() -> FirebaseHandler {
        let dictionary = value?.dictionary
        actualReference.setValue(dictionary) { (error, reference) in

        }

        return self
    }
}
