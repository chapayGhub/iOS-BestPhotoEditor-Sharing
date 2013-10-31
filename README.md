iOS-BestPhotoEditor
===================

Here is the code that demonstrate how to share your Photo/Image with "Best Photo Editor" app from your application like Instagram.


Getting Started 
===================

Run the following commands to get local copy:

$ git clone --recursive https://github.com/glaretechnology/iOS-BestPhotoEditor-Sharing.git


Setup 
===================

- ### Custom URL Scheme

 `bestphotoeditor://` will open our app.


##### Example

```
 NSURL *instagramURL = [NSURL URLWithString:@"bestphotoeditor://"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
    }
```

### abc

You can use the [Document Interaction API](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDocumentInteractionController_class/Reference/Reference.html) to open your photo in <b>[Best Photo Editor](https://itunes.apple.com/us/app/best-photo-editor-photoshop/id582695799?mt=8)</b> for editing and you can also share photo to social networks.



Requirements 
===================

Requires either iOS 5.0 and above.


Contact us 
===================

For more queries or help, you can reach to us at support@glaretechnology.com