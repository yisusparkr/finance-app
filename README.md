# Finance App 📱💲
Finance App was made as technical test using Flutter framework 💙.

## Run the app
After download the project as .zip or after clone, is necessary to open the project in your prefered IDE and then open the puspec.yaml archive and get the packages just pressing `CTRL + S` or writting `pub get` in the terminal, then just run the app.

## Screens
At the moment this app have around 5 screens with different functions.

### Sign in screen
This screen is used to enable the user write his login data.

<img src="https://user-images.githubusercontent.com/43246999/140766684-27b4cbec-55f5-44d9-89c8-45647e205629.png" width="350" height="600" />

### Sign up screen
Allows the user to create an account.

<img src="https://user-images.githubusercontent.com/43246999/140766835-07e03e7c-b11a-4c7e-a110-e1c6db2cd620.png" width="350" height="600" />

### Home screen
This screen just show two buttons, allowing the user to navigate to History screen or just sign out.

<img src="https://user-images.githubusercontent.com/43246999/140767252-a01c246f-18ca-4931-b16f-79696b638423.png" width="350" height="600" />

### Finance types screen
It show three buttons with different currencys.

<img src="https://user-images.githubusercontent.com/43246999/140767419-51f23f20-425f-4ea0-9732-f9c786d8fa6d.png" width="350" height="600" />

### Finance data screen
This screen show the entire data of the selected currency.

<img src="https://user-images.githubusercontent.com/43246999/140771003-83d9daa6-4a52-4c14-99ac-5c6ea9175d7e.png" width="350" height="600" />

## Packages used
This app use different packages to improve the development time:<br>
1. [animate_do](https://pub.dev/packages/animate_do)
2. [cloud_firestore](https://pub.dev/packages/cloud_firestore)
3. [dio](https://pub.dev/packages/dio)
4. [equatable](https://pub.dev/packages/equatable)
5. [firebase_auth](https://pub.dev/packages/firebase_auth)
6. [flutter_bloc](https://pub.dev/packages/flutter_bloc)
7. [firebase_core](https://pub.dev/packages/firebase_core)
8. [fl_chart](https://pub.dev/packages/fl_chart)
9. [line_icons](https://pub.dev/packages/line_icons)
10. [lottie](https://pub.dev/packages/lottie)

## State management
As state management was used [BLoC](https://pub.dev/packages/flutter_bloc) with [Equatable](https://pub.dev/packages/equatable) allowing the application to be fully scalable.

## APIs used
To fulfill the app requeriments different APIs are used:

1. [RFC Verifier API](https://rapidapi.com/manuelmhtr/api/verifier/)
2. [Yahoo Finance API](https://www.yahoofinanceapi.com/)
