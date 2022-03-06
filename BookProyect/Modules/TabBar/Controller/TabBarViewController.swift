//
//  TabBarViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 26/02/22.
//

import UIKit

class TabBarViewController: UIViewController, UITabBarControllerDelegate {

    var tabBarCnt: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBarController()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createTabBarController(){
        tabBarCnt = UITabBarController()
        tabBarCnt.delegate = self
        //tabBarCnt.tabBar.barStyle = .blackOpaque
        tabBarCnt.tabBar.backgroundColor = UIColor.brownColor
        tabBarCnt.tabBar.tintColor = UIColor.pinkColor
        tabBarCnt.tabBar.unselectedItemTintColor = UIColor.white
        
        let firstViewController = BooksViewController()
        firstViewController.title = "Home"
        firstViewController.tabBarItem.image = UIImage(named: "home")
        
        let secondViewController = FinderViewController()
        secondViewController.title = "Finder"
        secondViewController.tabBarItem.image = UIImage(named: "category")
        
        let thirdViewController = UserViewController()
        thirdViewController.title = "User"
        thirdViewController.tabBarItem.image = UIImage(named: "author")
        
        tabBarCnt.viewControllers = [firstViewController, secondViewController, thirdViewController]

        self.view.addSubview(tabBarCnt.view)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBar controller \(tabBarController.selectedIndex)")
    }
    

}
