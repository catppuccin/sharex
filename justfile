default: all

setup:
  mkdir -p themes

clean:
  rm -fv themes/*.json
  rm -rfv dist

gen flavor:
  whiskers theme.json.tmpl {{flavor}} -o themes/{{flavor}}.json

zip:
  mkdir -p dist
  zip -r dist/image-effects.zip image-effects/
  zip -r dist/themes.zip themes/

all: setup (gen "latte") (gen "frappe") (gen "macchiato") (gen "mocha")
