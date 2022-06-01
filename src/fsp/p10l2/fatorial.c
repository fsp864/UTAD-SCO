int fatorial(int n)
{ 
  int fact = 1;

  while ( n > 1 )
    fact *= n--;

  return fact;
}