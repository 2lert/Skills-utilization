"""
Minimal smoke test — just confirms the Flask app factory/object loads
without error. Expand this with real route/unit tests as the project grows.
"""
from app import app


def test_app_loads():
    assert app is not None


def test_app_has_routes():
    # Sanity check that blueprints registered at least one route
    assert len(app.url_map._rules) > 0
