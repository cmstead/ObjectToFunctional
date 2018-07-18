LinkedListNode := Object clone \
    do(
        nodeValue := nil
        nextNode := nil

        setOnUninitialized := method(
            slotName, value,

            currentValue := self getSlot(slotName)

            if(
                currentValue == nil,
                self setSlot(slotName, value),
                Exception raise("Cannot overwrite value in slot #{slotName}" interpolate)
            )

            return self
        )

        isNodeProto := method(self == LinkedListNode)
        isNotEmpty := method((Empty isEmpty(nodeValue)) == false)
        isUninitialized := method((nodeValue == nil) or (nextNode == nil))

        callOnNotEmpty := method(
            actionBlock,

            if(
                isNotEmpty,
                actionBlock call()
            )
        )
    )

LinkedListNode initializeEmpty := method(
    setOnUninitialized("nodeValue", Empty clone)
    setOnUninitialized("nextNode", Empty clone)
)

LinkedListNode initializeWithValues := method(
    value, tailNode,

    setOnUninitialized("nodeValue", value)
    setOnUninitialized("nextNode", tailNode)
)

LinkedListNode initialize := method(
    value, tailNode,

    if(
        (value == nil) or (tailNode == nil),
        initializeEmpty,
        initializeWithValues(value, tailNode)
    )

    return self
)

LinkedListNode getEmptyNode := method(
    return LinkedListNode clone initialize()
)

LinkedListNode cons := method(
    value,

    tailNode := self

    if(
        isNodeProto(),
        tailNode = getEmptyNode()
    )

    return LinkedListNode clone initialize(value, tailNode)
)

LinkedListNode head := method(self nodeValue)
LinkedListNode tail := method(self nextNode)

LinkedListNode foreach := method(
    action,
    callOnNotEmpty(block(
        action call(head)
        tail foreach(action)
    ))

    return self
)

LinkedListNode map := method(
    transformation,

    return if(
        isNotEmpty,
        tail map(transformation) cons(transformation call(nodeValue)),
        getEmptyNode()
    )
)