import matplotlib.pyplot as plt


fontdict = {
    'weight': 'bold',
    'size': 14,
    'fontproperties': 'Times New Roman'
}
figdict = {
    # 刻度方向设置为 "in"，表示刻度向内
    'xtick.direction': 'in',
    'ytick.direction': 'in',
    # 刻度标签字体大小设置为 12，符合学术论文中常见的字号要求
    'xtick.labelsize': 12,
    'ytick.labelsize': 12,
    # 字体族设置为 serif，学术论文中通常使用 serif 字体（如 Times New Roman）以增强可读性
    'font.family': 'serif',
    # 指定字体为 Times New Roman，这是学术论文中常用的字体之一
    'font.serif': ['Times New Roman'],
    # 设置标题字体大小为 14，稍大于刻度标签字体，以突出显示
    'axes.titlesize': 14,
    # 设置轴标签字体大小为 12，与刻度标签字体大小一致
    'axes.labelsize': 12,
    # 设置图例字体大小为 10，确保图例文字清晰可读但不喧宾夺主
    'legend.fontsize': 10,
    # 设置图形尺寸为宽 6 英寸、高 4 英寸，这是一个常见的学术图表尺寸，既不太大也不太小
    'figure.figsize': (6, 4),
    # 设置图形分辨率为 600 DPI，这是印刷出版物中常用的标准分辨率，能够保证图片质量
    'figure.dpi': 300,
    # 设置底部边距为 0.15，确保标题和轴标签有足够的空间显示
    'figure.subplot.bottom': 0.15,
    # 设置左侧边距为 0.15，确保 y 轴标签和刻度有足够的空间显示
    'figure.subplot.left': 0.15,
    # 设置右侧边距为 0.95，避免右侧内容超出图形边界
    'figure.subplot.right': 0.95,
    # 设置顶部边距为 0.95，避免标题超出图形边界
    'figure.subplot.top': 0.95,
    # 设置线条宽度为 1.0，确保线条清晰可见但不过于粗壮
    'lines.linewidth': 1.0,
    # 设置标记大小为 4，使数据点标记清晰可辨
    'lines.markersize': 4,
    # 设置网格线样式为虚线，增强图表的可读性同时不干扰数据线条
    'grid.linestyle': '--',
    # 设置网格线宽度为 0.5，使网格线不喧宾夺主
    'grid.linewidth': 0.5
}
plt.rcParams.update(figdict)

def cavity_plot(cavity, figname='cavity') -> None:
    """
    plot cavity shape
    :param cavity: ndarray(n*2)
    :param figname:
    """
    plt.figure()
    plt.plot(cavity[:, 0], cavity[:, 1], )
    plt.xlabel("Z(mm)", fontdict=fontdict)
    plt.ylabel("R(mm)", fontdict=fontdict)
    plt.tight_layout()
    # plt.show(block=True)
    plt.savefig(figname)
    plt.close()