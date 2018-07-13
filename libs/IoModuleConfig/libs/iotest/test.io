packageConfig := IoTestPackageConfig clone
packageConfig development call()

cwd := PathUtil getSearchPathByDirName(packageConfig name)

IoTestRunnerFactory \
    buildRunner() \
        setCwd(cwd) \
        setTestExtension(".test") \
        addTestPath("tests") \
        run()