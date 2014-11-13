PROJECT=pytest-beakerlib
FEDORAHOSTED_PROJECT=python-${PROJECT}
VERSION=$(shell python -c "import setup; print(setup.setup_args['version'])")
VERSIONEDNAME=${PROJECT}-${VERSION}
TARBALLNAME=${VERSIONEDNAME}.tar.gz

all: wheel
	python setup.py sdist

install:
	python setup.py install

tarball: ${TARBALLNAME}

${TARBALLNAME}:
	git archive v${VERSION} -o ${TARBALLNAME} --prefix ${VERSIONEDNAME}

upload-fedorahosted: tarball
	scp ${TARBALLNAME} fedorahosted.org:${FEDORAHOSTED_PROJECT}

upload-pypi:
	python setup.py sdist upload
	python setup.py bdist_wheel upload

upload: upload-fedorahosted upload-pypi

wheel:
	python setup.py bdist_wheel

.PHONY: all install tarball upload upload-fedorahosted upload-pypi wheel
