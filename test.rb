# frozen_string_literal: true

def f
  print 'ok'
  loop do
    return 'ok'
    puts 'still going after return'
  end
end

a = f
puts
puts a
