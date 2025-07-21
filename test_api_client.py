#!/usr/bin/env python3
"""
Test client for the Flask ML API
This script will test the /predict endpoint with the same data that Flutter is sending
"""
import requests
import json

def test_api():
    """Test the ML prediction API"""
    
    # API endpoint
    url = "http://localhost:5001/predict"
    
    # Test data - same format as Flutter app is sending
    test_data = {
        "features": [0, 1, 1, 0, 0]
    }
    
    print("Testing ML Prediction API")
    print(f"URL: {url}")
    print(f"Data: {test_data}")
    print("-" * 50)
    
    try:
        # Make the request
        headers = {'Content-Type': 'application/json'}
        response = requests.post(url, json=test_data, headers=headers, timeout=10)
        
        print(f"Status Code: {response.status_code}")
        print(f"Response Headers: {dict(response.headers)}")
        print(f"Response Body: {response.text}")
        
        if response.status_code == 200:
            result = response.json()
            print(f"✅ SUCCESS: Prediction = {result.get('prediction')}")
            if 'probabilities' in result:
                print(f"📊 Probabilities = {result.get('probabilities')}")
        else:
            print(f"❌ ERROR: {response.status_code}")
            try:
                error_details = response.json()
                print(f"Error details: {error_details}")
            except:
                print(f"Raw error response: {response.text}")
                
    except requests.exceptions.ConnectionError:
        print("❌ CONNECTION ERROR: Flask server is not running")
        print("Please start the Flask server first by running: python app.py")
    except requests.exceptions.Timeout:
        print("❌ TIMEOUT ERROR: Request timed out")
    except Exception as e:
        print(f"❌ UNEXPECTED ERROR: {e}")

def test_other_endpoints():
    """Test other API endpoints"""
    
    endpoints = [
        ("GET", "http://localhost:5001/", "Home page"),
        ("GET", "http://localhost:5001/test", "Test endpoint"),
        ("GET", "http://localhost:5001/predict/help", "Help endpoint")
    ]
    
    print("\n" + "=" * 50)
    print("Testing other endpoints...")
    print("=" * 50)
    
    for method, url, description in endpoints:
        try:
            if method == "GET":
                response = requests.get(url, timeout=5)
            else:
                response = requests.post(url, timeout=5)
                
            print(f"✅ {description}: {response.status_code}")
            if response.status_code == 200:
                try:
                    result = response.json()
                    print(f"   Response: {result}")
                except:
                    print(f"   Response: {response.text[:100]}...")
        except requests.exceptions.ConnectionError:
            print(f"❌ {description}: Server not running")
        except Exception as e:
            print(f"❌ {description}: {e}")

if __name__ == "__main__":
    print("🚀 ML API Test Client")
    print("=" * 50)
    
    # Test the main prediction endpoint
    test_api()
    
    # Test other endpoints
    test_other_endpoints()
    
    print("\n" + "=" * 50)
    print("Test completed!")
    print("If you see connection errors, make sure to:")
    print("1. Run 'python app.py' in another terminal first")
    print("2. Wait for the server to start (you should see 'Running on http://0.0.0.0:5001')")
    print("3. Then run this test script again")
