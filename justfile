_default:
  @just --list

clean:
  rm -rfv dist

build:
  whiskers sharex.tera

zip: build
  mkdir -p dist
  zip -r dist/image-effects.zip image-effects/
  zip -r dist/themes.zip themes/
