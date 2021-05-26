const collapeConsecutiveValues = (str = '') => {
	if (str.length === 0) return ''

	str = str
		.split('')
		.filter((item) => {
			return /[a-zA-Z]/.test(item)
		})
		.join('')

	const strArray = str.match(/([a-zA-Z])\1*/g).map((item) => {
		if (item.length === 1) return item
		return item[0] + item.length
	})

	return strArray.join('')
}

// test cases:
// 1. `aaabccccdd` → `a3bc4d2`
console.log(collapeConsecutiveValues('aaabccccdd'))
// 2. `aaaaaffffffffffc` → `a5f10c`
console.log(collapeConsecutiveValues('aaaaaffffffffffc'))
// 3. `abcd` → `abcd` (note: not `a1b1c1d1`)
console.log(collapeConsecutiveValues('abcd'))
// 4. `ccceee12eccceee` → `c3e4c3e3` (numbers removed)
console.log(collapeConsecutiveValues('ccceee12eccceee'))
// 5. `effeac01cb65c` → `ef2eac2bc`
console.log(collapeConsecutiveValues('effeac01cb65c'))
// edge case
console.log(collapeConsecutiveValues(''))
