import UIKit

class ItemTableViewCell: UITableViewCell {

    static let reuseIdentifier = "item_cell"

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

}
