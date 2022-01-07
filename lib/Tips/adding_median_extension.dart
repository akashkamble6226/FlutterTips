

extension   Median<T extends num> on List<T>
{
  double get median 
  {
    switch(length)
    {
      case 0:
            return 0.0;
      case 1:
            return this[0].toDouble(); 

      default:
            final sorted = [...this]..sort();
            final middleIndex = length ~/2;
            if(length % 2 == 0)
            {
              return (sorted[middleIndex] + sorted[middleIndex - 1]) /2.0;
            }
            else
            {
              return  (sorted[middleIndex].toDouble());
            }
    }
  }
}

const emptyList = <int>[];
const oneInteger = [7];
const twoInteger = [5,7];
const threeInteger = [3,5,7];
const fourInteger = [1,3,5,7];



void testIt()
{
  // ignore: avoid_print
  print(emptyList.median);

  // ignore: avoid_print
  print(oneInteger.median);

  // ignore: avoid_print
  print(twoInteger.median);

  // ignore: avoid_print
  print(threeInteger.median);

  // ignore: avoid_print
  print(fourInteger.median);

  
}