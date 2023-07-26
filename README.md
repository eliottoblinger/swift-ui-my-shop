# 🌐 MyShop - SwiftUI Project

Welcome to MyShop, an e-commerce application built using SwiftUI. This project serves as a demonstration of various SwiftUI features and best practices, including dependency injection with the Factory package, the usage of EnvironmentObject, the beginnings of a Clean Architecture, API calls, conditionally displaying sheets, utilizing popovers, implementing TabView, integrating checkboxes and toggles and using the Kingfisher library.

## Project Description

MyShop is a feature-rich e-commerce application that empowers users to browse and discover a wide range of products sourced from a remote API. Key functionalities of MyShop include:

- **Product Retrieval:** The app connects to an external API to fetch a diverse selection of products and their details.

- **Sorting and Filtering:** Users can sort products based on various attributes such as price and name. Additionally, convenient filters are available to narrow down product searches.

- **Favorites:** Users have the option to mark products as favorites, making it easy to revisit and keep track of preferred items.
  
## What I Learned

In this project, I had the opportunity to explore and implement the following concepts and features:

1. **Dependency Injection with Factory Package:** To achieve decoupling and testability, I integrated the Factory package for dependency injection. This allowed me to manage and provide dependencies efficiently throughout the app.

2. **Principle of EnvironmentObject:** I leveraged SwiftUI's EnvironmentObject to manage global application state, enabling seamless sharing of data across multiple views and improving data flow.

3. **Beginning of Clean Architecture:** In pursuit of a maintainable and scalable project, I initiated the implementation of Clean Architecture principles. Separating business logic from UI components allowed for better organization and a clearer project structure.

4. **API Calls:** MyShop utilizes API calls to fetch product data from a remote server. I used SwiftUI's built-in networking capabilities to interact with the API and handle responses effectively.

5. **Conditionally Displaying Sheet:** I implemented the ability to display a sheet conditionally, enabling users to view additional details or perform specific actions based on context.

6. **Utilizing Popover:** Popovers were integrated into the app to present additional information or options in a non-intrusive manner.

7. **Using TabView:** To enhance user experience, I incorporated a TabView to navigate between different sections of the application seamlessly.

8. **Integration of Checkbox and Toggle:** The app features the use of checkboxes and toggles, providing users with options for filtering and managing favorite products.

9. **Kingfisher Image Loading:** I learned how to use the Kingfisher library, which allowed me to download images asynchronously and efficiently cache them. This optimization enhances the app's performance and reduces redundant image downloads.

## Demo

<video src="demo.mp4"/>
