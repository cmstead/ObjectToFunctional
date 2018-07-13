ioTest testSuite("LinkedListNode cons") \
    test(
        "returns a new node when called",

        block(
            testList := LinkedListNode cons("foo")

            IoAssertion assertEqual("foo", testList head, "Test value was not stored correctly")
        )
    ) \
    test(
        "raises exception when trying to overwrite stored value",

        block(
            testList := LinkedListNode cons("foo")

            testBlock := block(testList setValue("bar"))

            IoAssertion assertRaisesException(testBlock, "Cannot overwrite value in slot nodeValue", "Exception was not properly raised")
        )
    ) \
    test(
        "sets tail to nil if not called on a LinkedListNode instance",

        block(
            testList := LinkedListNode cons("bar")

            IoAssertion assertEqual(nil, testList tail, "Tail was not set to nil")
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