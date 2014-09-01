#WireWAX Studio Coding Guidelines 
**_Disobey at your peril_**

##CoffeeScript

- Only use Class constructor for run-time instantiated objects and inheritance:


    `new Model()`

    `DataSource extends BaseDataSource`

- Use '_' to denote a private methods and variables:


    `_myPrivateMethod: ->`
    
    `_my_private_var = 'shh'`


- Use underscores to separate property and variable names:


    `_my_private_variable`
    
    
    ```javascript
    who =
        first_name: 'Bruce'
        last_name: 'Wayne'
    ```   
    
    
##HTML

##File System

- All file names should be camelCased:


    `myFileName.less`
    
    `myController.coffee`

##CSS

###Selectors

- IDs should be camelCase:

    
   `#wwMyId`


- Classes should be hyphenated:

    
    `.ww-class-name`


- All selectors must be prefixed with ww:

    
    `.ww-class-name`
    
    `#wwClassName`
    
[https://help.github.com/articles/markdown-basics]
[https://help.github.com/articles/github-flavored-markdown]


