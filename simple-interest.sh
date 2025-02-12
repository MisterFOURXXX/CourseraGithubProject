#!/bin/bash

# Function to calculate simple interest
calculate_simple_interest() {
  principal="$1"
  rate="$2"
  time="$3"

  # Input validation (check if inputs are numbers)
  if [[ ! "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Principal must be a number."
    return 1
  fi
  if [[ ! "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Rate must be a number."
    return 1
  fi
    if [[ ! "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Time must be a number."
    return 1
  fi


  interest=$(echo "scale=2; $principal * $rate * $time" | bc)
  echo "$interest"
}

# Get input from the user (with prompts)
read -p "Enter the principal amount: " principal
read -p "Enter the annual interest rate (as a decimal): " rate
read -p "Enter the time in years: " time

# Calculate and display the result
interest=$(calculate_simple_interest "$principal" "$rate" "$time")

if [[ $? -eq 0 ]]; then # Check for errors from the function
  echo "The simple interest is: $interest"
fi
