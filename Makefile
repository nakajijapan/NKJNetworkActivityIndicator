# Makefile
.PHONY: build

PROJECT = NKJNetworkActivityIndicator.xcodeproj
WORKSPACE = Example/NKJNetworkActivityIndicator.xcworkspace
SCHEME_TARGET = NKJNetworkActivityIndicator-Example
TEST_TARGET = NKJNetworkActivityIndicator_Tests

clean:
	xcodebuild \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME_TARGET) \
		clean

build:
	xcodebuild \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME_TARGET) \
		build \
		-sdk iphoneos \
		-configuration Debug \
		TEST_AFTER_BUILD=YES \
		| xcpretty -c

test:
	xcodebuild test \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME_TARGET) \
		-destination-timeout 1 \
		-sdk iphonesimulator \
		-configuration Debug \
		-destination 'name=iPhone 6' 
