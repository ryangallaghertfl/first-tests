def make_snippet(string)
    array = string.split(/ /)
    if array.length < 6
        newstring = array.join(" ")
        return newstring
    else
        array = array.slice(0,5)
        newstring = array.join(" ")
        return newstring + "..."
    end
end

puts make_snippet("hello my name is Ryan Gallagher")