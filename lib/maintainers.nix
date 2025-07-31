{ ... } @ args:

let
  # Simple maintainer definition
  maintainers = {
    # You can add your own maintainer info here
    user = {
      name = "Your Name";
      email = "your.email@example.com";
      github = "your-github-username";
    };
  };
  
in {
  inherit maintainers;
} 