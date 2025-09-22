from bin import txt_read
from bin import data2model
from fig_plot import cavity_plot

import numpy as np

cavity = 'STCF_CavityShape20250831.txt'
STCF_Cavity = txt_read(cavity)
cavity_plot(STCF_Cavity, figname='half STCF_Cavity')  # plot cavity
STCF_Cavity = STCF_Cavity[:-3, :]  # 删除多余数据

# 镜像补全
mirror = STCF_Cavity[::-1,:].copy()
mirror[:,0] = -mirror[:,0]
cavity_plot(mirror, figname='mirror STCF_Cavity')  # plot cavity
STCF_Cavity = np.concatenate((STCF_Cavity, mirror[1:,:]), axis=0)
cavity_plot(STCF_Cavity, figname='whole STCF_Cavity')  # plot cavity

# 转换成建模数据文件
# STCF_Cavity = STCF_Cavity/1000  # 换单位成m
data2model(STCF_Cavity,modelname=r'ECHO2D\STCF_Cavity1.txt')

