import UIKit
import SnapKit
import Then
import Core
import RxFlow
import RxCocoa
import RxSwift
import DSKit
import CSLogger
import PostureFeatureInterface

public class PostureRecommandViewController: BaseViewController<PostureViewModel>, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var firstModel: PostureRecommandModel!
    var secondModel: PostureRecommandModel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        firstModel = PostureRecommandModel.first
        secondModel = PostureRecommandModel.second

        
        tableView = UITableView().then {
            $0.dataSource = self
            $0.delegate = self
            $0.register(PostureRecommandTableViewCell.self, forCellReuseIdentifier: PostureRecommandTableViewCell.identifier)
            $0.rowHeight = 340
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .white
            $0.separatorStyle = .none
        }
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(676)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostureRecommandTableViewCell.identifier, for: indexPath) as! PostureRecommandTableViewCell
        if indexPath.row == 0 {
            cell.selecCell(model: firstModel)
        } else if indexPath.row == 1 {
            cell.selecCell(model: secondModel)
        }
        cell.selectionStyle = .none  
        return cell
    }
}