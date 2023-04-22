import Foundation
import UIKit

class Model {
    
    private weak var controller: Controller!
    
    //    private var mainview = MainView()
    
    var isFound = false
    
    var userData: [User] = [User(email: "Sonun@email.com", passsword: "12345678"), User(email: "beka@email.com", passsword: "87654321"), User(email: "asan@email.com", passsword: "22222222")]
    
    init(controller: Controller!) {
        self.controller = controller
        
    }
    
    func loginTap() -> Bool {
            for user in userData {
                if user.email == controller.userEmail() && user.passsword == controller.userPassword() {
                    isFound = true
                    break
                } else {
                    isFound = false
                }
            }
        
    return isFound
    }
}
