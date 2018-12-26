import cv2
import numpy as np
import random

path="/home/mmlab/pytorch-CycleGAN-and-pix2pix/salt_pepper/"
path1="/home/mmlab/Downloads/ISTD_Dataset/train/test_C/"

save="/home/mmlab/pytorch-CycleGAN-and-pix2pix/datasets/salt_and_pepper/train/"
count=0

def sp_noise(image,prob):
    '''
    Add salt and pepper noise to image
    prob: Probability of the noise
    '''
    output = np.zeros(image.shape,np.uint8)
    thres = 1 - prob 
    for i in range(image.shape[0]):
        for j in range(image.shape[1]):
            rdn = random.random()
            if rdn < prob:
                output[i][j] = 0
            elif rdn > thres:
                output[i][j] = 255
            else:
                output[i][j] = image[i][j]
    return output

def blur(image):
	size = 15

	# generating the kernel
	kernel_motion_blur = np.zeros((size, size))
	kernel_motion_blur[int((size-1)/2), :] = np.ones(size)
	kernel_motion_blur = kernel_motion_blur / size

	# applying the kernel to the input image
	output = cv2.filter2D(image, -1, kernel_motion_blur)

	return output


for i in range(190):
	k=1
	while 1:
		count+=1
		try:
			img = cv2.imread(path+str(i)+"-"+str(k)+".png")
			img1 = cv2.imread(path1+str(i)+"-"+str(k)+".png")

			img=cv2.resize(img,(256,256))
			img1=cv2.resize(img1,(256,256))

			img=blur(img)
	 		#img=sp_noise(img,0.007)



			vis = np.concatenate((img1, img), axis=1)
			cv2.imwrite((save+str(count)+".png"), vis)
			

			k+=1
		except:
			
			break
