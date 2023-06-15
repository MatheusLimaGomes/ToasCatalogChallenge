import UIKit

final class ItemsViewController: UITableViewController {
    var presenter: ToastCatalogPresenterProtocol?
    private let cellID = "toastCellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: self.cellID)
        loadTableView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadTableView(completion: (()-> Void)? = nil) {
        presenter?.getItems(completion: { [weak self] result in
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
        presenter?.toastItemViewModel?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var content = cell.defaultContentConfiguration()
        let item = presenter?.toastItemViewModel?[indexPath.row]
        content.text = item?.name
        content.secondaryText = item?.priceNormalized
        content.image = ImageRepository.imageForItemIdentifier(itemItentifier: Int(item?.id ?? -1))
        content.imageProperties.tintColor = UIColor(named: "ImagesBackground")
        cell.contentConfiguration = content
        return cell
    }
}
