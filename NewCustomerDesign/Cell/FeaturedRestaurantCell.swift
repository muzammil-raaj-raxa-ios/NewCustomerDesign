//
//  FeaturedRestaurantCell.swift
//  NewCustomerDesign
//
//  Created by Mag isb-10 on 30/09/2024.
//

import UIKit

class FeaturedRestaurantCell: UICollectionViewCell {
  
  @IBOutlet weak var deliveryTypeImg: UIImageView!
  @IBOutlet weak var deliveryTypeLbl: UILabel!
  @IBOutlet weak var deliveryTime: UILabel!
  @IBOutlet weak var cuisinesLbl: UILabel!
  @IBOutlet weak var restaurantName: UILabel!
  @IBOutlet weak var ratingLbl: UILabel!
  @IBOutlet weak var restaurantLogo: UIImageView!
  @IBOutlet weak var bannerView: UIView!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
