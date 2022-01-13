class AnimalType{
  final String rawValue;
  const AnimalType(this.rawValue) :assert(rawValue.length > 0);

  static const dog = AnimalType('dog');
  static const cat = AnimalType('cat');

  static const parrot = AnimalType('parrot');


}

class Animal
{
  final String name;
  final AnimalType type;
  Animal(this.name,this.type);

  @override
  String toString()=>'$name,${type.rawValue}';
}

void testIt2()
{
  final foo = Animal('foo',AnimalType.cat);
  final bar = Animal('Bar',AnimalType.dog);
  final baz = Animal('baz',AnimalType.parrot);

  [foo,bar,baz].forEach(print);

}