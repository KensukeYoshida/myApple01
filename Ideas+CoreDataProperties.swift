//
//  Ideas+CoreDataProperties.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/11.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import Foundation
import CoreData


extension Ideas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ideas> {
        return NSFetchRequest<Ideas>(entityName: "Ideas")
    }

    @NSManaged public var memo: String?
    @NSManaged public var saveDate: NSDate?
    @NSManaged public var title1: String?
    @NSManaged public var title2: String?
    @NSManaged public var title3: String?

}
