# For your convenience 
alias PlistBuddy=/usr/libexec/PlistBuddy

# IMPLEMENT: 
# Read script input parameter and add it to your Info.plist. Values can either be CATS or DOGS
ANIMAL=$1

PLIST="CatsAndModules-KaterynaAvramenko-Info.plist"
PlistBuddy -c "Set :api_type ${ANIMAL}" $PLIST

WORKSPACE=CatsAndModules_KaterynaAvramenko.xcworkspace
SCHEME="CatsAndModules_KaterynaAvramenko"
CONFIG=Release
DEST="generic/platform=iOS" 
CURRENT_DIR=$(pwd)

# IMPLEMENT:
# Clean build folder
xcodebuild clean \
-workspace "${WORKSPACE}" \
-scheme "${SCHEME}" \
-configuration "${CONFIG}"

# IMPLEMENT:
# Create archive
VERSION="v1.0.0"
ARCHIVE_PATH="./Exported_${ANIMAL}/${VERSION}.xcarchive"

xcodebuild archive \
-archivePath "${ARCHIVE_PATH}" \
-workspace "${WORKSPACE}" \
-scheme "${SCHEME}" \
-configuration "${CONFIG}" \
-destination "${DEST}"

# IMPLEMENT:
# Export archive
EXPORT_PATH="./Exported_${ANIMAL}"
EXPORT_OPTIONS_PLIST="./exportOptionsTemplate.plist"

xcodebuild -exportArchive \
-archivePath "${ARCHIVE_PATH}" \
-exportPath "${EXPORT_PATH}" \
-exportOptionsPlist "${EXPORT_OPTIONS_PLIST}" # обовʼязково!
