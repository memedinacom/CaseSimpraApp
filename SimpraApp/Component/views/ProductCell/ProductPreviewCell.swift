
import UIKit

protocol ProductPreviewCellDelegate: NSObjectProtocol {
    func didSelectPost(with id: String)
}
class ProductPreviewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var contentTypeImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var lineView: UIView!

    
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
        self.priceLabel.text = "\(post.price!) TRY"
        self.product = post
        if (Double(post.price ?? 0.0) > 5.0) {
            lineView.backgroundColor = .orange
        }else{
            lineView.backgroundColor = .clear
        }
        
    }
    @IBAction private func didSelect() {
        guard let db = try? SimpraDB() else {return}
        self.delegate?.didSelectPost(with: product.id!)
        
        let cartModel = ProductItem()
        cartModel.id = product.id!
        cartModel.price = Int(Double(product.price!))
        cartModel.name = product.name!
        db.addBasketItem(cartModel)
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

