LinkedListNode := Object clone \
    do(
        nodeValue := nil
        nextNode := nil

        setOnEmpty := method(
            slotName, value,

            currentValue := self getSlot(slotName)

            if(
                Empty isEmpty(currentValue),
                self setSlot(slotName, value),
                Exception raise("Cannot overwrite value in slot #{slotName}" interpolate)
            )

            return self
        )

        isNodeProto := method(self == LinkedListNode)
        chooseNextNode := method(if(isNodeProto, nil, self))

    )

LinkedListNode init := method(
    nodeValue = Empty clone
    nextNode = Empty clone
)

LinkedListNode setValue := method(data, setOnEmpty("nodeValue", data))
LinkedListNode setNextNode := method(nextNode, setOnEmpty("nextNode", nextNode))


LinkedListNode cons := method(
    value,

    return LinkedListNode clone \
        setValue(value) \
        setNextNode(chooseNextNode())
)

LinkedListNode head := method(self nodeValue)
LinkedListNode tail := method(self nextNode)

LinkedListNode foreach := method(
    action,
    (
        action call(head)

        if(
            tail != nil,
            tail foreach(action)
        )
    )
)