release-pypi: clean
	source v-env/bin/activate && python setup.py sdist bdist_wheel && pandoc --from=markdown --to=rst --output=README.rst README.md && twine upload dist/*

clean:
	rm -fr dist build cwlogcleaner.egg-info README.rst

virtualenv:
	python3 -m venv v-env

prepare: virtualenv
	source v-env/bin/activate && python setup.py install

run:
	source v-env/bin/activate && python3 wrapper.py