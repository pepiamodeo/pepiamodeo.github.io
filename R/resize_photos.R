
library(magick)

files<-dir("./photo_raw")

for (file in files){

# Load the image
filename<-file
filepath<-"./photo_raw/"

# Load the image
image <- image_read(paste0(filepath,filename))
w<-image_info(image)[2] # width
h<-image_info(image)[3] # height

if(w>h){
  # Resize the image to a fixed width (maintaining aspect ratio)
  image_resized <- image_scale(image, "1280x") #1280 width
}else{
  image_resized <- image_scale(image, "x1280") #640 height
}

#unlink(paste0(filepath,filename))
# Save the resized image as a JPG
image_write(image_resized, path = paste0("./photo/",substr(filename,2,nchar(filename))), format = "jpg")
}
