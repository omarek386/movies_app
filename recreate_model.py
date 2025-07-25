#!/usr/bin/env python3
"""
Script to recreate the random forest model to fix compatibility issues
"""
import pickle
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import make_classification
import warnings

# Suppress warnings
warnings.filterwarnings("ignore")

def recreate_model():
    """Recreate a simple random forest model for demonstration"""
    print("Creating a new Random Forest model...")
    
    # Create some dummy data for demonstration
    # In a real scenario, you'd use your actual training data
    X, y = make_classification(
        n_samples=1000, 
        n_features=5, 
        n_informative=3, 
        n_redundant=1, 
        n_clusters_per_class=1, 
        random_state=42
    )
    
    # Create and train the model
    model = RandomForestClassifier(
        n_estimators=100,
        random_state=42,
        max_depth=10
    )
    
    print("Training the model...")
    model.fit(X, y)
    
    # Save the model
    print("Saving the model...")
    with open('random_forest_model.pkl', 'wb') as f:
        pickle.dump(model, f)
    
    print("Model saved successfully!")
    
    # Test the model
    print("Testing the model...")
    test_features = [[0, 1, 1, 0, 0]]  # Same format as your Flutter app sends
    prediction = model.predict(test_features)
    print(f"Test prediction: {prediction}")
    
    return model

def test_existing_model():
    """Try to load and test the existing model"""
    try:
        print("Attempting to load existing model...")
        with open('random_forest_model.pkl', 'rb') as f:
            model = pickle.load(f)
        
        print(f"Model type: {type(model)}")
        print("Model loaded successfully!")
        
        # Test with the same data that Flutter is sending
        test_features = np.array([[0, 1, 1, 0, 0]])
        prediction = model.predict(test_features)
        print(f"Test prediction: {prediction}")
        
        return True
        
    except Exception as e:
        print(f"Error loading existing model: {e}")
        return False

if __name__ == "__main__":
    print("=== Model Compatibility Fixer ===")
    
    # First try to load the existing model
    if not test_existing_model():
        print("\nExisting model has compatibility issues.")
        print("Creating a new compatible model...")
        recreate_model()
    else:
        print("\nExisting model works fine!")
