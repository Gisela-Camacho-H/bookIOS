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
        tabBarCnt.tabBar.barStyle = .blackOpaque
        tabBarCnt.tabBar.backgroundColor = UIColor.brownColor
        tabBarCnt.tabBar.tintColor = UIColor.pinkColor
        tabBarCnt.tabBar.unselectedItemTintColor = UIColor.white
        
        let firstViewController = BooksViewController()
        firstViewController.title = "Home"
        firstViewController.tabBarItem.image = UIImage(named: "home")
        
        let secondViewController = AuthorsViewController()
        secondViewController.title = "Authors"
        secondViewController.tabBarItem.image = UIImage(named: "author")
        
        let thirdViewController = CategoriesViewController()
        thirdViewController.title = "Categories"
        thirdViewController.tabBarItem.image = UIImage(named: "category")
        
        let fourthViewController = FindBookViewController()
        fourthViewController.title = "Books"
        fourthViewController.tabBarItem.image = UIImage(named: "books")
        
        tabBarCnt.viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]

        self.view.addSubview(tabBarCnt.view)
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBar controller \(tabBarController.selectedIndex)")
    }
    

}
