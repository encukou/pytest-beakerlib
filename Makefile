PROJECT=pytest-beakerlib
FEDORAHOSTED_PROJECT=python-${PROJECT}
VERSION=$(shell python -c "import setup; print(setup.setup_args['version'])")
VERSIONEDNAME=${PROJECT}-${VERSION}
TARBALLNAME=${VERSIONEDNAME}.tar.gz

all:
	python setup.py build

install:
	python setup.py install

tarball: ${TARBALLNAME}

${TARBALLNAME}:
	git archive v${VERSION} -o ${TARBALLNAME} --prefix ${VERSIONEDNAME}

upload: tarball
	scp ${TARBALLNAME} fedorahosted.org:${FEDORAHOSTED_PROJECT}

.PHONY: all install tarball upload
