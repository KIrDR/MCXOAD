import mglearn
import sklearn
import matplotlib.pyplot as plt
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.decomposition import NMF, PCA
from sklearn.datasets import fetch_lfw_people, load_digits
from sklearn.manifold import TSNE

# --- Визуализация принципа работы NMF ---
print("Визуализация принципа работы NMF")
mglearn.plots.plot_nmf_illustration()
plt.show()

# --- Пример применения NMF на наборе данных с лицами ---
# Загрузка набора данных лиц
print("Загрузка набора данных лиц")
people = fetch_lfw_people(min_faces_per_person=20, resize=0.7)
image_shape = people.images[0].shape

# Разделение данных на обучающую и тестовую выборки
print("Разделение данных на обучающую и тестовую выборки")
X_train, X_test, y_train, y_test = train_test_split(
    people.data, people.target, stratify=people.target, random_state=0)

# Применение NMF к обучающей выборке
print("Применение NMF к обучающей выборке")
nmf = NMF(n_components=15, random_state=0)
nmf.fit(X_train)
X_train_nmf = nmf.transform(X_train)
X_test_nmf = nmf.transform(X_test)

# Визуализация компонент NMF
print("Визуализация компонент NMF")
fix, axes = plt.subplots(3, 5, figsize=(15, 12), subplot_kw={'xticks': (), 'yticks': ()})
for i, (component, ax) in enumerate(zip(nmf.components_, axes.ravel())):
    ax.imshow(component.reshape(image_shape))
    ax.set_title("{}. component".format(i))
plt.show()

# Сортировка изображений по 3-й компоненте и визуализация
print("Сортировка изображений по 3-й компоненте и визуализация")
compn = 3
inds = np.argsort(X_train_nmf[:, compn])[::-1]
fig, axes = plt.subplots(2, 5, figsize=(15, 8), subplot_kw={'xticks': (), 'yticks': ()})
for i, (ind, ax) in enumerate(zip(inds, axes.ravel())):
    ax.imshow(X_train[ind].reshape(image_shape))
plt.show()

# Сортировка изображений по 7-й компоненте и визуализация
print("Сортировка изображений по 7-й компоненте и визуализация")
compn = 7
inds = np.argsort(X_train_nmf[:, compn])[::-1]
fig, axes = plt.subplots(2, 5, figsize=(15, 8), subplot_kw={'xticks': (), 'yticks': ()})
for i, (ind, ax) in enumerate(zip(inds, axes.ravel())):
    ax.imshow(X_train[ind].reshape(image_shape))
plt.show()

# --- Пример работы NMF и PCA на синтетических данных ---
print("Пример работы NMF и PCA на синтетических данных")
S = mglearn.datasets.make_signals()
plt.figure(figsize=(6, 1))
plt.plot(S, '-')
plt.xlabel("Время")
plt.ylabel("Сигнал")
plt.show()

A = np.random.RandomState(0).uniform(size=(100, 3))
X = np.dot(S, A.T)
print("Форма измерений: {}".format(X.shape))

nmf = NMF(n_components=3, random_state=42)
S_ = nmf.fit_transform(X)
print("Форма восстановленного сигнала: {}".format(S_.shape))

pca = PCA(n_components=3)
H = pca.fit_transform(X)

models = [X, S, S_, H]
names = ['Наблюдения (первые три измерения)', 'Фактические источники',
         'Сигналы, восстановленные NMF', 'Сигналы, восстановленные PCA']

fig, axes = plt.subplots(4, figsize=(8, 4), gridspec_kw={'hspace': .5},
                         subplot_kw={'xticks': (), 'yticks': ()})
for model, name, ax in zip(models, names, axes):
    ax.set_title(name)
    ax.plot(model[:, :3], '-')
plt.show()

# --- Применение PCA и t-SNE на наборе данных рукописных цифр ---
print("Применение PCA и t-SNE на наборе данных рукописных цифр")
digits = load_digits()

# Визуализация примеров изображений цифр
print("Визуализация примеров изображений цифр")
fig, axes = plt.subplots(2, 5, figsize=(10, 5), subplot_kw={'xticks': (), 'yticks': ()})
for ax, img in zip(axes.ravel(), digits.images):
    ax.imshow(img)
plt.show()

# Применение PCA для сокращения размерности данных рукописных цифр
print("Применение PCA для сокращения размерности данных рукописных цифр")
pca = PCA(n_components=2)
pca.fit(digits.data)
digits_pca = pca.transform(digits.data)

# Визуализация первых двух компонент PCA
print("Визуализация первых двух компонент PCA")
colors = ["#476A2A", "#7851B8", "#BD3430", "#4A2D4E", "#875525", "#A83683", "#4E655E", "#853541", "#3A3120", "#535D8E"]
plt.figure(figsize=(10, 10))
plt.xlim(digits_pca[:, 0].min(), digits_pca[:, 0].max())
plt.ylim(digits_pca[:, 1].min(), digits_pca[:, 1].max())
for i in range(len(digits.data)):
    plt.text(digits_pca[i, 0], digits_pca[i, 1],
             str(digits.target[i]),
             color=colors[digits.target[i]],
             fontdict={'weight': 'bold', 'size': 9})
plt.xlabel("Первая главная компонента")
plt.ylabel("Вторая главная компонента")
plt.show()

# Применение t-SNE для визуализации данных рукописных цифр
print("Применение t-SNE для визуализации данных рукописных цифр")
tsne = TSNE(random_state=42)
digits_tsne = tsne.fit_transform(digits.data)

# Визуализация t-SNE
print("Визуализация t-SNE")
plt.figure(figsize=(10, 10))
plt.xlim(digits_tsne[:, 0].min(), digits_tsne[:, 0].max() + 1)
plt.ylim(digits_tsne[:, 1].min(), digits_tsne[:, 1].max() + 1)
for i in range(len(digits.data)):
    plt.text(digits_tsne[i, 0], digits_tsne[i, 1],
             str(digits.target[i]),
             color=colors[digits.target[i]],
             fontdict={'weight': 'bold', 'size': 9})
plt.xlabel("t-SNE признак 0")
plt.ylabel("t-SNE признак 1")
plt.show()
