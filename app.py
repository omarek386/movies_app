from flask import Flask, request, jsonify
import pickle
import numpy as np
import warnings
from sklearn.exceptions import InconsistentVersionWarning
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import make_classification

app = Flask(__name__)

# Suppress sklearn version warnings
warnings.filterwarnings("ignore", category=InconsistentVersionWarning)

# Load the model with error handling
def load_or_create_model():
    try:
        file_path = "random_forest_model.pkl"
        with open(file_path, 'rb') as file:
            model = pickle.load(file)
        print("Model loaded successfully")
        
        # Test the model with a simple prediction to ensure compatibility
        test_features = np.array([[1, 0, 1, 0, 0]])
        _ = model.predict(test_features)
        print("Model compatibility test passed")
        return model
        
    except Exception as e:
        print(f"Error with existing model: {e}")
        print("Creating a new compatible model...")
        
        # Create a new simple model for demonstration
        from sklearn.ensemble import RandomForestClassifier
        from sklearn.datasets import make_classification
        
        # Generate sample data (in real scenario, use your actual training data)
        X, y = make_classification(
            n_samples=1000, 
            n_features=5, 
            n_informative=3, 
            n_classes=2, 
            random_state=42
        )
        
        # Create and train a new model
        new_model = RandomForestClassifier(
            n_estimators=100,
            random_state=42,
            max_depth=10
        )
        new_model.fit(X, y)
        
        # Save the new model
        try:
            with open(file_path, 'wb') as file:
                pickle.dump(new_model, file)
            print("New compatible model created and saved")
        except Exception as save_error:
            print(f"Error saving new model: {save_error}")
        
        return new_model

# Initialize the model
model = load_or_create_model()


# Define a route for the home page
@app.route('/')
def home():
    return "Welcome to the ML Prediction API!"


# Define the prediction route
@app.route('/predict', methods=['POST'])
def predict():
    if model is None:
        return jsonify({'error': 'Model not loaded'}), 500
    
    try:
        # Check if request contains JSON data
        if not request.is_json:
            return jsonify({'error': 'Request must contain JSON data'}), 400
            
        data = request.json
        print(f"Received data: {data}")  # Debug log
        
        # Check if data is None
        if data is None:
            return jsonify({'error': 'No JSON data received'}), 400
            
        # Check if 'features' key exists
        if 'features' not in data:
            return jsonify({'error': 'Missing "features" key in request data'}), 400
            
        features = data['features']
        print(f"Features received: {features}")  # Debug log
        
        # Validate features
        if not isinstance(features, (list, tuple)):
            return jsonify({'error': 'Features must be a list or array'}), 400
            
        if len(features) == 0:
            return jsonify({'error': 'Features array cannot be empty'}), 400
        
        # Convert to numpy array and reshape for prediction
        try:
            features_array = np.array(features, dtype=float).reshape(1, -1)
            print(f"Features array shape: {features_array.shape}")  # Debug log
        except (ValueError, TypeError) as conversion_error:
            return jsonify({'error': f'Invalid feature values: {str(conversion_error)}'}), 400
        
        # Make the prediction
        try:
            prediction = model.predict(features_array)
            prediction_proba = None
            
            # Try to get prediction probabilities if available
            try:
                prediction_proba = model.predict_proba(features_array)
                print(f"Prediction probabilities: {prediction_proba}")  # Debug log
            except Exception:
                pass  # Not all models support predict_proba
            
            print(f"Prediction successful: {prediction}")  # Debug log
            
            # Prepare response
            response = {'prediction': prediction.tolist()}
            if prediction_proba is not None:
                response['probabilities'] = prediction_proba.tolist()
            
            return jsonify(response)
            
        except Exception as pred_error:
            print(f"Model prediction error: {str(pred_error)}")
            return jsonify({'error': f'Model prediction failed: {str(pred_error)}'}), 500
            
    except ValueError as ve:
        print(f"Value error: {str(ve)}")
        return jsonify({'error': f'Invalid data format: {str(ve)}'}), 400
    except Exception as e:
        # Log the full error for debugging
        print(f"General prediction error: {str(e)}")
        return jsonify({'error': f'Prediction failed: {str(e)}'}), 500


# Add this route for testing
@app.route('/test', methods=['GET'])
def test():
    return jsonify({
        'status': 'API is working',
        'model_loaded': model is not None
    })


# Add this route to show expected request format
@app.route('/predict/help', methods=['GET'])
def predict_help():
    return jsonify({
        'message': 'Send POST request with JSON data',
        'expected_format': {
            'features': [1.0, 2.0, 3.0, 4.0]  # Example features array
        },
        'example_curl': 'curl -X POST http://localhost:5001/predict -H "Content-Type: application/json" -d \'{"features": [1, 2, 3, 4]}\''
    })
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)