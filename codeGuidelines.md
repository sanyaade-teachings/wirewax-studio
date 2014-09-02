#WireWAX Studio Coding Guidelines 
**_Disobey at your peril_**

##CoffeeScript

- Only use Class constructor for run-time instantiated objects and inheritance:
    
    ```javascript
    new Model()

    DataSource extends BaseDataSource
    ```
    
- Use '_' to denote a private methods and variables:

    ```javascript
    _myPrivateMethod: ->
    
    _my_private_var = 'shh'
    ```

- Use underscores to separate property and variable names:


    ```javascript
    _my_private_variable`
    ```
    
    
    ```javascript
    who =
        first_name: 'Bruce'
        last_name: 'Wayne'
    ```   

##Angular Modules

  - **Definitions**: Declare modules using the setter and getter syntax

    ```javascript
    // avoid
    var app = angular.module('app', []);
    app.controller();
    app.factory();

    // use
    angular
      .module('app', [])
      .controller()
      .factory();
    ```  

  - **Methods**: Pass functions into module methods rather than assign as a callback

    ```javascript
    // avoid
    angular
      .module('app', [])
      .controller('MainCtrl', function MainCtrl () {

      })
      .service('SomeService', function SomeService () {

      });

    // use
    function MainCtrl () {

    }
    function SomeService () {

    }
    angular
      .module('app', [])
      .controller('MainCtrl', MainCtrl)
      .service('SomeService', SomeService);
    ```

  - This aids with readability and reduces the volume of code "wrapped" inside the Angular framework

##Angular Controllers    
    
      - **controllerAs syntax**: Controllers are classes, so use the `controllerAs` syntax
    
        ```html
        <!-- avoid -->
        <div ng-controller="BatmanCtrl">
          {{ skills }}
        </div>
    
        <!-- use -->
        <div ng-controller="BatmanCtrl as Batman">
          {{ Batman.skills }}
        </div>
        ```
    
      - Don't forget to capitalise, it's a Class!
    
      - The `controllerAs` syntax uses binds `$scope` to `this` inside controllers,
    
        ```javascript
        // avoid
        function BatmanCtrl ($scope) {
          $scope.weapons = {};
          $scope.dropSmokeBommb = function () {
    
          };
        }
    
        // user
        function BatmanCtrl () {
          this.weapons = {};
          this.dropSmokeBommb = function () {
    
          };
        }
        ```
    
      - Only use `$scope` with `controllerAs` when necessary; for example, publishing and subscribing events using `$emit`, `$broadcast`, `$on` or `$watch`.

## Unit Tests    
    
##HTML

##File System

- All file names should be camelCased:


    ```javascript
    myFileName.less
    
    myController.coffee
    ```
##CSS


###Selectors

- IDs should be camelCase:

   ```javascript 
   #wwMyId
   ```


- Classes should be hyphenated:

    
    ```javascript
    .ww-class-name
    ```


- All selectors must be prefixed with ww:

    ```javascript
    .ww-class-name
    ```
    
    ```javascript
    #wwClassName
    ```
    
[https://help.github.com/articles/markdown-basics]
[https://help.github.com/articles/github-flavored-markdown]


