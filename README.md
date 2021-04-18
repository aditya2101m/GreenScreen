# GreenScreen

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
An app that helps to implement the Pomodoro technique while working. It includes a scoreboard that lets the user keep track with other users' progress.


### App Evaluation
- **Category:** Productivity 
- **Mobile:** This app would be only developed for mobile
- **Story:** The app allows the user to set a desired amount of time on their mobile, when the timer starts a small graphic of a plant pops up and it grows with time on the screen. If the user uses their phone while the timer is on, the plant dies. There would also be a leaderboard where friends can keep track of each others productivity. 
- **Market:** Any individual could choose to use this app, and to keep it healthy work environment, there would be a friend's leaderborad available for usage.
Any individual could choose to use this app, the main target group is for individuals who would like 
- **Habit:** This app could be used as often or unoften as the user wanted depending on how well they need to increase their productivity and stay focused on their work.
- **Scope:** This app can be integrated into the operating systems like ios/android in future to reduce screentime in general use. 

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User logs in to access friends and preference settings
- [ ] User can see leaderboard
- [x]  users can change password
- [x]  Profile pages for each user
- [X]  Settings (Accesibility, Notification, General, etc.)

**Optional Nice-to-have Stories**

* App will display a motivational quote after their time goal is achieved
* App will play a pleasent sound when timer is running

### 2. Screen Archetypes

* Login 
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information. 
* Main screen - gives option to the users
    * users can click on leaderboard or set a goal to be achieved
* Work screen - screen that shows up when the person would be working
    * It will display the timer with the growth of the tree
* Profile Screen 
   * Allows user to upload a photo and fill in information that is interesting to them and others
* Leaderboard Screen.
   * Allows user to compete and see the points of their friends
* Settings Screen
   * Lets people change language, and app notification settings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Screen
* Profile
* Settings
* Work Screen
* Leaderboard
* Add friends
* Upload profile pics

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Main Screen (User can set timer) -> Jumps to Setting, Leaderboard and Work Screen
* Settings -> Toggle settings, add friends (Jumps to add friend screen), change profile picture (Jumps to Change Profile Screen)

## Wireframes
<img src="https://i.imgur.com/YpvqCCN.jpg" width=800><br>
<img src="http://g.recordit.co/tlKU3Bl2TS.gif" width=200><br>
<img src="https://media.giphy.com/media/w2wp6r5A6HRjuBgISp/giphy.gif" width=300><br>
<img src="https://i.imgur.com/H8ylaAZ.gif" width=200><br>


## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userId        | String   | unique username for the user|
   | password        | String| password of the account |
   | scoreCount       | Number     | score the user has achieved |



### Networking
#### List of network requests by screen
   - Log In Screen
       - (Read/Get) User's credentials
       - (Create/POST) New users' credentials
   - Main Screen
      - (Create/POST) Users input their desired amount of time
   - Profile Screen
      - Add friends
      - (Update/PUT) Update user profile image 
   - Work Screen
       - (Read/GET) Countdown timer
   - Leaderboard
       - (Read/GET) Amount of time user's friends has accomplished  
       - (Read/GET) Query all scores where user is author
         ```swift
         let query = PFQuery(className:"Leaderboard")
         query.whereKey("author", equalTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (scores: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let scores = scores {
               print("Successfully retrieved \(scores.count) posts.")
           // TODO: Do something with posts...
            }
         }
