# YelpFinder

`author Ricardo Rodriguez rrodriguezgarcia@gmail.com`
Yelp Finder is an application that uses Yelp Fusion API to retrieve information of businesses.
The app has simple layout:

- A Search View to find a specific business
- View to show Business Detail

## Technologies

- Swift
- SwiftUI
- Combine

## Approaches

- Avoiding several requests to Server
  - Debounce: When user types in search textfield, the app will wait for 0.5 seconds to process the new search.
  - Cache Storage:
    - Everytime user sends a requests it will be evaluated if there is a cache for it, if not, then it will be sent to server to retrieve new fresh data.
    - Data stored in Cache has an expiration time of 1 hour.
