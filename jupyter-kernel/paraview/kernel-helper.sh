supervisord -c /srv/supervisord.conf &

export PYTHONPATH="/home/nonroot/shft/app/paraview/build/lib/python3.8/site-packages:${PATH}"

echo " ================ PATH=${PATH}"
echo " ================ PYTHONPATH=${PYTHONPATH}"

/opt/conda/bin/python /usr/local/IParaViewKernel/paraview_kernel.py -f "$@"
