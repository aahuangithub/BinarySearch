private Item[] store = 
{
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
};  

//these functions should return how much inventory of a certain catNum there is                           
public int linearSearch(int catNumToFind)
{
  for(Item item:store)
    if(item.getCatNum()==catNumToFind)
      return item.getInventory();
  return -1;
}
public int recursiveLinearSearch(int catNumToFind, int startIndex)
{
  if(startIndex==store.length)
    return -1;
  if(store[startIndex].getCatNum()==catNumToFind)
    return store[startIndex].getInventory();
  return recursiveLinearSearch(catNumToFind, startIndex+1);
}
public int binarySearch(int catNumToFind)
{
  int startIndex=0;
  int endIndex=store.length-1;
  while(startIndex<endIndex){
    int revealed=store[(startIndex+endIndex)/2].getCatNum();
    if(revealed==catNumToFind)
      return store[(startIndex+endIndex)/2].getInventory();
    else if(revealed>catNumToFind)
      endIndex=(startIndex+endIndex)/2;
    else if(revealed<catNumToFind)
      startIndex=(startIndex+endIndex)/2+1;
  }
  if(store[startIndex].getCatNum()==catNumToFind) 
    return store[startIndex].getInventory();
  return -1;
}
public int recursiveBinarySearch(int catNumToFind, int nLow, int nHigh)
{
  int guess=(nLow+nHigh)/2;
  if(store[guess].getCatNum()==catNumToFind) return store[guess].getInventory();
  if(nLow>=nHigh) return -1;
  if(store[guess].getCatNum()<catNumToFind) return recursiveBinarySearch(catNumToFind, guess+1, nHigh);
  return recursiveBinarySearch(catNumToFind, nLow, guess-1);
}
public void setup(){
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};

  System.out.println();
  System.out.println("Testing Non-Recursive Linear Search");
  System.out.println("=====================");
  for (int test:tests){
    if (linearSearch(test) != -1)
      System.out.println("Catalog #"+test+" has "+linearSearch(test) + " in stock");
    else
      System.out.println("Catalog #"+test+" not found");
  }

  System.out.println();
  System.out.println("Testing Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++){
    if (recursiveLinearSearch(tests[i],0) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveLinearSearch(tests[i],0) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }

  System.out.println();
  System.out.println("Testing Non-Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++){
    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++){
    if (recursiveBinarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveBinarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}







