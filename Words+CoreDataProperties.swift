//
//  Words+CoreDataProperties.swift
//  myApple01
//
//  Created by kensuke yoshida on 2017/07/11.
//  Copyright © 2017年 kensuke yoshida. All rights reserved.
//

import Foundation
import CoreData


extension Words {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var saveDate: NSDate?
    @NSManaged public var title: String?

}
