import UIKit

final class ItemsViewController: UITableViewController {
    let presenter: ToastCatalogPresenterProtocol
    init(presenter: ToastCatalogPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadTableView(completion: (()-> Void)? = nil) {
        presenter.getItems(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.showModal(title: "Error", message: error.customMessage)
            }
        })
    }
    
    private func showModal(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
extension ItemsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.toastItemViewModel?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.toastItemViewModel?[indexPath.row]  else {
            return CustomTableViewCell()
        }        
        let cell = CustomCellBuilder()
            .withIcon(item.image)
            .withTitle(item.name)
            .withSubtitle([item.priceNormalized,
                           item.lastSoldFormatted])
        return cell.build()
    }
}
