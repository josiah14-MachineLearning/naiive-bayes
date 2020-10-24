# Getting the Environment up

**NOTE** *Jupyter Notebook does not work well with the Hy Language.  Support is unstable and unreliable, there are bugs, and the community is small and therefore slow to make changes.  Therefore, data exploration is done in normal Python, but actual code will be written using Hy unless there's a good reason not to*

## Getting the basic environment up

This project uses Poetry as the dependency manager.  There are, however, some system libraries you'll need. On Ubuntu, those libraries in the Apt repositories are called `python3-tk liblzma-dev`: this code is untested on other systems.

Once the above mentioned libraries are installed, you should be able to create the environment using Poetry.

```bash
poetry self update
poetry install
```

Once the environment is created, you can add it as a Jupyter kernel like so:

```bash
poetry shell
python -m ipykernel install --user --name=naiive-bayes
exit
jupyter lab
# in the UI, select your virtual environment.
```
