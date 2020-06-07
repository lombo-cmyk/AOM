from linearquadratic import LinearQuadraticProblem as LQP
def main():
    problem = LQP()
    problem.calculate_k()
    problem.calculate_performance_index()
    problem.calculate_control_and_state()
    dupa = 123


if __name__ == "__main__":
    main()
