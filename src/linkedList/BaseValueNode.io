BaseValueNode := Object clone do(
    value ::= nil
)

BaseValueNode exceptionMessage ::= ""

BaseValueNode setOnUninitialized := method(
    newValue,

    if(
        value == nil,
        setValue(newValue),
        Exception raise(exceptionMessage)
    )
)

BaseValueNode initialize := method(
    userValue,

    if(
        userValue == nil,
        newValue := Empty clone,
        newValue := userValue
    )

    setOnUninitialized(newValue)
)

BaseValueNode getValue := method(value)
BaseValueNode setAsEmpty := method(setOnUninitialized(Empty clone))
BaseValueNode isEmpty := method(Empty isEmpty(value))