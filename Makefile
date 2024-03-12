install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vvv —-cov=hello —-cov=greeting \
		——covesmath —-cov=web tests 

	python —m pytest —nbval notebook.ipynb #tests our jupyter notebook
	#python -m pytest -v tests/test_veb.py #if you just want to test web

debug:
	python -m pytest —vv —pdb #Debugger is invoked

one-test: 
	python -m pytest -vv tests/test_greeting.py::test_my_named

debugthree:
	# not working the way i expect 
	python -m pytest -vv --pdb -maxfail=4 # drop to PDB for first three failures

format:
	black *.py

lint:
	pylint --disable=R,C hello.py

all: install lint test