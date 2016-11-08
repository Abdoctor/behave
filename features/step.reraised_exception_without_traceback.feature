Feature: Failing step which can lead to stop behave

  @failing
  Scenario: Run stopping behave scenario
    Given an empty file named "behave.ini"
    Given a file named "features/environment.py" with:
        """
        from behave.model_core import Status

        def after_step(context, step):
            step.status = Status.passed
            context.exception = step.exception
        """
    And a file
    When I run a special failing test
    Then this step must be executed
