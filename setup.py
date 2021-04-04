from distutils.core import setup

setup(
        name="zuknuft",
        version="0.1",
        author="riotbib",
        author_email="riotbib@github",
        scripts=["zukunft.py"],
        install_requires=[
           'bottle',
        ],
)
