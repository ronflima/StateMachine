# What is State Machine?

State machine is a small library written for iOS whose idea is to work as a companion of view controllers.
View controllers are the ones who hold the workflow execution of a given view hierachy and they must control, also,
the user interface states and state transitions. 

## What problem does it try to solve?

Cocoa Touch does not specify how to handle state transitions and state workflows. There is no standardization and
sometimes you catch up writing the same workflow code over and over again. 

The idea behind this small library is to give a standard way to handle workflows in a simple manner. It is not the 
intention of this library to solve every single possibility, but to solve common implementations.

# Proposed Architecture and Design Patterns

State Machine try to follow standard architecture and design patterns used by Cocoa Touch: delegation, adapters, etc. 


