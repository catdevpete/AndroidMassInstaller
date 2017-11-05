echo off
setlocal EnableDelayedExpansion

for /f "tokens=*" %%f in ('adb devices') do (
    for /r %%p in (*.apk) do (
        set devicestr=%%f
        set apk=%%p
        if "!devicestr!"=="!devicestr:List=!" (
            for /f "tokens=1" %%d in ("!devicestr!") do (
                set deviceid=%%d
                echo !deviceid!
                echo !apk!
                adb -s !deviceid! install !apk!
            )
        )
    )
)