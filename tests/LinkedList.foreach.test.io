ioTest testSuite("LinkedListNode foreach") \
    test(
        "applies action to a node in a single-node linked list",

        block(
            expectedValue := "First Value"

            newList := LinkedList create cons(expectedValue)

            actionSpy := SpyFactory build withArgs(list("nodeValue"))
            newList foreach(actionSpy)

            callCount := actionSpy getCallCount
            callArgument := actionSpy getArgsFromCall(0) at("nodeValue")

            callCountFailureMessage := "ActionSpy was called incorrect number of times; expected #{1} but got #{callCount}" interpolate
            failureMessage := "ActionSpy was called with incorrect value; expected #{expectedValue} but got #{callArgument}" interpolate

            IoAssertion assertEqual(1, callCount, callCountFailureMessage)
            IoAssertion assertEqual(expectedValue, callArgument, failureMessage)
        )
    ) \
    test(
        "applies action to all nodes in a linked list",

        block(
            expectedValue1 := "Value 1"
            expectedValue2 := "Value 2"
            expectedValue3 := "Value 3"

            newList := LinkedList create\
                cons(expectedValue1) \
                cons(expectedValue2) \
                cons(expectedValue3)

            actionSpy := SpyFactory build withArgs(list("nodeValue"))
            newList foreach(actionSpy)

            callCount := actionSpy getCallCount

            callArgument1 := actionSpy getArgsFromCall(0) at("nodeValue")
            callArgument2 := actionSpy getArgsFromCall(1) at("nodeValue")
            callArgument3 := actionSpy getArgsFromCall(2) at("nodeValue")

            callCountFailureMessage := "ActionSpy was called incorrect number of times; expected #{3} but got #{callCount}" interpolate

            failureMessage1 := "ActionSpy was called with incorrect value; expected #{expectedValue3} but got #{callArgument1}" interpolate
            failureMessage2 := "ActionSpy was called with incorrect value; expected #{expectedValue2} but got #{callArgument2}" interpolate
            failureMessage3 := "ActionSpy was called with incorrect value; expected #{expectedValue1} but got #{callArgument3}" interpolate

            IoAssertion assertEqual(3, callCount, callCountFailureMessage)
            IoAssertion assertEqual(expectedValue3, callArgument1, failureMessage1)
            IoAssertion assertEqual(expectedValue2, callArgument2, failureMessage2)
            IoAssertion assertEqual(expectedValue1, callArgument3, failureMessage3)
        )
    )
