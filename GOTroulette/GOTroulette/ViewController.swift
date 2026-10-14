import UIKit

struct Favorite {
    let imageName: String
    let title: String
    let details: String
}

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    private let favorites: [Favorite] = [
        Favorite(imageName: "john",
                 title: "Jon Snow",
                 details: "Ned Stark's bastard son, Lord Commander of the Night's Watch and King in the North."),
        Favorite(imageName: "daenerys",
                 title: "Daenerys Targaryen",
                 details: "Mother of Dragons, last of House Targaryen and claimant to the Iron Throne."),
        Favorite(imageName: "tyrion",
                 title: "Tyrion Lannister",
                 details: "A sharp-witted dwarf of House Lannister, master of words and Hand of the King."),
        Favorite(imageName: "Robb",
                 title: "Robb Stark",
                 details: "Ned's eldest son, the Young Wolf and King in the North, who led armies against the Lannisters."),
        Favorite(imageName: "cersei",
                 title: "Cersei Lannister",
                 details: "Queen of the Seven Kingdoms, ready to do anything for power and her children."),
        Favorite(imageName: "tormund",
                 title: "Tormund Giantsbane",
                 details: "A cheerful and fearless Wildling chieftain who became Jon's loyal ally."),
        Favorite(imageName: "Eddard",
                 title: "Eddard Stark",
                 details: "Lord of Winterfell and Hand of King Robert, a man of unshakable honor."),
        Favorite(imageName: "jaime",
                 title: "Jaime Lannister",
                 details: "The Kingslayer, finest swordsman of the Kingsguard and Cersei's twin brother."),
        Favorite(imageName: "jofrey",
                 title: "Joffrey Baratheon",
                 details: "The cruel young king, son of Cersei, who ruled the Seven Kingdoms."),
        Favorite(imageName: "stannis",
                 title: "Stannis Baratheon",
                 details: "A stern claimant to the Iron Throne, brother of King Robert and follower of the Red Priestess.")
    ]

    private var currentIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(red: 0.85, green: 0.7, blue: 0.35, alpha: 1).cgColor

        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 24)
        titleLabel.textColor = UIColor(red: 0.85, green: 0.7, blue: 0.35, alpha: 1)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.6
        titleLabel.numberOfLines = 1

        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.8
        descriptionLabel.font = UIFont(name: "Georgia", size: 16)
        descriptionLabel.textColor = .white

        for label in [titleLabel, descriptionLabel] {
            label?.layer.shadowColor = UIColor.black.cgColor
            label?.layer.shadowOpacity = 0.9
            label?.layer.shadowRadius = 4
            label?.layer.shadowOffset = CGSize(width: 1, height: 1)
        }

        show(at: 0)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var candidates = Array(favorites.indices)
        if let current = currentIndex {
            candidates.removeAll { $0 == current }
        }
        guard let next = candidates.randomElement() else { return }
        show(at: next)
    }

    private func show(at index: Int) {
        guard favorites.indices.contains(index) else { return }
        let item = favorites[index]
        imageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        descriptionLabel.text = item.details
        currentIndex = index
    }
}
