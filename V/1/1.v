import os

fn main() {
    filename := './aoc/1/i11.txt'

    data := os.read_file(filename) or {
        panic('error reading file $filename')
        return
    }
    //println(data.split('\n')[0])
	datalines := data.split('\n')

	nums := ['1','2','3','4','5','6','7','8','9','0'];

	mut sum := 0

	for lines in datalines {
		println(lines.split(''))
		chars := lines.split('')

		mut first := 0
		for ch in chars {
			if ch in nums {
				//println(ch)
				first = ch.int()
				break
			}
		}
		
		mut last := 0
		for ch in chars.reverse() {
			if ch in nums {
				//println(ch)
				last = ch.int()
				break
			}
		}

		println('${first} ${last}')

		sum = sum + (first*10 + last)
	}

	println(sum)
}