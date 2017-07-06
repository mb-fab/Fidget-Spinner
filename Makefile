
all: stl projection

stl: model.stl

model.stl: model.scad settings.scad
	openscad $< -o $@

projection: projection.svg

projection.svg: projection.scad model.scad settings.scad
	openscad $< -o $@

frames: model.scad settings.scad
	./animate.py

model.mp4:
	 ffmpeg -r 30 -f image2 -i "model-%03d.png" -vcodec libx264 -crf 25 $@

clean:
	rm -f *.stl *.svg model-?.scad model-??.scad model-???.scad *.png

