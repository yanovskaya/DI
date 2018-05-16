//: Playground - noun: a place where people can play

import UIKit

// Dependancy Injection

//Dependency injection is a scary term for a very simple idea. Instead of creating the dependency internally


protocol Service1 {}
class RealService1: Service1 {}

class Client1 {
    let service: Service1
    
    init() {
        service = RealService1()
    }
}

// an object can receive it from the outside.


protocol Service {}
class RealService: Service {}

class Client {
    let service: Service
    
    init(service: Service) {
        self.service = service
    }
}

//The objects instantly become fully testable. A test double instead of a real service can be passed to the initializer to provide the expected responses or spy on what’s called on the Service.

// The creation of dependencies is separated from the client’s behavior.
