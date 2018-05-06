# HapticU3D
Generate haptic feedback on iOS devices (UIFeedbackGenerator) in your U3D games

## Requirements

- iOS 10.0+
- A device with a supported Taptic Engine (iPhone 7 and above).
- System Haptics setting is enabled.

## How to use

- Put OC script 'HapticFeedbackGenerator' in your 'Asset/Plugins/iOS' folder.
- Just call method in your C# script
  ```
  HapticFeedback.Generate(UIFeedbackType type)
  ```
