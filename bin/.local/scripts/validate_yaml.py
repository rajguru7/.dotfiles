#!/usr/bin/env python3
import yaml
import sys
#yaml.safe_load(sys.stdin.read().rstrip())      #Either is fine since 
yaml.safe_load(sys.stdin)                       #yaml.load accepts a byte string, a Unicode string(sys.stdin.read()), an open binary file object (sys.stdin), or an open text file object. Refer <https://pyyaml.org/wiki/PyYAMLDocumentation>
