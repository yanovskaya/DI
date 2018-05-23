//: Playground - noun: a place where people can play

import UIKit

// Dependancy Injection

// Вместо того, чтобы создавать зависимость внутри

protocol Service1 {}
class RealService1: Service1 {}

class Client1 {
    let service: Service1
    
    init() {
        service = RealService1()
    }
}

// Объект может получить ее снаружи.


protocol Service {}
class RealService: Service {}

class Client {
    let service: Service
    
    init(service: Service) {
        self.service = service // зависимости внутри нет, объект получит ее снаружи при инициализации
    }
}

// Объекты сразу становятся полностью тестируемыми. Тестируемый дубль вместо реального сервиса может быть передан инициализатору, чтобы получать ожидаемые респонсы или шпионить за тем, что вызвано службой.

// Есть 3 типа DI:
// setter-
// interface-
// constructor-based

// Constructor = initializer-based injection
// Это когда зависимость передается клиенту в инициализаторе и не изменяется в течение всего срока жизни клиента.
// Однако самым большим преимуществом такого типа может быть тот факт, что он делает очевидным очевидное нарушение принципа единой ответственности. Если объект принимает все свои зависимости в инициализаторе, а инициализатор имеет более трех параметров, это намек на то, что объект может выполнять несколько операций, а рефакторинг необходим.

// Resource: https://medium.com/ios-os-x-development/dependency-injection-in-swift-a959c6eee0ab
