ioTest testSuite("LinkedListNode cons") \
    test(
        "returns a new node when called",

        block(
            testList := LinkedListNode cons("foo")

            IoAssertion assertEqual("foo", testList head, "Test value was not stored correctly")
        )
    ) \
    test(
        "sets tail of new list to pointer of old list",

        block(
            originalList := LinkedListNode cons("bar")
            newList := originalList cons("foo")

            IoAssertion assertEqual(originalList, newList tail, "Original list is not properly appended to new list")
        )
    )