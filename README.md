# Image-Recovery-Using-Conditional-Adversarial-Networks
Analyzing Conditional Adversarial Networks to solve image recovery problems like shadow recovery, denoising and deblurring.

### Dataset 

ISTD Dataset is used.
Link to [Google Drive](https://drive.google.com/file/d/1I0qw-65KBA6np8vIZzO6oeiOvcDBttAY/view)

### Image Recovery Objectives 

Recovery is tested for the following augmented sets of images created from ISTD dataset.

1. Only Shadow
2. Shadow + Salt and Pepper Noise
3. Shadow + Speckle Noise
4. Shadow + Gaussian Noise
5. Shadow + All Noises
6. Shadow+ BLur
7. Shadow + Salt and Pepper Noise + Blur
8. Shadow + Speckle Noise + Blur
9. Shadow+ Gaussian Noise + Blur
10. Shadow + All Noises + Blur

### Conditional Adversarial Networks

We have used the pix2pix network proposed for image to image translation tasks by [Jun-Yan Zhu](https://github.com/junyanz) for this work.

**Pix2pix:  [Project](https://phillipi.github.io/pix2pix/) |  [Paper](https://arxiv.org/pdf/1611.07004.pdf) |  [Torch](https://github.com/phillipi/pix2pix)**

###Results
1. Only Shadow :

From Left :

i)Input 

ii)Prediction

iii) Ground Truth 
<p align="center">
  <img src="images/shadow/11_real_A.png" width="250"/>
  <img src="images/shadow/11_fake_B.png" width="250"/>
  <img src="images/shadow/11_real_B.png" width="250"/>
</p>

