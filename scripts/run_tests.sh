#!/bin/bash

xctool -project TienLen.xcodeproj -scheme PlayingCards -sdk iphonesimulator build test
xctool -project TienLen.xcodeproj -scheme Onward -sdk iphonesimulator build test
xctool -project TienLen.xcodeproj -scheme TienLen -sdk iphonesimulator build test

