import UIKit
import Data
import MGNetworks
import DSKit
import RxFlow
import RxSwift
import RxCocoa
import Domain

import PostureFeature
import Core

public class PostureFlow: Flow {
    
    private var rootViewController: UINavigationController!
    var postureService: PostureService!
    var postureRepository: PostureRepository!
    var useCase: DefaultPostureUseCase!
    var viewModel: PostureMainViewModel!
    var viewController: PostureMainViewController!
    
    public var root: Presentable {
        return self.rootViewController
    }

    public init() {
        setupService()
        setupViewController()
    }
    
    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MGStep else { return .none }

        switch step {
        case .postureMainIsRequired:
            return setupPostureMainScreen()
        case .postureRecommandIsRequired:
            return navigateToSearchViewScreen()
        case .postureChestIsRequired:
            return navigateToSearchViewScreen()
        case .postureBackIsRequired:
            return navigateToSearchViewScreen()
        case .postureShoulderIsRequired:
            return navigateToSearchViewScreen()
        case .postureArmIsRequired:
            return navigateToSearchViewScreen()
        case .postureStomachIsRequired:
            return navigateToSearchViewScreen()
        case .postureFrontlegIsRequired:
            return navigateToSearchViewScreen()
        case .postureSearchIsRequired:
            return navigateToSearchViewScreen()
        case .postureBack:
            return popupViewController()
        case .postureDetailIsRequired(let id):
            return navigateToDetailViewScreen(id: id)
        default:
            return .none
        }
    }
    
    private func setupService() {
        postureService = DefaultPostureService()
        postureRepository = PostureRepository(networkService: postureService)
        useCase = DefaultPostureUseCase(repository: postureRepository)
        viewModel = PostureMainViewModel(useCase: useCase)
    }

    private func setupViewController() {
        viewController = PostureMainViewController(viewModel)
        rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    private func setupPostureMainScreen() -> FlowContributors {
        rootViewController.view.backgroundColor = .white
        rootViewController.tabBarItem.title = "자세"
        rootViewController.tabBarItem.image = DSKitAsset.Assets.bPeopleTapBar.image
        rootViewController.tabBarItem.selectedImage = DSKitAsset.Assets.blPeopleTapBar.image
        rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNextPresentable: self.root, withNextStepper: PostureStepper.shared))
    }
    
    private func navigateToSearchViewScreen() -> FlowContributors {
        let vc = PostureSearchViewController(PostureSearchViewModel(useCase: self.useCase))
        rootViewController.pushViewController(vc, animated: true)
        MainTabBarContoller.shared.tabBar.isHidden = true
        return .none
    }
    
    private func navigateToDetailViewScreen(id: Int) -> FlowContributors {
        let vc = PostureDetailViewController(PostureDetailViewModel(useCase: self.useCase))
        vc.id = id
        rootViewController.pushViewController(vc, animated: true)
        MainTabBarContoller.shared.tabBar.isHidden = true
        return .none
    }

    private func popupViewController() -> FlowContributors {
        rootViewController.popViewController(animated: true)
        if rootViewController.viewControllers.count == 1 {
            MainTabBarContoller.shared.tabBar.isHidden = false
        }
        return .none
    }
}
