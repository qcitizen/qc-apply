class QuantifiedCitizen {
    companion object {
        fun compress(input: String): String {
            val purify = input.replace("[0-9]+".toRegex(), "")
            val sb = StringBuffer()
            var i = 0
    
            while (i <= purify.lastIndex) {
                var count = 0
                val ch = purify[i]
    
                while (i <= purify.lastIndex && purify[i] == ch) {
                    count++
                    i++
                }
    
                if (count > 1) {
                    sb.append("$ch$count")
                } else {
                    sb.append(ch)
                }
            }
    
            return sb.toString()
        }
    }
}