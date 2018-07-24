LinkedListNode := Object clone \
    do(
        valueNode := nil
        nextNode := nil

        getTailNode := method(
            isNodeProto := (self == LinkedListNode)

            return if(
                isNodeProto,
                getEmptyNode(),
                self
            )
        )
    )

LinkedListNode isNotEmpty := method((valueNode isEmpty) == false)

LinkedListNode init := method(
    valueNode = ValueNode clone
    nextNode = NextNode clone
)

LinkedListNode initialize := method(
    value, tailNode,

    valueNode initialize(value)
    nextNode initialize(tailNode)

    return self
)

LinkedListNode getEmptyNode := method(
    return LinkedListNode clone initialize()
)

LinkedListNode cons := method(
    value,

    tailNode := getTailNode()

    return LinkedListNode clone initialize(value, tailNode)
)

LinkedListNode head := method(self valueNode getValue)
LinkedListNode tail := method(self nextNode getValue)

LinkedListNode foreach := method(
    action,

    nextAction := block(
        action call(head)
        tail foreach(action)
    )

    if(isNotEmpty, nextAction call)

    return self
)

LinkedListNode map := method(
    transformation,

    mapAndCons := block(
        transformedValue := transformation call(valueNode getValue)
        tail \
            map(transformation) \
            cons(transformedValue)
    )

    return if(
        isNotEmpty,
        mapAndCons call,
        getEmptyNode()
    )
)