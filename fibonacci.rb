

def fibs(n)
  
  prev = 0
  current = 1
  result = []
   
  n.times do
    fib = prev + current
    prev, current = current, fib
    result << fib
  end
  result
end


def fibs_rec(n)
n < 2 ? n : fibs_rec(n-1) + fibs_rec(n-2)
end

puts fibs(5)

puts fibs_rec(7)