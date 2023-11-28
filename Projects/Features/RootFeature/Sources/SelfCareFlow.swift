import UIKit
import RxFlow
import RxSwift
import RxCocoa
import DSKit

class SelfCareFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    private let rootViewController = UINavigationController()

    init() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        viewController.tabBarItem = UITabBarItem(title: nil, image: DSKitAsset.Assets.whiteMuscle.image, selectedImage: nil)
        rootViewController.setViewControllers([viewController], animated: false)
    }

    func navigate(to step: Step) -> FlowContributors {
        return .none
    }
}
