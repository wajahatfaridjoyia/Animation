import UIKit

class LayerViewController: UIViewController {
    @IBOutlet weak var table:UITableView!
    let setimages = [UIImage(named: "mang.jpeg")!,
                    UIImage(named: "orange.jpeg")!,
                     UIImage(named: "tiktok.png")!
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
}
extension LayerViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 13
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? tableCell)
        cell?.imageview.image = setimages[indexPath.item]
        cell?.label.text = "Fruit"
        
        UIView.animate(withDuration: 1, delay: 0.25,usingSpringWithDamping: 0.4,initialSpringVelocity: 0.2,options: [.transitionCurlDown,.repeat],animations: {
            cell?.transform = CGAffineTransform(translationX: 0.5, y: 0.5)
            cell?.alpha = 0.5
            cell?.center.x = self.view.bounds.width - 600
            cell?.center.y = self.view.bounds.height - 100
            cell?.layer.opacity = 0.25
            cell?.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
            cell?.center = CGPoint(x: self.view.bounds.width, y: self.view.bounds.height)
            cell?.center = .zero
            
            
        })
        return cell!
    }
}
class tableCell:UITableViewCell{
    @IBOutlet weak var imageview:UIImageView!
    @IBOutlet weak var label:UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
