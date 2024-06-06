import mglearn
import sklearn
import matplotlib.pyplot as plt
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.datasets import make_blobs, make_moons
from sklearn.cluster import KMeans

# --- Визуализация алгоритма KMeans ---
print("Визуализация алгоритма KMeans")
mglearn.plots.plot_kmeans_algorithm()
plt.show()

# --- Визуализация границ кластеров KMeans ---
print("Визуализация границ кластеров KMeans")
mglearn.plots.plot_kmeans_boundaries()
plt.show()

# --- Генерация синтетических двумерных данных ---
print("Генерация синтетических двумерных данных")
X, y = make_blobs(random_state=1)

# --- Применение KMeans для кластеризации (3 кластера) ---
print("Применение KMeans для кластеризации (3 кластера)")
kmeans = KMeans(n_clusters=3)
kmeans.fit(X)
print("Принадлежность к кластерам:\n{}".format(kmeans.labels_))

# --- Визуализация кластеров и центров кластеров ---
print("Визуализация кластеров и центров кластеров")
mglearn.discrete_scatter(X[:, 0], X[:, 1], kmeans.labels_, markers='o')
mglearn.discrete_scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1],
                         [0, 1, 2], markers='^', markeredgewidth=2)
plt.show()

# --- Влияние числа кластеров на результат кластеризации ---
fig, axes = plt.subplots(1, 2, figsize=(10, 5))

# Кластеризация с двумя кластерами
print("Кластеризация с двумя кластерами")
kmeans = KMeans(n_clusters=2)
kmeans.fit(X)
assignments = kmeans.labels_
mglearn.discrete_scatter(X[:, 0], X[:, 1], assignments, ax=axes[0])

# Кластеризация с пятью кластерами
print("Кластеризация с пятью кластерами")
kmeans = KMeans(n_clusters=5)
kmeans.fit(X)
assignments = kmeans.labels_
mglearn.discrete_scatter(X[:, 0], X[:, 1], assignments, ax=axes[1])

plt.show()

# --- Генерация данных с различными стандартными отклонениями кластеров ---
print("Генерация данных с различными стандартными отклонениями кластеров")
X_varied, y_varied = make_blobs(n_samples=200, cluster_std=[1.0, 2.5, 0.5], random_state=170)

# Кластеризация данных с различными стандартными отклонениями
print("Кластеризация данных с различными стандартными отклонениями")
y_pred = KMeans(n_clusters=3, random_state=0).fit_predict(X_varied)

# Визуализация результатов кластеризации
print("Визуализация результатов кластеризации")
mglearn.discrete_scatter(X_varied[:, 0], X_varied[:, 1], y_pred)
plt.legend(["кластер 0", "кластер 1", "кластер 2"], loc='best')
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()

# --- Генерация вытянутых данных для кластеризации ---
print("Генерация вытянутых данных для кластеризации")
X, y = make_blobs(random_state=170, n_samples=600)
rng = np.random.RandomState(74)
transformation = rng.normal(size=(2, 2))
X = np.dot(X, transformation)

# Кластеризация вытянутых данных
print("Кластеризация вытянутых данных")
kmeans = KMeans(n_clusters=3)
kmeans.fit(X)
y_pred = kmeans.predict(X)

# Визуализация результатов кластеризации вытянутых данных
print("Визуализация результатов кластеризации вытянутых данных")
plt.scatter(X[:, 0], X[:, 1], c=y_pred, cmap=mglearn.cm3)
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1],
            marker='^', c=[0, 1, 2], s=100, linewidth=2, cmap=mglearn.cm3)
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()

# --- Генерация синтетических данных two_moons ---
print("Генерация синтетических данных two_moons")
X, y = make_moons(n_samples=200, noise=0.05, random_state=0)

# Кластеризация данных two_moons
print("Кластеризация данных two_moons")
kmeans = KMeans(n_clusters=2)
kmeans.fit(X)
y_pred = kmeans.predict(X)

# Визуализация результатов кластеризации two_moons
print("Визуализация результатов кластеризации two_moons")
plt.scatter(X[:, 0], X[:, 1], c=y_pred, cmap=mglearn.cm2, s=60)
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1],
            marker='^', c=[mglearn.cm2(0), mglearn.cm2(1)], s=100, linewidth=2)
plt.xlabel("Признак 0")
plt.ylabel("Признак 1")
plt.show()
