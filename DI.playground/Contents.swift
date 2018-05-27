/*:
 Dependency Injection в Swift 4.1
 ====
 Краткое описание dependency injection в языке Swift.
 */
/*:
**Вместо того, чтобы создавать зависимость внутри ...**
*/

protocol Service {}
class RealService: Service {}

class Client {
    let service: Service
    
    init() {
        service = RealService() // зависимость внутри инициализатора
    }
}

/*:
... объект должен получить ее снаружи.
*/

protocol ServiceDI {}
class RealServiceDI: ServiceDI {}

class ClientDI {
    let service: ServiceDI
    
    init(service: ServiceDI) {
        self.service = service // зависимости внутри нет, объект получит ее снаружи при инициализации
    }
}

/*:
Объекты сразу становятся полностью тестируемыми. Тестируемый дубль вместо реального сервиса может быть передан инициализатору, чтобы получать ожидаемые респонсы или шпионить за тем, что вызвано службой.
 
 **Есть 3 типа DI:**
 
 * Setter-
 * Interface- (редко используется)
 * Constructor-based (Initializer-based)
 
 ## **Initializer-based Injection**
 
 Зависимость передается клиенту в инициализаторе и **не изменяется в течение всего срока жизни клиента**.
 
 Его преимущество в том, что он делает очевидным нарушение принципа единой ответственности. Если объект принимает все свои зависимости в инициализаторе, а инициализатор имеет более трех параметров, это намек на то, что объект может выполнять несколько операций, и рефакторинг необходим.
 
 ## **Setter Injection**
 
 Если зависимость (engine) может меняться в течение жизни зависимого объекта (car), или когда при инициализации это ```nil```, лучше использовать Setter Injection.
 
 **Примеры setter injection:**
```
 car.setEngine(rocketEngine)
 ```
```
 car.engine = rocketEngine
 ```
*/
/*:
### Источники:
+ <https://medium.com/ios-os-x-development/dependency-injection-in-swift-a959c6eee0ab>
+ <https://learnappmaking.com/dependency-injection-swift/>
*/
