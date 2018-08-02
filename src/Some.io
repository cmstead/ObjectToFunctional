Some := Object clone do(
    value := nil

    valueIsMappable := method(
        return (value getSlot("map") type) == "Block"
    )

    getValueTransformation := method(
        transformation,

        if(
            valueIsMappable,
            block(value map(transformation)),
            block(transformation call(value))
        )
    )
)

Some isSome := method(value, (value type) == "Some")

Some setValue := method(
    newValue,

    if(
        value == nil,
        value = newValue,
        Exception raise("Cannot overwrite existing Some value")
    )

    return self
)

Some getValue := method(value)

Some create := method(newValue, Some clone setValue(newValue))

Some map := method(
    transformation,

    exception := try(
        newValue := getValueTransformation(transformation) call
        result := Some clone setValue(newValue)
    )

    exception catch(
        result := None clone
    )
    

    return result
)