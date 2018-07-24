BaseNode := Object clone do(
    value ::= nil
)

BaseNode exceptionMessage ::= ""

BaseNode setOnUninitialized := method(
    newValue,

    if(
        value == nil,
        setValue(newValue),
        Exception raise(exceptionMessage)
    )
)

BaseNode initialize := method(
    userValue,

    if(
        userValue == nil,
        newValue := Empty clone,
        newValue := userValue
    )

    setOnUninitialized(newValue)
)

BaseNode getValue := method(value)
BaseNode setAsEmpty := method(setOnUninitialized(Empty clone))
BaseNode isEmpty := method(Empty isEmpty(value))