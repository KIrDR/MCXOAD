import random
import numpy as np

class HammingCode:
    def __init__(self, message):
        self.message = message
        self.binary_message = self.convert_to_binary()
        self.k = len(self.binary_message)
        self.r = self.calculate_r()
        self.n = self.k + self.r
        self.H = self.generate_h_matrix()

    def convert_to_binary(self):
        binary_message = ''.join(format(ord(char), '08b') for char in self.message)
        return binary_message

    def calculate_r(self):
        r = 1
        while 2**r < self.k + r + 1:
            r += 1
        return r

    def generate_h_matrix(self):
        H = np.zeros((self.r, self.n), dtype=int)
        for i in range(self.r):
            for j in range(self.n):
                if (j+1) & (1 << i):
                    H[i, j] = 1
        return H

    def calculate_parity(self, message):
        parity = []
        for i in range(self.r):
            sum_ = 0
            for j in range(self.n):
                if j < len(message):
                    if self.H[i][j] == 1:
                        sum_ += int(message[j])
            parity.append(sum_ % 2)
        return ''.join(map(str, parity))

    def introduce_error(self, num_errors):
        error_indices = random.sample(range(self.n), num_errors)
        corrupted_message = list(self.binary_message)
        for index in error_indices:
            corrupted_message[index] = '1' if corrupted_message[index] == '0' else '0'
        return ''.join(corrupted_message)

    def correct_errors(self, received_message):
        syndrome = self.calculate_parity(received_message)
        error_vector = [int(bit) for bit in syndrome]
        error_index = sum([error_vector[i] * 2 ** i for i in range(len(error_vector))])
        if error_index != 0 and error_index <= len(received_message):
            received_message = list(received_message)
            received_message[error_index - 1] = '1' if received_message[error_index - 1] == '0' else '0'
            received_message = ''.join(received_message)
        return received_message, error_index


# Пример использования
if __name__ == "__main__":
    message = "Z"
    hamming = HammingCode(message)
    print("Исходное сообщение (в двоичном виде):", hamming.binary_message)
    print("Количество информационных битов (k):", hamming.k)
    print("Количество проверочных битов (r):", hamming.r)
    print("Общее количество битов (n):", hamming.n)
    print("Проверочная матрица Хемминга:")
    print(hamming.H)

    num_errors = 1
    corrupted_message = hamming.introduce_error(num_errors)
    print("Сообщение с внесенными ошибками:", corrupted_message)

    corrected_message, error_index = hamming.correct_errors(corrupted_message)
    if error_index == 0:
        print("Ошибок не обнаружено.")
    else:
        print("Обнаружена и исправлена ошибка в позиции:", error_index)
        print("Исправленное сообщение:", corrected_message)
