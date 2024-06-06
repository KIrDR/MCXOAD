import pandas as pd
import mglearn
import matplotlib.pyplot as plt
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.datasets import load_iris
from pandas.plotting import scatter_matrix
from sklearn.tree import plot_tree

from sklearn.tree import DecisionTreeClassifier
from sklearn.inspection import DecisionBoundaryDisplay


iris_dataset = load_iris()

print("\n\n=========================  Ключи iris_dataset  =========================\n{}".format(iris_dataset.keys()))
# print(iris_dataset['DESCR'][:1100] + "\n...")
print("\n\n=====================  Названия ответов (target)  ======================\n\t\t\t\t  {}".format(iris_dataset['target_names']))
print("\n\n====================  Названия признаков (feature)  ====================\n{}".format(iris_dataset['feature_names']))

print("\n\n=============   Тип массива data: {}".format(type(iris_dataset['data'])))
print("=============\t\t  Форма массива data: {}".format(iris_dataset['data'].shape))
print("======\tПервые пять строк массива data:\n{}".format(iris_dataset['data'][:5]))

print("\n\n=============   Тип массива target: {}".format(type(iris_dataset['target'])))
print("=============\t\t  Форма массива target: {}".format(iris_dataset['target'].shape))
print("===\tОтветы (target):\n{}".format(iris_dataset['target'][:150]))

X_train, X_test, y_train, y_test = train_test_split(iris_dataset['data'], iris_dataset['target'], random_state=0)
print("\n")
print("======\tФорма массива X_train: {}".format(X_train.shape))
print("======\tФорма массива y_train: {}".format(y_train.shape))
print("======\tФорма массива X_test:  {}".format(X_test.shape))
print("======\tФорма массива y_test:  {}".format(y_test.shape))

# Создаем dataframe из данных в массиве X_train
# Маркируем столбцы, используя строки в iris_dataset.feature_names
iris_dataframe = pd.DataFrame(X_train, columns=iris_dataset.feature_names)

# Создаем матрицу рассеяния из dataframe, цвет точек задаем с помощью y_train
grr = scatter_matrix(iris_dataframe, c=y_train, figsize=(15, 15), marker='o',
                     hist_kwds={'bins': 20}, s=60, alpha=.8, cmap=mglearn.cm3)
plt.show()