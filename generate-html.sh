find content -print | grep '\.md' | while IFS= read -r p; do
	buildpath=$(echo $p | sed 's/content/build/' | sed 's/\.md/\.html/' )
	parentdir="$(dirname "$buildpath")"
	# for stuff with index.md in a directory, since images/svgs should be included in the directory too
	mkdir $parentdir 2> /dev/null
	pandoc --template=html.template --mathml -p $p > $buildpath
done

find content -print | grep '\.asy' | while IFS= read -r p; do
	buildpath=$(echo $p | sed 's/content/build/' | sed 's/\.asy/\.svg/' )
	parentdir="$(dirname "$buildpath")"
	mkdir $parentdir 2> /dev/null
	asy -f svg $p -o $buildpath
done
