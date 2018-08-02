Utils := Object clone

Utils map := method(
    mappable, transformation,

    return if(
        (mappable type) == "List",
        mappable map(value, transformation call(value)),
        mappable map(transformation)
    )
)