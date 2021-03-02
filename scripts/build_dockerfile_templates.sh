#!/usr/bin/env sh

FLAG="$1"
TEMPLATECFG_FILE="config.yml"

TEMPLATE_DIR="./templates/Dockerfiles"

_trim_dot_slash() {
	FILE="$1"
	echo "$FILE" | sed 's/^.\///'
}

_trim_tmpl() {
	FILE="$1"
	echo "$FILE" | sed 's/.tmpl$//'
}

FAILURES=""

TMP_TEMPLATES=$(mktemp -p/tmp templates.XXXXXXXXXX)

find "$TEMPLATE_DIR" -maxdepth 1 -name "*.tmpl" -type f > "$TMP_TEMPLATES"
while IFS= read -r TEMPLATE; do
	TEMPLATE_NAME="$(_trim_dot_slash "$TEMPLATE")"
	OUTPUT_NAME="$(_trim_tmpl "$TEMPLATE_NAME")"
	ORIGINAL="$(echo "$OUTPUT_NAME" | cut -d'/' -f3 )"
	EDITION="$(echo "$ORIGINAL" | cut -d\. -f2)"
	mkdir -p "./${EDITION}"

	for image in $(< "$TEMPLATECFG_FILE" yq -r '.images[]'); do
		COMMAND_START="$(printf 'VERSION="%s" gomplate -f %s%s' "$image" "$TEMPLATE_NAME" "$SEGMENTS")"
		FILE_LOCATION="${EDITION}/Dockerfile.${image}"
		if [ "$FLAG" = "-d" ] || [ "$FLAG" = "--diff" ]; then
			COMMAND_END="| diff - $FILE_LOCATION"
		else
			COMMAND_END="> $FILE_LOCATION"
		fi
		FULL_COMMAND="$COMMAND_START $COMMAND_END"
		echo "Running: $FULL_COMMAND"
		eval "$FULL_COMMAND"
		if [ $? -eq 1 ]; then
			FAILURES="${FAILURES} $FILE_LOCATION"
		fi
	done
	echo ""
done < "$TMP_TEMPLATES"

rm -rf "$TMP_TEMPLATES"

if [ "$FLAG" = "-d" ] || [ "$FLAG" = "--diff" ]; then
	if [ "$FAILURES" != "" ]; then
		echo "Failures: $FAILURES"
		exit 1
	fi
fi
