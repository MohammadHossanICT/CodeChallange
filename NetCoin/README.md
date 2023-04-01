# NetCoin

Application created to demonstrate my expertise in Swift and iOS development. 
The NetCoin application displays list of 100 crypto currencies order by market cap. Coin are list along with price movement in percentage over the past 24hr.
This NetCoin mini project created in SwiftUI that uses the reactive programming framework Combine and MVVM architecture.
Api data is fetched using an Async await method that returns a tuple of arrays.
This project also include Unit tests for view model and number formatters.


## Home Screen
On the start of app you should see this screen:

![MacDown Screenshot](https://snipboard.io/DwTXqH.jpg)

## Top Movers 
Shows a scrollable list of the top 8 coin the have the highest price percentage increase over the past 24hr

### Navigation Bar
Includes title. The right side arrow navigates to the user portfolio.
On the right is an icon that will display user account information including sign out button.


## Portfolio Screen
Portfolio should look like this: 

![MacDown Screenshot](https://snipboard.io/7o0Q4T.jpg)

This screen allows the user to view a list of personally select coins or personal coin portfolio.
The "+" option in the top left corner will allow the user to add more coins to their portfolio list

## Search Bar

![MacDown Screenshot](https://snipboard.io/dXLgcS.jpg)

This search feature allows the user to filter the list by name or symbol
The All coins list response dynamically to search bar input values

## Summary 
I wrote his application in a few hours there is a lot more functionality I would have liked to add for example the user portfolio and info features. 
