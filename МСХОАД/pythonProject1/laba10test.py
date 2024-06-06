import sklearn
import mglearn
import matplotlib.pyplot as plt
import numpy as np
from sklearn.datasets import make_blobs
from sklearn.svm import LinearSVC, SVC
from sklearn.model_selection import train_test_split
from mpl_toolkits.mplot3d import Axes3D
#метод опорных векторов (ядерный метод )исп для задач классификации (SVR)
# Создание набора данных с двумя признаками и двумя классами
X, y = make_blobs(centers=4, random_state=8)
# Изменение классов, чтобы они были бинарными
y = y % 2

# Визуализация набора данных РИС 1(взяли набор данных, который уже использовали раньше)
mglearn.discrete_scatter(X[:, 0], X[:, 1], y)
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()


# РИС 2Обучение линейного SVM (линейная модель классфик может отделить точки с помощью прямой линии и не может дать хорошее качество для этого набора )
linear_svm = LinearSVC(dual=True, max_iter=10000).fit(X, y)
mglearn.plots.plot_2d_separator(linear_svm, X)
mglearn.discrete_scatter(X[:, 0], X[:, 1], y)
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()#найденная с помощью линейного SVM


# Добавление нового признака (квадрат второго признака).Теперь каждая точка данных представлена в виде точки трехмерного пространства
X_new = np.hstack([X, X[:, 1:] ** 2])#вот здесь этот признак
fig = plt.figure()
#визуализируем в 3ds
ax = Axes3D(fig, elev=-152, azim=-26)
mask = y == 0
# Визуализация в трех измерениях
ax.scatter(X_new[mask, 0], X_new[mask, 1], X_new[mask, 2], c=y[mask], cmap=mglearn.cm2, s=60)
ax.scatter(X_new[~mask, 0], X_new[~mask, 1], X_new[~mask, 2], c=y[~mask], marker='^', cmap=mglearn.cm2, s=60)
ax.set_xlabel("признак0")
ax.set_ylabel("признак1")
ax.set_zlabel("признак1 ** 2")
plt.show()#Расширение набора данных, показанного на рис. 10.2, за счет добавления третьего признака, полученного на основе признака

# Обучение SVM с использованием квадратичных признаков
linear_svm_3d = LinearSVC(dual=True, max_iter=10000).fit(X_new, y)

# РИС 3 Визуализация разделяющей плоскости в трех измерениях
# (В новом представлении данных уже можно отделить два класса друг от друга, используя линейную модель, плоскость в трехмерном пространстве)
coef, intercept = linear_svm_3d.coef_.ravel(), linear_svm_3d.intercept_
fig = plt.figure()
ax = Axes3D(fig, elev=-152, azim=-26)
xx = np.linspace(X_new[:, 0].min() - 2, X_new[:, 0].max() + 2, 50)
yy = np.linspace(X_new[:, 1].min() - 2, X_new[:, 1].max() + 2, 50)
XX, YY = np.meshgrid(xx, yy)
ZZ = (coef[0] * XX + coef[1] * YY + intercept) / -coef[2]
ax.plot_surface(XX, YY, ZZ, rstride=8, cstride=8, alpha=0.3)
ax.scatter(X_new[mask, 0], X_new[mask, 1], X_new[mask, 2], c=y[mask], cmap=mglearn.cm2, s=60)
ax.scatter(X_new[~mask, 0], X_new[~mask, 1], X_new[~mask, 2], c=y[~mask], marker='^', cmap=mglearn.cm2, s=60)
ax.set_xlabel("признак0")
ax.set_ylabel("признак1")
ax.set_zlabel("признак1 ** 2")
plt.show()

# РИС 4  Построение контуров разделяющей плоскости
#Фактически модель линейного SVM как функция исходных признаков не является больше линейной. Это скорее эллипс, как можно увидеть на графике
ZZ = YY ** 2
dec = linear_svm_3d.decision_function(np.c_[XX.ravel(), YY.ravel(), ZZ.ravel()])
plt.contourf(XX, YY, dec.reshape(XX.shape), levels=[dec.min(), 0, dec.max()], cmap=mglearn.cm2, alpha=0.5)
mglearn.discrete_scatter(X[:, 0], X[:, 1], y)
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()



