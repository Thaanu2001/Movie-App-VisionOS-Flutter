import UIKit
import Flutter

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        addFlutterView(with: flutterEngine)
    }
}

// create an extension for all UIViewControllers
extension UIViewController {
     /**
         Add a flutter sub view to the UIViewController
         sets constraints to edge to edge, covering all components on the screen
     */
    func addFlutterView(with engine: FlutterEngine) {
        // create the flutter view controller
        let flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        
        addChild(flutterViewController)
        
        guard let flutterView = flutterViewController.view else { return }

        // allows constraint manipulation
        flutterView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(flutterView)
        
        // set the constraints (edge-to-edge) to the flutter view
        let constraints = [
            flutterView.topAnchor.constraint(equalTo: view.topAnchor),
            flutterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            flutterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            flutterView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        // apply (activate) the constraints
        NSLayoutConstraint.activate(constraints)

        flutterViewController.didMove(toParent: self)
        
        // updates the view with configured layout
        flutterView.layoutIfNeeded()
    }
}
