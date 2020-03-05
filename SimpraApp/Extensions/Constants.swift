//
//  Constants.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 2.03.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
public enum SegmentProductId :String{
    case coldDrink = "TWVudUl0ZW1Hcm91cC0zZTdjYmQyMC04ZGFjLTQ4MjMtOTdjOC05NzRmOGQ4MGNkMzM="
    case hotDrink = "TWVudUl0ZW1Hcm91cC01MWNkZGQ5Zi01OGQ5LTRmZWMtYTRiNy03YTRlYmVjZjc3MGY="
    case mainCourse = "TWVudUl0ZW1Hcm91cC1mNGNmYjQ3YS1hOGZhLTRhY2EtODlhNC0xNTM4MzY0NmQ5NTY="
    case soup = "TWVudUl0ZW1Hcm91cC1jYTU3YzA2Ni01ZTJjLTQwNTYtODY0NS0zNTQ0NjVjNmM3NWY="
    case dessert = "TWVudUl0ZW1Hcm91cC01NzkwZTc2NC1hMmRmLTQzY2QtOTQ3Yy1jZGRjMmU2MDAwZDM="
    case mostSell = "MOST_CELL"
}

enum ViewControllerSegue: String {
     case FastFoodToSetting = "FastFoodToSetting"
 }
