### Home24Demo ### (iOS)

===========================================================================

## Build Requirements
+ Xcode 9.3 or later
+ iOS 10.0 SDK or later

===========================================================================

## Runtime Requirements
+ iOS 10.0+


===========================================================================

Home24Demo folder structure
*****************************

1. Application : Containing specific app related stuff like AppDelegate, main.m, .pch, headers etc.
2. Library : Containing specific application classes like managers, helpers, base classes, services, extension, etc.
3. DataManagers : Containing a UserManager and AppDataManager.
4. Models : Containing application domain models and entities
5. Views : Containing common custom controls, custom views, storyboards, table and collection cells
6. Controllers : Containing nib file(.xib), custom views and view controllers
7. Resources : Containing assets like images, data(plist), fonts, sounds, videos, Localizable file, etc.


===========================================================================

## Run Project Steps
*****************************

1. Open Terminal and install pods.
2. Open xcworkspace file.
3. Add environments if you want from Application/AppConfiguration file. I added four environments there if required. Currently I added the base url in Development environment. You can Production, QA and staging environment as well and then edit the schema as per the requirement. Without any changes project will run in Development environment.
4. Make no of articles customizable in "SelectionScreenViewController" file. Use "articleLimit" property to fetch the no of articles from server. Currently I initialized it as 15 by default. User can change it as per the requirement.


===========================================================================

## Important Notes
*****************************
+ User can swipe right to make article as like and swipe left to make article as dislike. User can also use the heart button for like and cross button for dislike on "Selection Screen".



