
import UIKit

protocol ProductPreviewCellDelegate: NSObjectProtocol {
    func didSelectPost(with id: String)
}
class ProductPreviewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var contentTypeImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    // MARK: - Properties
    
    weak var delegate: ProductPreviewCellDelegate?
    private var product: MenuItem!
    
    // MARK: - Lifecyle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Functions
    
    func setup(_ delegate: ProductPreviewCellDelegate, post: MenuItem) {
        
        self.delegate = delegate
        self.descriptionLabel.text = post.name
        self.product = post
        
    }
    @IBAction private func didSelect() {
        //        Int64(truncating: NSNumber(integerLiteral: post.owner!.id!))
        self.delegate?.didSelectPost(with: product.id!)
        self.showAnimation()
    }
    
    // MARK: - Animasyonu Göster
    
    func showAnimation(){
        self.contentTypeImageView.isHidden = false
        
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.contentTypeImageView.transform = CGAffineTransform(scaleX: 2.6, y: 2.6)
                        self.contentTypeImageView.frame.origin.y = -self.contentTypeImageView.frame.size.height
                        self.contentTypeImageView.alpha = 0
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.hideButton()
                        }
        })
    }
    
    
    // MARK: - Animasyonu Kapat
    func hideButton(){
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.contentTypeImageView.transform = CGAffineTransform.identity
                        
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.contentTypeImageView.frame.origin.y = self.frame.size.height - self.contentTypeImageView.frame.size.height
                            self.contentTypeImageView.isHidden = true
                            self.contentTypeImageView.alpha = 1  
                        }
        })
    }
    
}



// MARK: - Action

