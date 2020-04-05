#!/usr/bin/env sh

FLAG="$1"
TEMPLATECFG_FILE="config.yml"

TEMPLATE_DIR="./templates"
TEMPLATE_SEGMENT_DIR="$TEMPLATE_DIR/segments"

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
	ORIGINAL="$(echo "$OUTPUT_NAME" | cut -d'/' -f2 )"

	TMP_SEGMENTS=$(mktemp -p/tmp segments.XXXXXXXXXX)
	SEGMENTS=""
	find "$TEMPLATE_SEGMENT_DIR" -maxdepth 1 -name "$ORIGINAL.*.tmpl" -type f > "$TMP_SEGMENTS"
	while IFS= read -r SEGMENT; do
		SEGMENT_NAME="$(_trim_dot_slash "$SEGMENT")"
		TRIMMED="$(_trim_tmpl "$SEGMENT")"
		SEGMENT_TAG="$(echo "$TRIMMED" | cut -d'/' -f4 | sed "s/$ORIGINAL.//")"
		SEGMENTS="$SEGMENTS -t ${SEGMENT_TAG}=${SEGMENT_NAME}"
	done < "$TMP_SEGMENTS"
	rm -rf "$TMP_SEGMENTS"

	COMMAND_START="$(printf "gomplate -d %s -f %s%s" "$TEMPLATECFG_FILE" "$TEMPLATE_NAME" "$SEGMENTS")"
	if [ "$FLAG" = "-d" ] || [ "$FLAG" = "--diff" ]; then
		COMMAND_END="| diff - $ORIGINAL"
	else
		COMMAND_END="> $ORIGINAL"
	fi
	FULL_COMMAND="$COMMAND_START $COMMAND_END"
	echo "Running: $FULL_COMMAND"
	eval "$FULL_COMMAND"
	if [ $? -eq 1 ]; then
		FAILURES="$FAILURES $ORIGINAL"
	fi
done < "$TMP_TEMPLATES"

rm -rf "$TMP_TEMPLATES"

echo ""

if [ "$FLAG" = "-d" ] || [ "$FLAG" = "--diff" ]; then
	if [ "$FAILURES" != "" ]; then
		echo "Failures:$FAILURES"
		exit 1
	fi
fi
