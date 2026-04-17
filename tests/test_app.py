import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.status_code == 200
    assert response.data == b'Hello, Docker CI/CD!'

def test_health(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert response.json == {'status': 'ok'}

def test_greet(client):
    response = client.get('/greet/World')
    assert response.status_code == 200
    assert response.data == b'Hello, World!'

    response2 = client.get('/greet/pytest')
    assert response2.data == b'Hello, pytest!'