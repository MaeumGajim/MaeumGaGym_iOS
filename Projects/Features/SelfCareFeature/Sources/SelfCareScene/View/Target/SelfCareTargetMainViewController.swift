import UIKit

import RxSwift
import RxCocoa
import RxFlow

import SnapKit
import Then

import Core
import DSKit
import Domain

import MGLogger
import Data
import MGNetworks

import SelfCareFeatureInterface

public class SelfCareTargetMainViewController: BaseViewController<SelfCareTargetMainViewModel> {

    private var targetMainModel: SelfCareTargetMainModel = SelfCareTargetMainModel(
        titleTextData:
            TargetTitleTextModel(
                titleText: "",
                infoText: ""),
        targetData: []
    )

    private var headerView = UIView()
    private var containerView = UIView()

    private let targetTitleLabel = UILabel().then {
        $0.textColor = .black
        $0.contentMode = .left
        $0.font = UIFont.Pretendard.titleLarge
    }

    private let targetSubTitleLabel = UILabel().then {
        $0.numberOfLines = 1
        $0.textColor = DSKitAsset.Colors.gray600.color
        $0.font = UIFont.Pretendard.bodyMedium
    }

    private var targetMainTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.register(TargetMainTableViewCell.self,
                    forCellReuseIdentifier: TargetMainTableViewCell.identifier)
    }

    private var plusTargetButton = SelfCareButton(type: .plusTarget)

    public override func attribute() {
        super.attribute()

        view.backgroundColor = .white

        targetTitleLabel.text = targetMainModel.titleTextData.titleText
        targetSubTitleLabel.text = targetMainModel.titleTextData.infoText

        targetMainTableView.delegate = self
        targetMainTableView.dataSource = self
    }

    public override func layout() {
        super.layout()

        headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 124.0))
        view.addSubview(headerView)

        headerView.addSubview(containerView)

        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(24.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }

        containerView.addSubviews([targetTitleLabel, targetSubTitleLabel])

        targetTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(48.0)
        }

        targetSubTitleLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(20.0)
        }

        view.addSubviews([targetMainTableView, plusTargetButton])
        targetMainTableView.tableHeaderView = headerView
        targetMainTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        plusTargetButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-54.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(58.0)
        }
    }

    public override func bindViewModel() {
        let useCase = DefaultSelfCareUseCase(repository: SelfCareRepository(networkService: SelfCareService()))

        viewModel = SelfCareTargetMainViewModel(useCase: useCase)

        let input = SelfCareTargetMainViewModel.Input(
            getTargetMainData: Observable.just(()).asDriver(onErrorDriveWith: .never()))

        let output = viewModel.transform(input, action: { output in
            output.targetMainData
                .subscribe(onNext: { targetMainData in
                    MGLogger.debug("targetMainData: \(targetMainData)")
                    self.targetMainModel = targetMainData
                }).disposed(by: disposeBag)
        })
    }
}

extension SelfCareTargetMainViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == targetMainModel.targetData.count + 1 {
            return 100
        } else {
            return 94
        }
    }
}
extension SelfCareTargetMainViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        targetMainModel.targetData.count + 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == targetMainModel.targetData.count {
            let cell = UITableViewCell()
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TargetMainTableViewCell.identifier,
                for: indexPath) as? TargetMainTableViewCell
            let model = targetMainModel.targetData[indexPath.row]
            cell?.setup(with: model)
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        }
    }
}
