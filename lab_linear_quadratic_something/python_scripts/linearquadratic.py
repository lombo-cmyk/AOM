import numpy as np


class LinearQuadraticProblem:

    def __init__(self):
        self.n, self.r = 1, 1
        self.N = 20
        self.i = 20
        self.F = 0
        self.Q = np.array([[9, -18], [-18, 36]])
        self.A = np.array([[1, 0], [0, 3]])
        self.K = np.zeros((self.A.shape[0], self.A.shape[0], self.N))
        self.B = np.array([[1], [2]])
        self.R = 15
        self.dupa = np.zeros((2, 1, self.N))
        self.dupa[:, :, 0] = [[10], [15]]
        self.u = np.zeros(self.N)
        self.J = 0

    def calculate_k(self):
        for i in range(self.N - 2, -1, -1):
            self.K[:, :, i] = self.A.transpose() @ (self.K[:, :, i + 1] -
                              self.K[:, :, i + 1] @ self.B @ np.linalg.inv(
                              self.R + self.B.transpose() @ self.K[:, :, i + 1]
                              @ self.B) @ self.B.transpose() @
                              self.K[:, :, i + 1]) @ self.A + self.Q

    def calculate_performance_index(self):
        self.J = 0.5 * self.dupa[:, :, 0].transpose() @ self.K[:, :, 1] @ \
                 self.dupa[:, :, 0]

    def calculate_control_and_state(self):
        for i in range(self.N - 1):
            self.u[i] = -np.linalg.inv(self.R + self.B.transpose() @
                        self.K[:, :, i + 1] @ self.B) @ self.B.transpose() @ \
                        self.K[:, :, i + 1] @ self.A @ self.dupa[:, :, i]
            # J = J + 0.5 * ((3 * x[0, :, i] - 6 * x[1, :, i]) ** 2 + 15 * u[i] ** 2)
            self.dupa[:, :, i + 1] = self.A @ self.dupa[:, :, i] + self.B * self.u[i]
