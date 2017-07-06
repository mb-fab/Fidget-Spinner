#!/usr/bin/python

from shlex import split
from subprocess import Popen,PIPE
from time import sleep

def scad_from_angle(angle):
    return  "use <model.scad>;\n" \
            "rotate("+str(angle)+") fidget_spinner();\n"

def render(angle):
    prefix = "model-"+str(angle).zfill(3)
    filename = prefix+".scad"
    print filename+" ..."
    f = open(filename,"w")
    f.write( scad_from_angle(angle) )
    f.close()
    return Popen(split("openscad "+filename+" -o "+prefix+".png"))

a = 0
processes = []
while a < 360:
    processes.append( render(a) )
    a = a+1
    sleep(0.1)

for p in processes:
    p.wait()
