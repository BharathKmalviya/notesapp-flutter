// for
List<int> numbers = [1, 2, 3];

void iterateNumbers() {
  for (int i = 0; i < numbers.length; i++) {
    print(numbers[i]);
  }

  for (int i in numbers) {

  }

  numbers.forEach((element) {
    print(element);
  });
}

// while, do while

void whileLoop(){
  int i=0;
  while(i>=numbers.length){
    print(i);
    i++;
    break;
  }

  i=0;
  do{
    print(numbers[i]);
    if(i==1){
      break;
    }
  }while(i>=numbers.length);
}

// if
// if else
// if else elseif
// switch