set -e

sudo xcode-select -s /Applications/Xcode_16.2.0.app

xcodebuild docbuild -scheme EasyRichText-Package -destination 'platform=macOS,arch=arm64' -parallelizeTargets -derivedDataPath docsData
echo "Copying DocC archives to docArchives..."
mkdir -p docArchives
cp -R `find docsData -type d -name "*.doccarchive"` docArchives

cd docArchives
# Loop over all directories ending with ".doccarchive"
for dir in */; do
    if [[ "$dir" == *.doccarchive/ ]]; then
        ARCHIVE=${dir%/} # Remove trailing slash
        ARCHIVE_NAME=${ARCHIVE%.doccarchive}
        echo "Processing archive: $ARCHIVE_NAME ($ARCHIVE)"

        $(xcrun --find docc) process-archive transform-for-static-hosting "$ARCHIVE" --hosting-base-path $ARCHIVE_NAME --output-path ../public/$ARCHIVE_NAME
    fi
done
