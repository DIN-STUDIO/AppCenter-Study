import UIKit
import SnapKit

class MainViewController: UIViewController {
    var dataSource: [Movie] = Movie.movieList
    
    private let movieTableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .plain)
        
        return tableView
    }()

    private func setTableView() {
        movieTableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
    
    private func navigateDetailVC(_ indexPath: IndexPath) {
        let detailVC = MovieDetailViewController(movieData: dataSource[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    private func setLayouts() {
        view.backgroundColor = .white
        
        [movieTableView
        ].forEach{
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        movieTableView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayouts()
        setConstraints()
        setTableView()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    // DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableView를 UITableViewCell로 다운캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell ?? CustomCell()
        let selectedMovie = dataSource[indexPath.row]
        cell.bindData(model: selectedMovie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieTableView.deselectRow(at: indexPath, animated: true)
        navigateDetailVC(indexPath)
    }
}
