# test_main.py
from my_python_project.main import add  # Use the full import path

def test_add():
    assert add(2, 3) == 5
    assert add(0, 0) == 0
    assert add(-1, 1) == 0

