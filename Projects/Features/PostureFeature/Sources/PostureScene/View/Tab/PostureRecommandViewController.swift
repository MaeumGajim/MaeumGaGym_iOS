import UIKit

import RxFlow
import RxCocoa
import RxSwift

import SnapKit
import Then

import Core
import DSKit
import MGLogger

import Domain
import Data
import MGNetworks

import PostureFeatureInterface

enum RecommandCell {
    case recommand
}

public class PostureRecommandViewController: BaseViewController<PostureRecommandViewModel> {

    private var recommandData: [PostureRecommandModel] = []

    private var recommandTableView: UITableView = UITableView().then {
        $0.register(PostureRecommandTableViewCell.self,
                    forCellReuseIdentifier: PostureRecommandTableViewCell.identifier)
        $0.rowHeight = 340
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
        $0.separatorStyle = .none
    }

    public override func attribute() {
        recommandTableView.dataSource = self
    }

    public override func layout() {
        super.layout()
        view.addSubviews([recommandTableView])

        recommandTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(676)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }
    
    public override func bindViewModel() {
        super.bindViewModel()
        
        let useCase = DefaultPostureUseCase(repository: PostureRepository(networkService: PostureService()))
        
        let input = PostureRecommandViewModel.Input(
            getRecommandData:
                Observable.just(())
                .asDriver(onErrorDriveWith: .never())
        )
        
        let output = viewModel.transform(input, action: { output in
            output.recommandData
                .subscribe(onNext: { recommandData in
                    MGLogger.debug("Recommand Data: \(recommandData)")
                    self.recommandData = recommandData
                }).disposed(by: disposeBag)
        })
    }
}

extension PostureRecommandViewController: UITableViewDataSource {
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 2
    }

    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PostureRecommandTableViewCell.identifier,
            for: indexPath
        ) as? PostureRecommandTableViewCell
        let model = recommandData[indexPath.row]
        cell?.selecCell(model: model)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
}
