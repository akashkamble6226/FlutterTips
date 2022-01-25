enum AnimalType { dog, cat, rabbit, turtle }

extension ToString on AnimalType {
  String get string => toString().split('.').last;
}

void test()
{
  print(AnimalType.dog.string); // will print dog 

}
