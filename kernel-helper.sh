rm /tmp/.X0-lock || true
Xvfb :0 -screen 0 1600x968x24 -listen tcp -ac || true &
exec "$@"
