import numpy as np


class LinearQuadraticProblem:

    def __init__(self, N=100, F=10.0, Q=9, A=1, B=1, R=15, x_0=10,
                 is_finite=True, eps=0.0001):
        self.N = N
        self.F = F
        self.Q = Q
        self.A = A
        self.K = [self.F]
        self.B = B
        self.R = R
        self.x = [x_0]
        self.u = []
        self.J = 0
        self.is_finite = is_finite
        self.eps = eps
        self.number_of_iterations = N

    def calculate_k(self):
        i = self.N - 2
        while i > 0:
            self.K.insert(0, self.A * (self.K[0] - self.K[0] * self.B *
                                       (1/(self.R + self.B * self.K[0] *
                                           self.B)) * self.B * self.K[0]) *
                          self.A + self.Q)

            if not self.is_finite:
                if abs(self.K[0] - self.K[1]) < self.eps:
                    self.number_of_iterations = self.N - i
                    break
            i -= 1

    def calculate_performance_index(self):
        self.J = 0.5 * self.x[0] * self.K[1] * self.x[0]

    def calculate_control_and_state(self):
        for i in range(self.number_of_iterations - 2):
            self.u.append(-(1/(self.R + self.B *
                        self.K[i + 1] * self.B)) * self.B * self.K[i + 1] *
                        self.A * self.x[i])
            self.x.append(self.A * self.x[i] + self.B * self.u[i])

