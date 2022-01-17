class NotANAdultError
{
  final String rawValue;
  const NotANAdultError(this.rawValue);
  @override
  String toString()=> rawValue;

}

class AdultPerson{

  final String name;
  final int age;
  AdultPerson(this.name,this.age)
  {
    if(age<18)
    {
      throw NotANAdultError('Adult $name should be at least 18 years old instead of $age');

    }
  }

  @override
  String toString() => 'Person, name = $name, age = $age';
}


void testThisException()
{
  try {
    final notAnAdult = AdultPerson('Foo Bar', 17);
    print(notAnAdult);
  } on NotANAdultError catch(err, stt)
  {
    print('Error $err, stack trace = \n$stt');  
  }
}