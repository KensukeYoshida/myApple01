//
//  Words+CoreDataProperties.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/10.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import Foundation
import CoreData


extension Words {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var title: String?
    @NSManaged public var saveDate: NSDate?

}
