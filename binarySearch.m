function x = binarySearch(a,b,sign,f)
notFound = true;
while(notFound)
    x = (a+b)/2;
    notFound = sign*f(x) < 0;
end