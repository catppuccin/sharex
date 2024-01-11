default: all

setup:
  mkdir -p themes

clean:
  rm -fv themes/*.json

gen flavor:
  whiskers theme.json.tmpl {{flavor}} -o themes/{{flavor}}.json

all: setup (gen "latte") (gen "frappe") (gen "macchiato") (gen "mocha")
