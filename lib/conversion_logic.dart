// conversion_logic.dart

class ConversionLogic {
  double convertLength(double value, String fromUnit, String toUnit) {
    double valueInMeters = 0.0;

    // Convert input value to meters
    if (fromUnit == 'Meters') {
      valueInMeters = value;
    } else if (fromUnit == 'Kilometers') {
      valueInMeters = value * 1000;
    } else if (fromUnit == 'Miles') {
      valueInMeters = value * 1609.34;
    } else if (fromUnit == 'Feet') {
      valueInMeters = value * 0.3048;
    }

    // Convert from meters to target unit
    if (toUnit == 'Meters') {
      return valueInMeters;
    } else if (toUnit == 'Kilometers') {
      return valueInMeters / 1000;
    } else if (toUnit == 'Miles') {
      return valueInMeters / 1609.34;
    } else if (toUnit == 'Feet') {
      return valueInMeters / 0.3048;
    }

    return value; // Default return for same-unit case
  }


  double convertWeight(double value, String fromUnit, String toUnit) {
    double valueInKilograms = 0.0;

    // Convert input value to kilograms
    if (fromUnit == 'Kilograms') {
      valueInKilograms = value;
    } else if (fromUnit == 'Pounds') {
      valueInKilograms = value / 2.20462;
    } else if (fromUnit == 'Grams') {
      valueInKilograms = value / 1000;
    }

    // Convert from kilograms to target unit
    if (toUnit == 'Kilograms') {
      return valueInKilograms;
    } else if (toUnit == 'Pounds') {
      return valueInKilograms * 2.20462;
    } else if (toUnit == 'Grams') {
      return valueInKilograms * 1000;
    }

    return value; // Default return for same-unit case
  }

  double convertTemperature(double value, String fromUnit, String toUnit) {
    if (fromUnit == toUnit) return value; // If the units are the same, return the value

    if (fromUnit == 'Celsius') {
      if (toUnit == 'Fahrenheit') {
        return (value * 9 / 5) + 32;
      } else if (toUnit == 'Kelvin') {
        return value + 273.15;
      }
    } else if (fromUnit == 'Fahrenheit') {
      if (toUnit == 'Celsius') {
        return (value - 32) * 5 / 9;
      } else if (toUnit == 'Kelvin') {
        return (value - 32) * 5 / 9 + 273.15;
      }
    } else if (fromUnit == 'Kelvin') {
      if (toUnit == 'Celsius') {
        return value - 273.15;
      } else if (toUnit == 'Fahrenheit') {
        return (value - 273.15) * 9 / 5 + 32;
      }
    }

    return value; // Default return if no conversion matches
  }

}
