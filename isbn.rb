def isbn_dash(num)
    num = num.tr('-', '')
    num = num.tr(' ', '')
    num5 = num.gsub(/[^0-9xX]/, '')
    num5
end

def funk_master(num)
    num2 = isbn_dash(num)
    chek = num2.length
    if chek > 10
        num2 = isbn_13(num2)
    elsif chek == 10
        num2 = isbn_10(num2)
    else
        return false
    end
    num2
end

def isbn_10(num2)
    
    num3 = num2.split('')
    if num3.last.downcase == "x"
        num3.pop
        num3 << "10" 
    end
    

    # num3.each do |n|
    #     if n.to_i != Integer
    #         return false
    #     end
    # end
    counter = 10
    check_arr = []
    num3.each.with_index(1) do |n, index|
        chk = n.to_i*counter
        counter -= 1
        check_arr << chk
    end
    check_num = check_arr.sum
    check_num = check_num % 11
    check_num
    if check_num == 0
       return true
    else
        return false
    end
    
end

def isbn_13(num2)
    num3 = num2.split('')
    var = num3.pop
    teen_arr = []
    num3.each.with_index(1) do |n, index|
        if index.even?
            v = n.to_i*3
            teen_arr << v
        else 
            m = n.to_i*1
            teen_arr << m
        end                
    end
    check = teen_arr.sum
    check %= 10
    check = 10 - check
    check
    if check.to_s.length == 2
        check %= 10
    end
    if check.to_s == var
        return true
    else
        return false
    end
end