#jupyter_notebook_config.py
c.ServerProxy.servers = {
'pvserver':{
'command':[ #Execute this to start pvserver via sfapi
'pvserver',
'--auth=none',
'--bind-addr={}' #specify the port to listen on
]'
'timeout':20, #how long to wait for pvserver
'launcher_entry':{ #Jupyter lab launcher entry
'title':'ParaView Kernel'
}
}
}
