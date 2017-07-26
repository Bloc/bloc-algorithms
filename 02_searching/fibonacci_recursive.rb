def fib(n)
  if (n == 0)
    # #1
    return 0
  elsif (n == 1)
    # #2
    return 1
  else
    # #3
    return fib(n-1) + fib(n-2)
  end
end

# Commented out, but this is a better recursive solution:
#
# def fib(n)
#   return 0 if n == 0
#   return 1 if n == 1
#   get_fib(0, 1, n)
# end
#
# def get_fib(fib_0, fib_1, n)
#   return fib_1 if n < 0
#   next_num = fib_1 + fib_0
#   get_fib(fib_1, next_num, n - 1)
# end
