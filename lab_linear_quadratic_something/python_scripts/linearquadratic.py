import numpy as np
import matplotlib.pyplot as plt


class LinearQuadraticProblem:

    def __init__(self, N=100, F=10.0, A=1, B=1, x_0=10, eps=0.0001, Q=9, R=15,
                 is_finite=False):
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
        self.no_of_iterations = N
        self.eigen = []

    def calculate_k(self):
        i = self.N - 2
        while i > 0:
            self.K.insert(0, self.A * (self.K[0] - self.K[0] * self.B *
                                       (1/(self.R + self.B * self.K[0] *
                                           self.B)) * self.B * self.K[0]) *
                          self.A + self.Q)

            if not self.is_finite:
                if abs(self.K[0] - self.K[1]) < self.eps:
                    self.no_of_iterations = self.N - i
                    break
            i -= 1

    def calculate_performance_index(self):
        self.J = 0.5 * self.x[0] * self.K[1] * self.x[0]

    def calculate_control_and_state(self):
        for i in range(self.no_of_iterations - 2):
            temp = -(1/(self.R + self.B * self.K[i + 1] * self.B)) * self.B * \
                   self.K[i + 1]
            self.u.append(temp * self.A * self.x[i])
            self.x.append(self.A * self.x[i] + self.B * self.u[i])
            self.eigen.append((1+temp)/self.A)
        self.u.append(-(1 / (self.R + self.B * self.K[self.no_of_iterations - 2]
                             * self.B)) * self.B *
                      self.K[self.no_of_iterations - 2] * self.A *
                      self.x[self.no_of_iterations - 2])
        print(self.eigen)

    def plot_results(self):
        plt.subplot(121)
        plt.plot(self.u)
        plt.xlabel("iteration")
        plt.ylabel("value")
        plt.title("control variable, Q = " + str(self.Q) + ", R =" + str(self.R))
        plt.subplot(122)
        plt.plot(self.x)
        plt.xlabel("iteration")
        plt.title("trajectory, finite = " + str(self.is_finite))
        # plt.show()
        plt.savefig("finite_{}_Q_{}_R_{}".format(self.is_finite, self.Q, self.R))
        plt.close()
