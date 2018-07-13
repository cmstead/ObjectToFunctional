IoTestPackageConfig clone production call

IoTestRunnerFactory := Object clone

IoTestRunnerFactory buildRunner := method(
    return IoTestRunner clone;
);