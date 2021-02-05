# iOSMVPSample
MVP Architecture  in iOS Project with Swift

Then MVP architecture comes to improve this situation. by adding the main component which is Presenter

Now the viewController is considered as a view. which means it will include only the view related code, nothing more. and all logic will be implemented in the presenter.
Then components description becomes as the following :
View : The view now consists of both views and view controllers, with all UI setup and events.
Presenter : The presenter will be in charge of all the logic , including responding to user actions and updating the UI (via delegate). and the most important is that our presenter will not be UIKit dependent. which means well isolated, hence easily testable ;)
Model : the model role will be exactly the same


