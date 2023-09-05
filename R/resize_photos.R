
library(magick)

files<-dir("./photo")

for (file in files){
  
  # Load the image
filename<-file
filepath<-"./photo/"

# Load the image
image <- image_read(paste0(filepath,filename))
w<-image_info(image)[2] # width
h<-image_info(image)[3] # height

if(w>h){
  # Resize the image to a fixed width (maintaining aspect ratio)
  image_resized <- image_scale(image, "640x")
}else{
  image_resized <- image_scale(image, "640y")
}

# Save the resized image as a JPG
image_write(image_resized, path = paste0(filepath,filename), format = "jpg")
}
