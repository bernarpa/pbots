.PHONY: all format check clean

all: format types lint

# I prefer black to yapf.
# yapf -ri .
format:
	black .

types:
	mypy --ignore-missing-imports .

# Ignored rules:
#   E203: whitespace before ':' (black imposes spaces within expressions such as s[x1 : x2])
#   E266: too many leading '#' for block comment
#   E501: line too long
#   W503: line break before binary operator
lint:
	flake8 --ignore=E203,E266,E501,W503

clean:
	find . -name __pycache__ -type d -exec rm -fr {} +
	find . -name .mypy_cache -type d -exec rm -fr {} +
