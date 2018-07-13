LibPath addPathWithBaseByDirName("ObjectToFunctional", "libs/IoModuleConfig")

ObjectToFunctionalPackage := ModuleConfig clone \
    do(
        setName("ObjectToFunctional")
        setVersion("1.0.0")

        initializeModuleLoader()
    )

ObjectToFunctionalPackage init := method(
    prodConfig(block(
        moduleLoader \
            addSearchPath("src") \
            configure()
    ))

    devConfig(block(

    ))
)