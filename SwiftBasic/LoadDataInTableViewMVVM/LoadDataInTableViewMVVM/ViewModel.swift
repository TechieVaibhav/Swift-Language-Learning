//
//  ViewModel.swift
//  LoadDataInTableViewMVVM
//
//  Created by Vaibhav Sharma on 15/05/24.
//

import Foundation

class ViewModel{

    func loadData() -> [User] {
        let name1 = "Any data the user creates or owns. For example, when deleting an application, an uninstall program may ask if user data is also to be deleted. In this case, the user data would typically be custom settings made in the app and stored in a separate file or folder."

        let name2 = """
        High Quality 31mm Fan Weight Plates Set built to drop. It has Metal ring inside for easy loading and unloading. It comes in 2.5kg to 10kg of weight variant.
        Made with High Density Rubber.
        Embossed weight for easy recognition.
        Trendy colour design.
"""

        let name3 = "Any data the user creates or owns. For example, when deleting an application, an uninstall program may ask if user data is also to be deleted. In this case, the user data would typically be custom settings made in the app and stored in a separate file or folder."

        let name4 = """
in: Exclusive content, PC content, Console content, and 11 more
English
Jim's set
SIGN IN TO EDIT
PC version Console version Mobile version Old Chinese version tModLoader version tModLoader 1
PC/Console/Mobile/Old Chinese/tModLoader/tModLoader 1.3-Legacy-Only Content: This information applies only to the PC, Console, Mobile, Old Chinese, tModLoader, and tModLoader Legacy versions of Terraria.
Expert mode icon
Expert Mode-Only Content: This information applies only to Expert Mode and Expert Mode worlds.
Jim's set
Jim's set equipped
Stack digit 1
Statistics
Type
VanitySet
Tooltip    'Great for impersonating devs!'
Rarity    Rarity level: 9
Sell    15 (set)
Jim's set are vanity developer items that can be obtained rarely (5% chance) from Treasure Bags in Expert Mode. It is the vanity set made for Jimmarn, an artist who develops graphics for Terraria. Equipping the full set produces a glow effect similar to Spooky armor and grants an after-image movement effect similar to Ninja armor.
"""



        let user1 = User(name: "jim Set Info", description: name1,img: "enjoy1")
        let user2 = User(name: "jim Set Info", description: name2,img: "enjoy2")
        let user3 = User(name: "jim Set Info", description: name3,img: "enjoy3")
        let user4 = User(name: "jim Set Info", description: name4,img: "enjoy4")
        return [user1,user2, user3,user4]
    }

    func fetchData(onSuccess : @escaping ([UserData]) -> Void, onFailure : @escaping(Error)->Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"

        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string:urlString)!)) { data, respo, error in
            if let error = error{
                onFailure(error)
            }
            do {
                let user = try JSONDecoder().decode([UserData].self, from: data!)
                onSuccess(user)
            } catch let error{
                onFailure(error)
            }
        }
        task.resume()
    }

}

