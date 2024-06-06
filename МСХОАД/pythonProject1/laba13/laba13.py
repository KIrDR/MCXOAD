import mglearn
import sklearn
import matplotlib.pyplot as plt

# Визуализация различных способов масштабирования данных
print("Демонстрация различных способов масштабирования данных:")
mglearn.plots.plot_scaling()
plt.show()

from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split

# Загрузка данных и разделение на обучающий и тестовый наборы
print("Загрузка данных о раке молочной железы и разделение на обучающую и тестовую выборки:")
cancer = load_breast_cancer()
X_train, X_test, y_train, y_test = train_test_split(cancer.data, cancer.target, random_state=1)
print(X_train.shape)
print(X_test.shape)

from sklearn.preprocessing import MinMaxScaler

# Инициализация MinMaxScaler
print("Инициализация MinMaxScaler:")
scaler = MinMaxScaler()

# Обучение масштабировщика на обучающих данных
print("Обучение масштабировщика на обучающих данных:")
scaler.fit(X_train)

# Масштабирование обучающих данных
print("Масштабирование обучающих данных:")
min_on_training = X_train.min(axis=0)
range_on_training = (X_train - min_on_training).max(axis=0)
X_train_scaled = (X_train - min_on_training) / range_on_training
print("форма преобразованного массива: {}".format(X_train_scaled.shape))
print("min значение признака до масштабирования:\n {}".format(X_train.min(axis=0)))
print("max значение признака до масштабирования:\n {}".format(X_train.max(axis=0)))
print("min значение признака после масштабирования:\n {}".format(X_train_scaled.min(axis=0)))
print("max значение признака после масштабирования:\n {}".format(X_train_scaled.max(axis=0)))

# Масштабирование тестовых данных
print("Масштабирование тестовых данных:")
X_test_scaled = (X_test - min_on_training) / range_on_training
print("min значение признака после масштабирования:\n{}".format(X_test_scaled.min(axis=0)))
print("max значение признака после масштабирования:\n{}".format(X_test_scaled.max(axis=0)))

from sklearn.datasets import make_blobs
X, _ = make_blobs(n_samples=50, centers=5, random_state=4, cluster_std=2)
X_train, X_test = train_test_split(X, random_state=5, test_size=.1)

# Визуализация исходных и масштабированных данных
print("Визуализация исходных и масштабированных данных:")
fig, axes = plt.subplots(1, 3, figsize=(13, 4))
axes[0].scatter(X_train[:, 0], X_train[:, 1], c=mglearn.cm2(0), label="Обучающий набор", s=60)
axes[0].scatter(X_test[:, 0], X_test[:, 1], marker='^', c=mglearn.cm2(1), label="Тестовый набор", s=60)
axes[0].legend(loc='upper left')
axes[0].set_title("Исходные данные")

scaler = MinMaxScaler()
scaler.fit(X_train)
X_train_scaled = scaler.transform(X_train)
X_test_scaled = scaler.transform(X_test)

axes[1].scatter(X_train_scaled[:, 0], X_train_scaled[:, 1], c=mglearn.cm2(0), label="Обучающий набор", s=60)
axes[1].scatter(X_test_scaled[:, 0], X_test_scaled[:, 1], marker='^', c=mglearn.cm2(1), label="Тестовый набор", s=60)
axes[1].set_title("Масштабированные данные")

test_scaler = MinMaxScaler()
test_scaler.fit(X_test)
X_test_scaled_badly = test_scaler.transform(X_test)
axes[2].scatter(X_train_scaled[:, 0], X_train_scaled[:, 1], c=mglearn.cm2(0), label="Обучающий набор", s=60)
axes[2].scatter(X_test_scaled_badly[:, 0], X_test_scaled_badly[:, 1], marker='^', c=mglearn.cm2(1), label="Тестовый набор", s=60)
axes[2].set_title("Неправильно масштабированные данные")

for ax in axes:
    ax.set_xlabel("Признак 0")
    ax.set_ylabel("Признак 1")
plt.show()

from sklearn.preprocessing import StandardScaler

# Сравнение методов fit и fit_transform
print("Сравнение методов fit и fit_transform при стандартизации данных:")
scaler = StandardScaler()
X_scaled = scaler.fit(X).transform(X)
X_scaled_d = scaler.fit_transform(X)

from sklearn.svm import SVC

# Обучение модели SVM на немасштабированных данных
print("Обучение модели SVM на немасштабированных данных:")
X_train, X_test, y_train, y_test = train_test_split(cancer.data, cancer.target, random_state=0)
svm = SVC(C=100)
svm.fit(X_train, y_train)
print("Правильность на тестовом наборе: {:.2f}".format(svm.score(X_test, y_test)))

# Обучение модели SVM на данных, масштабированных с помощью MinMaxScaler
print("Обучение модели SVM на данных, масштабированных с помощью MinMaxScaler:")
scaler = MinMaxScaler()
scaler.fit(X_train)
X_train_scaled = scaler.transform(X_train)
X_test_scaled = scaler.transform(X_test)
svm.fit(X_train_scaled, y_train)
print("Правильность на масштабированном тестовом наборе: {:.2f}".format(svm.score(X_test_scaled, y_test)))

# Обучение модели SVM на данных, масштабированных с помощью StandardScaler
print("Обучение модели SVM на данных, масштабированных с помощью StandardScaler:")
scaler = StandardScaler()
scaler.fit(X_train)
X_train_scaled = scaler.transform(X_train)
X_test_scaled = scaler.transform(X_test)
svm.fit(X_train_scaled, y_train)
print("Правильность SVM на тестовом наборе: {:.2f}".format(svm.score(X_test_scaled, y_test)))
