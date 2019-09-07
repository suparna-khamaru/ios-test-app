# Welcome to "XCUITest - UI Test Framework in Swift"

The UI Test Automation Framework used in this sample project has the following prime compositions:

## 1. BaseClass
- extends **XCTestCase** class of XCTest framework
- serves as the universal Base Class to the entire UI Test framework
- All tests in the UI Test project shall follow the commands mentioned in BaseClass 
- Invokes the following methods: 
  - setUp() 
  - tearDown()

## 2. TestClass
- extends the above mentioned **BaseClass**
- consists of tests 

Each test follow **Fluent Page Object Model design Pattern**:

     func testCalculateSum() {
        let calculateScreen = CalculateScreen(app)
        
        calculateScreen
            .enter(number: two, in: calculateScreen.firstTextField)
            .enter(number: five, in: calculateScreen.secondTextField)
            .tapOn(button: calculateScreen.computeButton)
        
        XCTAssertEqual(seven, calculateScreen.actual)
     }


## 3. TestData enum
- Test Data management is essential in any test framework 
- Agenda is to have all the test data in one place for better reuse 

      enum TestData {
         static let one = 1
      } 

  
## 4. UniqueId enum
- Accessibility Identifiers
- Intention is to use the same accessibility identifiers in dev code and test code for all the elements

       enum UniqueId {
          static let computeButton = "ComputeSumButton"
       }

## 5. LandingPageElements class
- lists down all the elements in one place to avoid test code duplication & thus improves better reusability.

    
    `lazy var computeButton = app.buttons[UniqueId.computeButton].firstMatch`

    `lazy var actual = Int(app.staticTexts[UniqueId.answerLabel].firstMatch.label)`


## 6. UIStatus enum 
- Wait for different kind of actions

## 7. CalculateScreen class
- basis of page objects
- consists of optimised test code 
- concentrates on reusability 
- helps in achieving fluent interface 

**Non Optimised:**

    func calculateSum(firstNumber: Int, secondNumber: Int) {
        firstTextField.tap()
        firstTextField.typeText(String(firstNumber))
        secondTextField.tap()
        secondTextField.typeText(String(secondNumber))
        computeButton.tap()
    }

**Optimised:** 

    func enter(number: Int, in field: XCUIElement) -> Self {
        field.tap()
        field.typeText(String(number))
        return self
    }
    
    func tapOn(button: XCUIElement) {
        expect(element: button, status: .hittable, withIn: 20)
        button.tap()
    }





## ios-test-app

[![Greenkeeper badge](https://badges.greenkeeper.io/appium/ios-test-app.svg)](https://greenkeeper.io/)

A simple test application for iOS, used by [Appium](https://github.com/appium/appium) for certain tests.

### Building

`npm install` will build the app for a simulator. If you want also to build for
a real device, set the environment variable `IOS_REAL_DEVICE` or `REAL_DEVICE`
to a truthy value.

```
REAL_DEVICE=1 npm install
```

If any special build information is needed, the `XCCONFIG_FILE` environment
variable can be set to the path to an `xcconfig` file.

## Watch

```
npm run watch
```

## Test

```
npm test

```
