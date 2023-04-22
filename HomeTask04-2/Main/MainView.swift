import UIKit
import SnapKit

class MainView: UIViewController {
    
    private var controller: Controller!
    var isFound = true
    
    
    private let loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Login"
        view.font = .boldSystemFont(ofSize: 60)
        return view
    }()
    
    private let infoLabel: UILabel = {
        let view = UILabel()
        view.text = "Please sign in to continue."
        return view
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setupShadowForView(6, 0, 7, opacity: 0.2)
        return view
    }()
    
    private let emailLabel: UILabel = {
        let view =  UILabel()
        view.text = "EMAIL"
        view.font = .systemFont(ofSize: 8)
        view.textColor = .gray
        return view
    }()
    
    var emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "example@email.com"
        return view
    }()
    
    private let emailImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "emailImage")
        return view
    }()
    
    private let passwordBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setupShadowForView(6, 0, 7, opacity: 0.2)
        return view
    }()
    
    var passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
        return view
    }()
    
    private let passwordImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "emailImage")
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginTap), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        controller = Controller(view: self)
        setupUi()
       
    }
    
    
    
    func openSecondVC() {
            let vc = SecondViewController()
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTap() {
        if controller.userTryLogin() == true {
            openSecondVC()
        } else {
            shoeAlert()
        }
    }
    
    func getLogin() -> String {
        return emailTextField.text ?? ""
    }
    
    func getPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    func shoeAlert() {
        let alertController = UIAlertController(title: "Login", message: "try again", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func setupUi() {
        
        view.backgroundColor = .white
        
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(32)
            make.leading.equalTo(loginLabel.snp.leading)
        }
        
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        backView.addSubview(emailImage)
        emailImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(4)
        }
        
        backView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalTo(emailImage).offset(24)
            
        }
        
        backView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalTo(emailImage)
            make.leading.equalTo(emailLabel)
            
        }
        
        view.addSubview(passwordBackView)
        passwordBackView.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
        
        passwordBackView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(emailTextField)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalTo(passwordBackView).offset(40)
            make.width.equalTo(80)
            make.height.equalTo(44)
        }
        
    }

}

extension UIView {
    ///setup shadow for view
    func setupShadowForView(_ radius: Int = 12,_ width: Int = 0,_ height: Int = 6, opacity: Float = 0.2){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: CGFloat(width), height: CGFloat(height))
        layer.shadowRadius = CGFloat(radius)
        layer.shadowOpacity = opacity
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
