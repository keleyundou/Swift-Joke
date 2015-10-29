//
//  MainTabBarViewController.swift
//  Swift-Joke
//
//  Created by 冰点 on 15/6/26.
//  Copyright (c) 2015年 冰点. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    
    
    
    var mTabBar: UIView?
    var slider: UIView?
    
    var tabBarSelectIndex: Int = 0
    
    let tabBarBGColor: UIColor = UIColor(white: 0.5, alpha: 0.5)
    let tabBarSelectColor: UIColor = UIColor.whiteColor()
    
    let titleNormalColor: UIColor = UIColor.whiteColor()
    let titleSelectColor: UIColor = UIColor(white: 0.5, alpha: 0.5)
    
    let tabBarHeight: CGFloat = 49.0
    
    let tabBarItemArray = ["最新", "热门", "真相", "关于"]
    var w: CGFloat?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initViewControllers()
        // Do any additional setup after loading the view.
    }
    func setupViews() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        self.tabBar.hidden = true
        
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        
        let tabBarItemCount = count(tabBarItemArray)
        let sliderW = width / CGFloat(tabBarItemCount)
        w? = sliderW
        self.mTabBar = UIView(frame: CGRectMake(0, height - tabBarHeight, width, tabBarHeight))
        self.mTabBar!.backgroundColor = tabBarBGColor
        
        self.slider = UIView(frame: CGRectMake(0, 0, sliderW, tabBarHeight))
        self.slider!.backgroundColor = tabBarSelectColor
        
        self.mTabBar!.addSubview(self.slider!)
        self.view.addSubview(self.mTabBar!)
        
        for var index = 0; index < tabBarItemCount; index++ {
            var btnWitdth = CGFloat(index) * sliderW
            var button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
            button.frame = CGRectMake(btnWitdth, 0, sliderW, tabBarHeight)
            button.tag = index + 100
            
            var title = self.tabBarItemArray[index]
            button.setTitle(title, forState: UIControlState.Normal)
            button.setTitleColor(titleNormalColor, forState: UIControlState.Normal)
            button.setTitleColor(titleSelectColor, forState: UIControlState.Selected)
            
            button.addTarget(self, action: "tabBarButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            self.mTabBar?.addSubview(button)
            if index == tabBarSelectIndex {
                button.selected = true
            }
        }
    }
    
    func initViewControllers() {
        var vc1 = ViewController()
        var vc2 = ViewController()
        var vc3 = ViewController()
        var vc4 = ViewController()
        self.viewControllers = [vc1, vc2, vc3, vc4]
    }
    
    func tabBarButtonClicked(sender: UIButton) {
        var index = sender.tag
        
        for var i = 0; i < tabBarItemArray.count; i++ {
            var button = self.view.viewWithTag(i+100) as! UIButton
            if button.tag == index {
                button.selected = true
            } else {
                button.selected = false
            }
        }
        
        var width = self.view.frame.size.width
        let barWidth = width / CGFloat(tabBarItemArray.count)
        UIView.animateWithDuration(0.25, animations: {
            self.slider!.frame = CGRectMake(CGFloat(index-100) * barWidth, 0, barWidth, self.tabBarHeight)
        })
        self.title = tabBarItemArray[index-100] as String
        self.selectedIndex = index - 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
