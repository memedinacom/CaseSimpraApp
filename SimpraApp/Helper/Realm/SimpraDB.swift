//
//  SimpraDB.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 27.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import RealmSwift

public typealias SimpraModelCallback = ((_ status: Bool) -> Void)

class SimpraDB {
    private let realm: Realm

    init() throws {
        self.realm = try Realm()
        print(self.realm.configuration.fileURL)
        
    }
    
    //Employee save data
    /// Müşterileri json urlden ççekip dpye yazar
    /// - Parameter data: EmployeeModel
    func saveUserData(_ data: EmployeeModel){
        do {
            try realm.write {
                for item in data.employees {
                    realm.add(item)
                }
            }
        } catch let error as NSError {
            
        }
    }
    
    /*Kullanıcı kaydı varmı yokmu o Realmden okuyup count kontrolü yapıyor
     Realm dosyasına ulaşamaz veya class datasını bulamazsa false döndürür.
     Datayı bulup listede kayıt olmaması durumunda false döndürür
     */
    func isValidDataEmployee()->Bool{
        do {
            guard let db = try? SimpraDB() else {return false}
            let employeList = db.realm.objects(employee_item.self)
            if (employeList.count > 0) { return true} else { return false}
        }
       
    }
    
    // MARK: - Login employee from realm
    func loginWithUser(firstName:String , lastname lastName:String , password pin:String , closure: @escaping SimpraModelCallback){
           let users = realm.objects(employee_item.self).filter("first_name = '\(firstName)' && last_name = '\(lastName)' && pin = '\(pin)' ")
           if users.count > 0 {
               closure(true)
           }else{
               closure(false)
           }
           
       }
    
    
    /// Tıklanan ürün DB ye kaydedilir. aynı üründen varsa basketCount 1 arttırılır
    /// - Parameter product: ProductItem ürün modeli
     func addBasketItem(_ product: ProductItem)
    {
        let foundItem = realm.objects(ProductItem.self)
                .filter("id == %@", product.id)
        if foundItem.count == 0 {
            try! realm.write {
                       realm.add(product)
                   }
        }else{
            do {
                if let item = foundItem.first{
                    
                    try! realm.write {
                        item.basketCount = item.basketCount + 1
                        realm.add(item)
                    }
                    
                }
            }
            // Ürün sepette ise sayısı 1 arttırılıyor.
        }
    }
  
}
