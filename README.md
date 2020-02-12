# Navigation App

● Fetch all sections returned from the API
● Save sections in local database 
● If you select a section, the app will send a request to get all details for this specific section, and will save it in our local data base.
● If the app is offline, there are two scenarios:
- If we have all data in our local data base , the app will display it .
- If not , the app will show a network error. 

# Tools

  - Xcode : v11.3.1
  - Swift : v5
  - CocoaPods

# Libraries used in the project

- [SQLite.swift](https://github.com/stephencelis/SQLite.swift)

# Things to improve

-  Implement [MVVM+Router architecture](https://medium.com/rosberryapps/the-flexible-routing-approach-in-an-ios-app-eb4b05aa7f52) instead of MVVM
-  Use mocks to create "fake" versions of the objects to verify the mapping without relying on networking  calls.
- Add unit tests  for all classes
- Improve the offline mode
