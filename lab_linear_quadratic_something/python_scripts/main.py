from linearquadratic import LinearQuadraticProblem as LQP

def main():
    _is_finite = False
    for _Q in [3, 6, 9]:
        for _R in [2, 7, 11]:
                problem = LQP(Q=_Q, R=_R, is_finite = _is_finite)
                problem.calculate_k()
                problem.calculate_performance_index()
                problem.calculate_control_and_state()
                problem.plot_results()


if __name__ == "__main__":
    main()
