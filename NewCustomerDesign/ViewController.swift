//
//  ViewController.swift
//  NewCustomerDesign
//
//  Created by Mag isb-10 on 10/09/2024.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var featuredRestaurantCV: UICollectionView!
  @IBOutlet weak var trendsCV: UICollectionView!
  @IBOutlet weak var masterServiceCV: UICollectionView!
  @IBOutlet weak var welcomeLbl: UILabel!
  @IBOutlet weak var quoteLabel: UILabel!
  
  var masterService: [MasterServicesModel] = [
    MasterServicesModel(img: UIImage(named: "burger"), hasOffers: true, offer: "+ 30,000", title: "Food"),
    MasterServicesModel(img: UIImage(named: "grocery"), hasOffers: false, offer: "", title: "Grocery"),
    MasterServicesModel(img: UIImage(named: "flowers"), hasOffers: true, offer: "40% Off", title: "Flowers"),
    MasterServicesModel(img: UIImage(named: "pharmacy"), hasOffers: false, offer: "", title: "Pharmacy"),
    MasterServicesModel(img: UIImage(named: "others"), hasOffers: false, offer: "", title: "Others"),
  ]
  
  var trends: [TrendsModel] = [
    TrendsModel(trendImg: UIImage(named: "trend1"), trendTitle: "Discounts"),
    TrendsModel(trendImg: UIImage(named: "trend2"), trendTitle: "Featured Stores"),
    TrendsModel(trendImg: UIImage(named: "trend3"), trendTitle: "New Shops"),
    TrendsModel(trendImg: UIImage(named: "trend1"), trendTitle: "Discounts"),
    TrendsModel(trendImg: UIImage(named: "trend2"), trendTitle: "Featured Stores"),
    TrendsModel(trendImg: UIImage(named: "trend3"), trendTitle: "New Shops"),
    TrendsModel(trendImg: UIImage(named: "trend1"), trendTitle: "Discounts"),
    TrendsModel(trendImg: UIImage(named: "trend2"), trendTitle: "Featured Stores"),
    TrendsModel(trendImg: UIImage(named: "trend3"), trendTitle: "New Shops"),
    TrendsModel(trendImg: UIImage(named: "trend1"), trendTitle: "Discounts"),
    TrendsModel(trendImg: UIImage(named: "trend2"), trendTitle: "Featured Stores"),
    TrendsModel(trendImg: UIImage(named: "trend3"), trendTitle: "New Shops"),
  ]
  
  var featuredRestaurants: [MasterRestaurantModel] = [
    MasterRestaurantModel(bgColor: UIColor.red, bannerImage: UIImage(named: "banner"), rating: "4.8 ( 450 )", restaurantName: "Qozina Resturant", cuisines: "Sandwish, Bakery, Breakfast, pastries", deliveryTime: "55 - 60 Min", deliveryLbl: "Free Delivery ( Spend 10 KWD )", deliveryImg: UIImage(named: "gift")),
    MasterRestaurantModel(bgColor: UIColor.YELLOW, bannerImage: UIImage(named: "banner"), rating: "4.8 ( 450 )", restaurantName: "Qozina Resturant", cuisines: "Sandwish, Bakery, Breakfast, pastries", deliveryTime: "55 - 60 Min", deliveryLbl: "Free Delivery ( Spend 10 KWD )", deliveryImg: UIImage(named: "star")),
    MasterRestaurantModel(bgColor: UIColor.red, bannerImage: UIImage(named: "banner"), rating: "4.8 ( 450 )", restaurantName: "Qozina Resturant", cuisines: "Sandwish, Bakery, Breakfast, pastries", deliveryTime: "55 - 60 Min", deliveryLbl: "Free Delivery ( Spend 10 KWD )", deliveryImg: UIImage(named: "gift")),
    MasterRestaurantModel(bgColor: UIColor.YELLOW, bannerImage: UIImage(named: "banner"), rating: "4.8 ( 450 )", restaurantName: "Qozina Resturant", cuisines: "Sandwish, Bakery, Breakfast, pastries", deliveryTime: "55 - 60 Min", deliveryLbl: "Free Delivery ( Spend 10 KWD )", deliveryImg: UIImage(named: "star")),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    setupLabel()
    masterServiceCV.delegate = self
    masterServiceCV.dataSource = self
    masterServiceCV.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    trendsCV.delegate = self
    trendsCV.dataSource = self
    trendsCV.register(UINib(nibName: "TrendsCell", bundle: nil), forCellWithReuseIdentifier: "TrendsCell")
    featuredRestaurantCV.delegate = self
    featuredRestaurantCV.dataSource = self
    featuredRestaurantCV.register(UINib(nibName: "FeaturedRestaurantCell", bundle: nil), forCellWithReuseIdentifier: "FeaturedRestaurantCell")
  }
  
  func setupLabel() {
    welcomeLbl.text = "Welcome to\nAgorz!"
    let text = "Where the ancient meets\nthe modern, and limitless\npossibilities await."

    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 5 // Set the line spacing value

    let attributedString = NSMutableAttributedString(string: text)
    attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))

    quoteLabel.attributedText = attributedString
    quoteLabel.numberOfLines = 0
  }


}

 
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == masterServiceCV {
      return masterService.count
    } else if collectionView == trendsCV {
      return trends.count
    } else if collectionView == featuredRestaurantCV {
      return featuredRestaurants.count
    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == masterServiceCV {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
      
      let item = masterService[indexPath.row]
      cell.serviceImg.image = item.img
      
      if item.hasOffers == true {
        cell.offerView.isHidden = false
      }
      
      cell.offerLbl.text = item.offer
      cell.serviceName.text = item.title
      return cell
    } else if collectionView == trendsCV {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendsCell", for: indexPath) as? TrendsCell else { return UICollectionViewCell() }
      
      let item = trends[indexPath.row]

      cell.trendImg.image = item.trendImg
      cell.trendLbl.text = item.trendTitle
      
      return cell
    } else if collectionView == featuredRestaurantCV {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedRestaurantCell", for: indexPath) as? FeaturedRestaurantCell else {
        return UICollectionViewCell()
      }
      
      let item = featuredRestaurants[indexPath.row]
      cell.bannerView.backgroundColor = item.bgColor
      cell.restaurantLogo.image = item.bannerImage
      cell.ratingLbl.text = item.rating
      cell.restaurantName.text = item.restaurantName
      cell.cuisinesLbl.text = item.cuisines
      cell.deliveryTime.text = item.deliveryTime
      cell.deliveryTypeImg.image = item.deliveryImg
      cell.deliveryTypeLbl.text = item.deliveryLbl
      
      return cell
    }
    return UICollectionViewCell()
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == masterServiceCV {
      return CGSize(width: (collectionView.frame.width / 3) - 10, height: 110)
    } else if collectionView == trendsCV {
      return CGSize(width: 100, height: 120)
    } else if collectionView == featuredRestaurantCV {
      return CGSize(width: 205, height: 240)
    }
    return .zero
  }
  
}
