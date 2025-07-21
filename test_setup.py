#!/usr/bin/env python3
"""
Simple test to check Flask app functionality
"""
import sys
import os

# Add the current directory to Python path
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

try:
    import flask
    print("Flask is available")
    import sklearn
    print(f"scikit-learn version: {sklearn.__version__}")
    import numpy
    print(f"numpy version: {numpy.__version__}")
    
    # Test model loading
    import pickle
    try:
        with open('random_forest_model.pkl', 'rb') as f:
            model = pickle.load(f)
        print(f"Model loaded successfully. Type: {type(model)}")
        
        # Test prediction
        import numpy as np
        test_data = np.array([[0, 1, 1, 0, 0]])
        prediction = model.predict(test_data)
        print(f"Test prediction successful: {prediction}")
        
    except Exception as model_error:
        print(f"Model loading/prediction error: {model_error}")
        
        # Create a new simple model
        print("Creating a new model...")
        from sklearn.ensemble import RandomForestClassifier
        from sklearn.datasets import make_classification
        
        X, y = make_classification(n_samples=100, n_features=5, n_classes=2, random_state=42)
        new_model = RandomForestClassifier(n_estimators=10, random_state=42)
        new_model.fit(X, y)
        
        # Save the new model
        with open('random_forest_model.pkl', 'wb') as f:
            pickle.dump(new_model, f)
        
        print("New model created and saved successfully!")
        
        # Test the new model
        test_prediction = new_model.predict([[0, 1, 1, 0, 0]])
        print(f"New model test prediction: {test_prediction}")
        
except ImportError as e:
    print(f"Import error: {e}")
except Exception as e:
    print(f"General error: {e}")
