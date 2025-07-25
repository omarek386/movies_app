#!/usr/bin/env python3
"""
Startup script for the Flask ML API server
This will ensure all dependencies are properly configured before starting
"""
import os
import sys
import subprocess

def check_and_install_requirements():
    """Check if all required packages are installed"""
    required_packages = [
        'flask',
        'scikit-learn', 
        'numpy',
        'requests'
    ]
    
    missing_packages = []
    
    for package in required_packages:
        try:
            __import__(package.replace('-', '_'))
            print(f"✅ {package} is installed")
        except ImportError:
            missing_packages.append(package)
            print(f"❌ {package} is missing")
    
    if missing_packages:
        print(f"\nInstalling missing packages: {missing_packages}")
        try:
            subprocess.check_call([sys.executable, '-m', 'pip', 'install'] + missing_packages)
            print("✅ All packages installed successfully")
        except subprocess.CalledProcessError as e:
            print(f"❌ Error installing packages: {e}")
            return False
    
    return True

def main():
    """Main function to start the server"""
    print("🚀 Starting Flask ML Prediction API Server")
    print("=" * 50)
    
    # Check Python version
    python_version = sys.version_info
    print(f"Python version: {python_version.major}.{python_version.minor}.{python_version.micro}")
    
    # Check and install requirements
    if not check_and_install_requirements():
        print("❌ Failed to install requirements")
        return 1
    
    # Import and start the Flask app
    try:
        print("\n🔧 Importing Flask application...")
        from app import app
        
        print("✅ Flask app imported successfully")
        print("🌟 Starting server on http://localhost:5001")
        print("\nTo test the API, you can:")
        print("1. Open another terminal and run: python test_api_client.py")
        print("2. Or use curl: curl http://localhost:5001/test")
        print("3. Or open http://localhost:5001 in your browser")
        print("\nPress Ctrl+C to stop the server")
        print("=" * 50)
        
        # Start the Flask app
        app.run(debug=True, host='0.0.0.0', port=5001)
        
    except KeyboardInterrupt:
        print("\n👋 Server stopped by user")
        return 0
    except Exception as e:
        print(f"❌ Error starting server: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main())
