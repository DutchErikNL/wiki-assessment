
# ABN AMRO iOS assignment Erik Brandsma

![ABN AMRO logo](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAGSouxoo2C7lnAmouNdDBCMTNsD91LAb_xw&s)

## Tooling
Made using Xcode 26.1.1 (17B100).
[Apple Silicon - Download Xcode 26.1.1 (17B100) here](https://download.developer.apple.com/Developer_Tools/Xcode_16/Xcode_16.xip)
[Universal - Download Xcode 26.1.1 (17B100) here](https://download.developer.apple.com/Developer_Tools/Xcode_26.1.1/Xcode_26.1.1_Universal.xip)

## Test app project properties

 - Runs on iOS 16.6 and above (Same as the Wikipedia app)
 - Uses the "Clean" architecture
 - Uses SwiftUI for the UI
 - Is fully Swift Concurrency safe by making use of actor, @MainActor, async/await and Tasks
 - Is fully accessibility compatible:
     - Grouping of children to make voiceover elements logical to visually impaired users
     - Understandable accessibility labels
     -      Dark mode compatibility
     - Verified by automatic UITest accessibility audits that check:
         - Contrast
         - Scaling text
         - Hitboxes
         - Text descriptions
         - Text clipping
 - Is fully localized for English and Dutch, depending on your device language, you'll get one of those.
    
## How to run

 1. Open WikiAssignment.xcworkspace
 2. Run the "Wikipedia (Modified)" scheme to put the modified Wikipedia app on your device / simulator
 3. Run the "WikiPlaces" app to put the test "Places" app on your device / simulator
 4. Open the modified Wikipedia app and go to the "Places" tab. You'll see 2-3 tutorials and popups, tap those away. After this close the Wikipedia app fully
 5. Open the test "Places" app.
 6. Tap a custom location --> The Wikipedia app opens on that location!

## How to run automatic test
1. Select the "WikiPlaces" scheme 
2. Long press the "Run" button until a dropdown appears
3. Select "Test", this should run:

- Unit tests for "DomainLayer", "DataLayer" and "WikiPlaces"
- Automatic UITest accessibility audits (See WikiPlacesAccessibilityUITests.swift). Tip: Open your simulator to see the audit being performed.

## In conclusion
I loved working on this assignment, and spent some time on it. It was a cool one, especially modifying the Wikipedia app was a cool challenge!

Thank you for the consideration.
Erik
