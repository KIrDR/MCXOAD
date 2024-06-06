import mglearn
import sklearn
import matplotlib.pyplot as plt
import numpy as np
from sklearn.decomposition import PCA
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import StandardScaler

# Визуализация принципа работы PCA
print("Визуализация принципа работы PCA")
mglearn.plots.plot_pca_illustration()
plt.show()

from sklearn.datasets import load_breast_cancer

# Загрузка данных о раке груди
print("Загрузка данных о раке груди")
cancer = load_breast_cancer()

# Визуализация распределения признаков для злокачественных и доброкачественных опухолей
print("Визуализация распределения признаков для злокачественных и доброкачественных опухолей")
fig, axes = plt.subplots(15, 2, figsize=(10, 20))
malignant = cancer.data[cancer.target == 0]
benign = cancer.data[cancer.target == 1]
ax = axes.ravel()
for i in range(30):
    _, bins = np.histogram(cancer.data[:, i], bins=50)
    ax[i].hist(malignant[:, i], bins=bins, color=mglearn.cm3(0), alpha=.5)
    ax[i].hist(benign[:, i], bins=bins, color=mglearn.cm3(2), alpha=.5)
    ax[i].set_title(cancer.feature_names[i])
    ax[i].set_yticks(())
ax[0].set_xlabel("Значение признака")
ax[0].set_ylabel("Частота")
ax[0].legend(["доброкачественная", "злокачественная"], loc="best")
fig.tight_layout()
plt.show()

# Масштабирование данных и применение PCA
print("Масштабирование данных и применение PCA")
scaler = StandardScaler()
scaler.fit(cancer.data)
X_scaled = scaler.transform(cancer.data)

pca = PCA(n_components=2)
pca.fit(X_scaled)
X_pca = pca.transform(X_scaled)

print("Форма исходного массива: {}".format(str(X_scaled.shape)))
print("Форма массива после сокращения размерности: {}".format(str(X_pca.shape)))

# Визуализация первых двух главных компонент
print("Визуализация первых двух главных компонент")
plt.figure(figsize=(8, 8))
mglearn.discrete_scatter(X_pca[:, 0], X_pca[:, 1], cancer.target)
plt.legend(cancer.target_names, loc="best")
plt.gca().set_aspect("equal")
plt.xlabel("Первая главная компонента")
plt.ylabel("Вторая главная компонента")
plt.show()

print("форма главных компонент: {}".format(pca.components_.shape))
print("компоненты PCA:\n{}".format(pca.components_))

plt.matshow(pca.components_, cmap='viridis')
plt.yticks([0, 1], ["Первая компонента", "Вторая компонента"])
plt.colorbar()
plt.xticks(range(len(cancer.feature_names)), cancer.feature_names, rotation=60, ha='left')
plt.xlabel("Характеристика")
plt.ylabel("Главные компоненты")
plt.show()

# Загрузка набора данных лиц и визуализация примеров изображений
print("Загрузка набора данных лиц и визуализация примеров изображений")
from sklearn.datasets import fetch_lfw_people
people = fetch_lfw_people(min_faces_per_person=20, resize=0.7)
image_shape = people.images[0].shape

fix, axes = plt.subplots(2, 5, figsize=(15, 8), subplot_kw={'xticks': (), 'yticks': ()})
for target, image, ax in zip(people.target, people.images, axes.ravel()):
    ax.imshow(image)
    ax.set_title(people.target_names[target])
plt.show()

print("форма массива изображений лиц: {}".format(people.images.shape))
print("количество классов: {}".format(len(people.target_names)))

# Вычисляем частоту встречаемости каждого класса
print("Вычисляем частоту встречаемости каждого класса")
counts = np.bincount(people.target)
for i, (count, name) in enumerate(zip(counts, people.target_names)):
    print("{0:25} {1:3}".format(name, count), end=' ')
    if (i + 1) % 3 == 0:
        print()

# Создаем маску для выборки по 50 изображений каждого класса
print("Создаем маску для выборки по 50 изображений каждого класса")
mask = np.zeros(people.target.shape, dtype=bool)
for target in np.unique(people.target):
    mask[np.where(people.target == target)[0][:50]] = 1
X_people = people.data[mask]
y_people = people.target[mask]

# Масштабируем изображения
print("Масштабируем изображения")
X_people = X_people / 255.

# Разделение данных на обучающую и тестовую выборки
print("Разделение данных на обучающую и тестовую выборки")
X_train, X_test, y_train, y_test = train_test_split(X_people, y_people, stratify=y_people, random_state=0)

# Построение и оценка модели KNeighborsClassifier
print("Построение и оценка модели KNeighborsClassifier")
knn = KNeighborsClassifier(n_neighbors=1)
knn.fit(X_train, y_train)
print("Правильность на тестовом наборе для 1-nn: {:.2f}".format(knn.score(X_test, y_test)))

# Применение PCA с отбеливанием и оценка модели KNeighborsClassifier после PCA
print("Применение PCA с отбеливанием и оценка модели KNeighborsClassifier после PCA")
pca = PCA(n_components=100, whiten=True, random_state=0).fit(X_train)
X_train_pca = pca.transform(X_train)
X_test_pca = pca.transform(X_test)

print("обучающие данные после PCA: {}".format(X_train_pca.shape))
knn = KNeighborsClassifier(n_neighbors=1)
knn.fit(X_train_pca, y_train)
print("Правильность на тестовом наборе: {:.2f}".format(knn.score(X_test_pca, y_test)))

print("форма pca.components_: {}".format(pca.components_.shape))

# Визуализация первых 15 главных компонент
print("Визуализация первых 15 главных компонент")
fix, axes = plt.subplots(3, 5, figsize=(15, 12), subplot_kw={'xticks': (), 'yticks': ()})
for i, (component, ax) in enumerate(zip(pca.components_, axes.ravel())):
    ax.imshow(component.reshape(image_shape), cmap='viridis')
    ax.set_title("{}. component".format((i + 1)))
plt.show()

# Визуализация главных компонент лиц
print("Визуализация главных компонент лиц")
mglearn.plots.plot_pca_faces(X_train, X_test, image_shape)
plt.show()

# Визуализация первых двух главных компонент после PCA
print("Визуализация первых двух главных компонент после PCA")
mglearn.discrete_scatter(X_train_pca[:, 0], X_train_pca[:, 1], y_train)
plt.xlabel("Первая главная компонента")
plt.ylabel("Вторая главная компонента")
plt.show()
