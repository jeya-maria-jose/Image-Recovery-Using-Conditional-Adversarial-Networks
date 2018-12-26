import cv2
import numpy as np

#path="/home/mmlab/pytorch-CycleGAN-and-pix2pix/salt/"
path="/home/mmlab/Downloads/ISTD_Dataset/test/test_A/generated/sp_motion/"

path1="/home/mmlab/Downloads/ISTD_Dataset/test/test_C/"

save="/home/mmlab/pytorch-CycleGAN-and-pix2pix/datasets/sp_motion/test/"
count=0

for i in range(1330):
	k=1
	while 1:
		count+=1
		try:
			img = cv2.imread(path+str(i)+"-"+str(k)+".png")
			img1 = cv2.imread(path1+str(i)+"-"+str(k)+".png")

			img=cv2.resize(img,(256,256))
			img1=cv2.resize(img1,(256,256))



			vis = np.concatenate((img1, img), axis=1)
			cv2.imwrite((save+str(count)+".png"), vis)
			

			k+=1
		except:
			
			break
