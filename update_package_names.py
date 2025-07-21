#!/usr/bin/env python3
"""
Script to update all Dart files from movies_app to weather_app package references
"""
import os
import re

def update_dart_imports(directory):
    """Update all Dart files in the directory to use weather_app instead of movies_app"""
    updated_files = []
    
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.dart'):
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    # Replace movies_app with weather_app in import statements
                    original_content = content
                    content = re.sub(
                        r'import\s+[\'"]package:movies_app/',
                        'import \'package:weather_app/',
                        content
                    )
                    
                    if content != original_content:
                        with open(file_path, 'w', encoding='utf-8') as f:
                            f.write(content)
                        updated_files.append(file_path)
                        print(f"Updated: {file_path}")
                        
                except Exception as e:
                    print(f"Error updating {file_path}: {e}")
    
    return updated_files

def main():
    print("=== Package Name Update Script ===")
    print("Updating all Dart files from 'movies_app' to 'weather_app'...")
    
    # Update lib directory
    lib_directory = "lib"
    if os.path.exists(lib_directory):
        updated_files = update_dart_imports(lib_directory)
        print(f"\nUpdated {len(updated_files)} Dart files in lib/ directory")
    else:
        print("lib/ directory not found")
    
    # Update test directory
    test_directory = "test"
    if os.path.exists(test_directory):
        updated_test_files = update_dart_imports(test_directory)
        print(f"Updated {len(updated_test_files)} Dart files in test/ directory")
        updated_files.extend(updated_test_files)
    else:
        print("test/ directory not found")
    
    print(f"\n✅ Total files updated: {len(updated_files) if 'updated_files' in locals() else 0}")
    print("Package name update completed!")

if __name__ == "__main__":
    main()
