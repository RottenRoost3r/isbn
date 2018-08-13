def isbn_dash(num)
    num.to_s
    num = num.tr('-', '')
    num = num.tr(' ', '')
    num
end
    
