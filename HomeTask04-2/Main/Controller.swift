import Foundation
import UIKit

class Controller {
    
    private weak var view: MainView!
    
    private var model: Model?
    
    init(view: MainView) {
        self.view = view
        self.model = Model(controller: self)
    }
    
    func userEmail() -> String {
        return view.getLogin()
    }
    
    func userPassword() -> String {
        return view.getPassword()
    }
    
    func userTryLogin() -> Bool {
        let result = model?.loginTap()
        return result ?? false
    }
    
}
