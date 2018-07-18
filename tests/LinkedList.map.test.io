ioTest testSuite("LinkedList map") \
    test(
        "maps over empty list",
        
        block(
            emptyList := LinkedList create()
            mappedList := emptyList map(block(a, a))

            IoAssertion assertTrue(Empty isEmpty(mappedList head), "Empty list does not return an empty list")
        )
    ) \
    test(
        "returns new list",

        block(
            emptyList := LinkedList create()
            mappedList := emptyList map(block(a, a))

            IoAssertion assertNotEqual(emptyList, mappedList, "Map returns same list")
        )
    ) \
    test(
        "maps over list containing a single value",

        block(
            listUnderTest := LinkedList create() cons(5)
            mappedList := listUnderTest map(block(a, a * 3))

            IoAssertion assertEqual(15, mappedList head, "Map did not apply transformation correctly")
        )
    ) \
    test(
        "maps over list containing multiple values",

        block(
            originalValues := list(5, 4, 3, 2, 1)
            currentIndex := originalValues size - 1

            listUnderTest := LinkedList create()

            originalValues foreach(
                currentValue,
                listUnderTest = listUnderTest cons(currentValue)
            )

            mappedList := listUnderTest map(block(a, a * 3))
            
            mappedList foreach(block(
                value,

                expectedValue := originalValues at(currentIndex) * 3
                currentIndex = currentIndex - 1

                failureMessage := "Expected #{expectedValue} after mapping, but got #{value}" interpolate

                IoAssertion assertEqual(expectedValue, value, failureMessage)
            ))
        )
    )