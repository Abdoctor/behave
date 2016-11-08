from behave import when, then
import copy


@when('I run a special failing test')
def step_run_failing_test(context):
    exception = ZeroDivisionError('integer division or modulo by zero')
    exception.__cause__ = copy.copy(exception)
    raise exception


@then('this step must be executed')
def step_check_step(context):
    pass

