compareListValues := method(
    baseList, comparisonList,

    return (baseList first == comparisonList first) and \
            listsAreEqual(baseList slice(1), comparisonList slice(1))
)

listsAreEqual := method(
    baseList, comparisonList,

    baseListIsEmpty := baseList size == 0
    listSizeIsEqual := (baseList size == comparisonList size)

    return baseListIsEmpty or \
        (listSizeIsEqual and \
            compareListValues(baseList, comparisonList))
)

ioTest testSuite("Utils map") \
    test(
        "maps over a standard Io list",
        block(
            double := block(value, value * 2)
            
            testList := list(1, 2, 3, 4)
            expected := testList map(value, value * 2)
            result := Utils map(testList, double)

            // compareLists(testList, result, double)
            IoAssertion assertTrue(listsAreEqual(expected, result))
        )
    ) \
    test(
        "maps over a custom linked list",
        block(
            triple := block(
                value,
                value * 3
            )

            testList := LinkedList create() cons(4) cons(3) cons(2) cons(1)
            expected := testList map(triple)
            result := Utils map(testList, triple)

            IoAssertion assertTrue(expected equalTo(result))
        )
    )