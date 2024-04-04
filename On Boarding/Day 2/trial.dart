import 'dart:io';

void main(){
  print("Enter your number");
  var input = stdin.readLineSync();
  print(double.parse((input ?? '')));

  print("Enter your number");
  var input2 = stdin.readLineSync();
  print(double.parse((input2 ?? '')));

}