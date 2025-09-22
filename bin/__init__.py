from typing import Tuple

import numpy as np


def txt_read(file: str) -> Tuple[:, 2]:
    """
    read txt file
    :param file: filename 'example.txt'
    :return:
    """
    data = np.loadtxt(file)
    return data


def data2model(data: Tuple[:, 2], modelname: str) -> None:
    """把数据转为建模文件"""
    start = data[:-1, :]
    end = data[1:, :]
    other = np.zeros([len(start),6]) # 目前已知最后一列为电导率 [?,?,?,?,?,电导率]
    other[:,5] = 54e6 #设置电导率
    other[:,4] = 1 # 案例上是这样设置的
    data = np.concatenate((start, end,other), axis=1)

    data1 = [1]  # 文件里面说的材料数目
    data2 = [len(data), 1, 1, 0]  # 文件里面的一串很长的描述

    with open(modelname, 'w', encoding='utf-8') as file:
        file.write('% Number of materials' + '\n')
        data1 = ' '.join(f'{num}' for num in data1)
        file.write(''.join(map(str, data1)) + '\n')
        file.write(
            '% Number of elements in metal with conductive walls, permeability, permitivity, conductivity' + '\n')
        data2 = ' '.join(f'{num}' for num in data2)
        file.write(''.join(map(str, data2)) + '\n')
        file.write(
            '% Segments of lines and elipses with conductivity' + '\n')
        for row in data:
            row = ''.join(f'{num:<20.8e}' for num in row)
            file.write(''.join(map(str, row)) + '\n')

if __name__=='__main__':
    data2model(np.array([[1,2],[3,4],[5,6],[7,8]]),modelname='test.txt')