# Hi there 👋:, i see you've been employed to work on flaury_mobile so lets dive into the code structure !

## Application Structure
After a successful build, your application structure should look like this:
```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - The most important folder in the application, used to write most of the Dart code.
    ├── main.dart                   - Starting point of the application
    ├── app
    |   ├── customer                - It contains the customer views, controllers. basically all that concerns the customers  
    |   ├── ServiceProvider         - It contains the serviceProvider views, controllers. basically all that concerns the serviceProviders
    |   ├── onboarding              - It contains the ui and logic associated with the user onboarding, so it is common to both customers and service providers
    ├── config                      - It contains all the necessarry app configs like 'appflavours'  
    ├── services                    - It contains network calls (api calls) and app interaction with external entities
    └── shared                      - It contains all custom widget shared by the application and it also has uitlities needed by the application in there too
```
## How to format your code?
  If your code is not formatted, then run the following command in your terminal to format the code
  ```
   dart format .
  ```
## How to resolve dependencies?
If you have issues with your dependencies, then run the following command in your terminal to resolve the issue
  ```
     flutter pub get --no-example
  ```
## Libraries and tools used
  riverpod for state management and for dependency injection. 

### yeah that's all,  😃: 😏: please have fun working on the project.   

  