#РИ5 С Использование SVM с ядром RBF для набора данных
#контур вокруг точек (граница приянтия решений \опорные веторы=точки большого размера)
X, y = mglearn.tools.make_handcrafted_dataset()
svm = SVC(kernel='rbf', C=10, gamma=0.1).fit(X, y) #скоректировали параметр С и параметр gamma
mglearn.plots.plot_2d_separator(svm, X, eps=.5)
mglearn.discrete_scatter(X[:, 0], X[:, 1], y)

sv = svm.support_vectors_
sv_labels = svm.dual_coef_.ravel() > 0
mglearn.discrete_scatter(sv[:, 0], sv[:, 1], sv_labels, s=15, markeredgewidth=3)
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()#SVM дает очень гладкую и нелинейную границу


# Визуализация различных комбинаций параметров C(ограничивает важность каждой точки) и gamma(степень близости расположения точек) для SVM с ядром RBF(радикальная базисная функция)
fig, axes = plt.subplots(3, 3, figsize=(15, 10))
for ax, C in zip(axes, [-1, 0, 3]):
    for a, gamma in zip(ax, range(-1, 2)):
        mglearn.plots.plot_svm(log_C=C, log_gamma=gamma, ax=a)
axes[0, 0].legend(["class 0", "class 1", "sv class 0", "sv class 1"], ncol=4, loc=(.9, 1.2))
plt.show()#смтортеть текст после графика 10.7  высокое небольшое C дает более жесткие ограничения

# Использование SVM для классификации данных о раке груди
from sklearn.datasets import load_breast_cancer

cancer = load_breast_cancer()
X_train, X_test, y_train, y_test = train_test_split(cancer.data, cancer.target, random_state=0)
# признаки были измерены в одном и том же масштабе!
svc = SVC()
svc.fit(X_train, y_train)
print("Правильность на обучающем наборе: {:.2f}".format(svc.score(X_train, y_train)))
print("Правильность на тестовом наборе: {:.2f}".format(svc.score(X_test, y_test)))
#Правильность на обучающем наборе: 1.00
# Правильность на тестовом наборе: 0.63





# Визуализация минимальных и максимальных значений признаков
plt.plot(X_train.min(axis=0), 'o', label="min")
plt.plot(X_train.max(axis=0), '^', label="max")
plt.legend(loc=4)
plt.xlabel("Индекс признака")
plt.ylabel("Величина признака")
plt.yscale("log")
plt.show()#Исходя из этого графика, мы можем заключить, что признаки в наборе данных Breast Cancer имеют  совершенно  различные  порядки  величин

#1 способ решения проблемы
# Масштабирование признаков  чтобы  все признаки  принимали  значения  от  0  до  1 для улучшения работы SVM
#вычислим минимальное значение для каждого признака обуч набора
min_on_training = X_train.min(axis=0)
#вычис ширину диапозона для каждого признака
range_on_training = (X_train - min_on_training).max(axis=0)
#вычисляем минимальное значение и затем делим на ширину диапозона
X_train_scaled = (X_train - min_on_training) / range_on_training
print("Минимальные значения для каждого признака:\n{}".format(X_train_scaled.min(axis=0)))
print("Максимальные значения для каждого признака:\n{}".format(X_train_scaled.max(axis=0)))



#используем ТО ЖЕ САМОЕ преобразование для тестового набора,
# #используя минимум и ширину диапазона из обучающего набора
X_test_scaled = (X_test - min_on_training) / range_on_training

svc = SVC()
svc.fit(X_train_scaled, y_train)
print("Правильность на обучающем наборе после масштабирования: {:.3f}".format(svc.score(X_train_scaled, y_train)))
print("Правильность на тестовом наборе после масштабирования: {:.3f}".format(svc.score(X_test_scaled, y_test)))

#2 увеличиваем C(можно и гамма)
svc = SVC(C=1000)
svc.fit(X_train_scaled, y_train)
print("Правильность на обучающем наборе после масштабирования с параметром C=1000: {:.3f}".format(
    svc.score(X_train_scaled, y_train)))
print("Правильность на тестовом наборе после масштабирования с параметром C=1000: {:.3f}".format(
    svc.score(X_test_scaled, y_test)))