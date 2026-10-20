import UIKit

class ViewController: UIViewController {

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var postsValueLabel: UILabel!
    @IBOutlet var followersValueLabel: UILabel!
    @IBOutlet var followingValueLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.image = UIImage(named: "photo01")
        nameLabel.text = "Artur Arystanbekov"
        subtitleLabel.text = "iOS Developer · Aktobe"
        postsValueLabel.text = "0"
        followersValueLabel.text = "186"
        followingValueLabel.text = "185"
        aboutLabel.text = "KBTU 4th year student. I was born in the city of Aktobe in 2005. I used to do boxing and swimming, and I also like to watch movies and sometimes read books. I also play foorball with friends. I also love watching foorball. My favourite team is Barcelona. I've been fan of them since childhood."
    }
}
