import UIKit

class ToastCatalogViewController: UITableViewController {
    
    private(set) var toasts: [ToastCatalogItem] = []
    let service: ToastCatalogServiceable
    
    init(service: ToastCatalogServiceable) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
    }
    func loadTableView(completion: (() -> Void)? = nil) {
        self.fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.toasts = response
                self.tableView.reloadData()
                completion?()
            case .failure(let error):
                self.showModal(title: "Error", message: error.customMessage)
            }
        }
    }
    private func showModal(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func fetchData(completion: @escaping(Result<[ToastCatalogItem], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getToastCatalog()
            completion(result)
        }
    }
}
extension ToastCatalogViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toasts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = toasts[indexPath.row].name
        
        return cell
    }
}
