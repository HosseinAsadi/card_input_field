## card_input_field
16 inputs field like bank card number for enter your card number

![](https://github.com/HosseinAsadi/card_input_field/blob/master/assets/1.jpeg)

## Usage

## Import this line in Flutter pubspec
```dart
card_input_field: <Last Version>
```
## TO Use
```dart
import 'package:card_input_field/card_input_field.dart';
```

After import library

##
```dart
CardInputField cardInput = CardInputField();
```

After into a Widget like below use it


```dart
Center(child: cardInput)
```

and for read value of fields into onTap or onPressed a button

```dart
onTap: (){
    cardInput.controllers.forEach((element) {
        print(element.text);
    });
}
```

or set a value into a field
```dart
onTap: (){
    cardInput.controllers[0].text = '4';
}
```

## and do not forget

```dart
@override
void dispose() {
    /// number of controllers is 16
    cardInput.controllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
}
```


It is very simple to use, you can see main file into git repository


This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
