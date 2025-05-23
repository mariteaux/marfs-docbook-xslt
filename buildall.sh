cd $1
rm -rf output
echo "Making output directories..."
mkdir output/ output/nofi/ output/lofi/ output/hifi/
echo "Output directories made."

# build nofi full
echo "Building nofi AutoSite pages..."
find . -maxdepth 1 -type f -name '*.xml' -exec xsltproc --xinclude -o output/nofi/{}/index.html ../../nofi.xml {} \;
xsltproc --xinclude -o output/nofi/full.xml/index.html ../../nofi-full.xml full.xml
echo "nofi AutoSite pages built."

# build lofi full
echo "Building lofi AutoSite pages..."
find . -maxdepth 1 -type f -name '*.xml' -exec xsltproc --xinclude -o output/lofi/{}/index.html ../../lofi.xml {} \;
xsltproc --xinclude -o output/lofi/full.xml/index.html ../../lofi-full.xml full.xml
echo "lofi AutoSite pages built."

# build hifi full
echo "Building hifi AutoSite pages..."
find . -maxdepth 1 -type f -name '*.xml' -exec xsltproc --xinclude -o output/hifi/{}/index.html ../../hifi.xml {} \;
xsltproc --xinclude -o output/hifi/full.xml/index.html ../../hifi-full.xml full.xml
echo "hifi AutoSite pages built."

# strip bullshit
echo "Cleaning output pages..."
find . -type f -name '*.html' -print0 | xargs -0 sed -i 1d
find . -type f -name '*.html' -print0 | xargs -0 sed -i 's/ xmlns:db="http:\/\/docbook.org\/ns\/docbook" xmlns:xlink="http:\/\/www.w3.org\/1999\/xlink"//'
find . -type f -name '*.html' -ipath "*output/nofi*" -print0 | xargs -0 sed -i 's/—/--/'
echo "Output pages cleansed."

# rename output folders and move preface index for nofi
echo "Renaming folders and moving preface indexes..."
cd output/nofi/
for f in *.xml; do
	mv -- "$f" "${f%.xml}"
done
cd index/
mv index.html ../
cd ../
rmdir index/

# and same for lofi
cd ../../output/lofi/
for f in *.xml; do
	mv -- "$f" "${f%.xml}"
done
cd index/
mv index.html ../
cd ../
rmdir index/

# and same for hifi
cd ../../output/hifi/
for f in *.xml; do
	mv -- "$f" "${f%.xml}"
done
cd index/
mv index.html ../
cd ../
rmdir index/
echo "Done."
echo "Build successful."