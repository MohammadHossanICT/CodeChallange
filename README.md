# CodeChallange
This is the example of using handling concurrency in swift (introduced 5.5) with async await. In previous version closure was the best choice but as the code and project grows, it loses the readability and testability.  This example demonstrate how much it is easy to handle the concurrency with async await with less code and increase the testability and readability with combine framework. Here I used the storyboard and coordinator to display the data form URL and determine which view will be tiggered based on the user action. The architecture pattern was followed MVVM-Coordinator. I used the following URL https://restcountries.com/v2/all to display the countries name and their currency into view. There are few commented codes kept for future reference, for instance to show the details of the particular record. In testing I created the unit testing with mock data to test the code is working according to the expectation.