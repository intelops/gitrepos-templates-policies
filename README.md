# gitrepos-templates-policies
Templates repo to use to create and apply for all existing and new repos. this repo should have only repository templatization, github actions to run, security policies, etc. which should be replicated in all the project repos.


## Pre-Commit hooks to be installed in all the repos

Pre-commit hooks are automated checks integrated into the version control process, typically in software development using systems like Git. These hooks are scripts that run automatically before a commit is finalized, effectively serving as a gatekeeper to ensure certain conditions are met before code changes are committed to the repository.

**Advantages of Using Pre-commit Hooks**:

- **Code Quality Control**: They enforce code standards and style guidelines, ensuring that all code committed adheres to the project's quality requirements.

- **Automated Testing**: They can run automated tests, catching bugs or issues early in the development process before they become more costly and time-consuming to fix.

- **Efficient Workflow**: By catching errors and issues early, they streamline the development workflow, reducing the need for extensive reviews and corrections later in the process.

- **Consistency Across the Team**: They help maintain consistency in code across different team members, ensuring everyone adheres to the same set of rules and standards.

- **Reduced Human Error**: As automated checks, they minimize the chances of human error, such as forgetting to run tests or check code style manually.

- **Time-Saving**: They save developers' time by automating routine checks, allowing them to focus on more complex and creative aspects of software development.

- **Easy Integration with Continuous Integration (CI) Systems**: Pre-commit hooks can be easily integrated with CI/CD pipelines, enhancing the overall efficiency and robustness of the software development process.

### Installing pre-commit framework locally

[pre-commit](https://pre-commit.com/) is a framework for managing and maintaining multi-language pre-commit hooks. The pre-commit framework enhances the efficiency of Git hook scripts by automating the detection of common code issues like syntax errors or trailing whitespace prior to code review, allowing reviewers to focus on structural aspects rather than stylistic details. It addresses the challenge of sharing hooks across various projects by providing a multi-language package manager that simplifies the installation and execution of hooks, regardless of the programming language. This system is designed to work without root access and manages dependencies, such as automatically handling the installation of necessary languages or tools (like node for JavaScript files), streamlining the process for developers.

Installing the pre-commit framework is straightforward, as outlined in the [official documntation](https://pre-commit.com/#install).It's as simple as executing the command:

```shell
$ pip install pre-commit
```

Ensure that you have **Python** and **Pip** installed on your local machine.


After installing `pre-commit` on your system, developers must create a configuration file to specify which hooks should be triggered during a commit. It should be a *Dotfile* file and be named `.pre-commit-config.yaml` exactly. Once, the config file is ready and placed in your projects root, we need to install the hooks in the `./git/hooks` directory of out project. We can do this by passing a simple command:

```shell
$ pre-commit install

pre-commit installed at .git/hooks/pre-commit  # The output
``` 

Now, all the hooks will be triggered when we commit. Few sample templates for this configuration file, tailored to various languages, can be found in the [`./config`](./config/) directory. Developers should select the appropriate language-specific template and place it in the root directory of their project. At present, we provide support for [**Golang**](./config/golang/pre-commit-config.yaml), [**Python**](./config/python/), [**JavaScript/NodeJS**](./config/nodejs/),  and [**IaC configurations**](./config/iac/) for Dockerfile, Terraform, etc.


## TODO

- Add Github Action with *pre-merge* hooks
