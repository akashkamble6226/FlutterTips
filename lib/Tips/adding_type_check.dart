void doThis()
{
  const array = <dynamic>[1,2,"hello",3];
  final integers = array.whereType<int>();
  print(integers);
}

// circular progress 
