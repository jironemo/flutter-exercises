import 'dart:math';
import 'dart:io';
void main(){
  print("Problem 1:");
  problem1();
  print("=============Problem 1 End=============");
  print("Problem 2:");
  problem2();
  print("=============Problem 2 End=============");
  print("Problem 3:");
  problem3();
  print("=============Problem 3 End=============");
}

void problem1(){
  Random r = Random();
  List list = List.generate(100,(i) => r.nextInt(100)+1);
  print("Random List: $list");
  list.sort();
  print("Min value: ${list[0]}, Max value: ${list[list.length -1]}");
  print("Sorted List: $list");
}

void problem2(){
  List<int> list = List.generate(50,(i) => (i+1));
  for (int number in list) {
    if((number)%3 == 0 && (number) % 5 ==0) {
      print("FizzBuzz");
    } else if ((number) %5 == 0)
      print("Buzz");
    else if ((number) %3 == 0)
      print("Fizz");
    else print("$number");
  }
}

void problem3(){
  int answer = Random().nextInt(10)+1;
  String? number;
  do{
    print("Guess the random number between 1 and 10:");
    number = stdin.readLineSync();
  }while(number != answer.toString());
  print("You have guessed the number correctly!");
}