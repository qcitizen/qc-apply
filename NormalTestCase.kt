class NormalTestCase: TestCase {
    override fun test() {
        val tests = mapOf(
            "aaabccccdd" to "a3bc4d2",
            "aaaaaffffffffffc" to "a5f10c",
            "abcd" to "abcd",
            "ccceee12eccceee" to "c3e4c3e3",
            "effeac01cb65c" to "ef2eac2bc"
        )
        var passed = 0

        println("NormalTestCase begin")
        tests.forEach { k, v ->
            val result = QuantifiedCitizen.compress(k)

            if (result == v) {
                passed++
                println("Passed")
            } else {
                println("Failed - Input($k) Output($result) Expect($v)")
            }
        }
        println("Total passed $passed of ${tests.size}")
        println("NormalTestCase end")
    }
}