workflow "Test Project" {
  on = "push"
  resolves = ["Test"]
}

action "jclem/action-mix/deps.get@v1.3.3" {
  uses = "jclem/action-mix/deps.get@v1.3.3"
  args = "deps.get"
}

action "Test" {
  uses = "jclem/action-mix/test@v1.3.3"
  needs = ["jclem/action-mix/deps.get@v1.3.3"]
  args = "test"
  env = {
    MIX_ENV = "test"
  }
}
