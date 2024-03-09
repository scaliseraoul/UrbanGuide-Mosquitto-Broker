import pandas as pd
import matplotlib.pyplot as plt
import sys
import os

def create_combined_boxplot(file_paths):
    data_list = []
    labels = []
    
    for file_path in file_paths:
        try:
            # Load the CSV file
            data = pd.read_csv(file_path)
            # Ensure the file has at least 8 columns
            if data.shape[1] < 8:
                print(f"{file_path} does not contain 8 columns.")
                continue
            
            # Extract the 8th column, drop NA values, and check if it's not empty
            column_data = data.iloc[:, 7].dropna() / 1_000_000_000

            if not column_data.empty:
                data_list.append(column_data)
                # Add the label only if the column data is successfully added
                labels.append(os.path.basename(file_path).replace('.csv', ''))
            else:
                print(f"No usable data in the 8th column of {file_path}.")
        except Exception as e:
            print(f"Error loading {file_path}: {e}")
    
    if not data_list:  # Check if data_list is empty
        print("No data to plot.")
        return

    # Create the combined box plot
    plt.figure(figsize=(10, 6))  # Adjust figure size as needed
    plt.boxplot(data_list, labels=labels)
    plt.xticks(rotation=45)  # Rotate labels to avoid overlap
    plt.title('Combined Box Plot for All Files')
    plt.ylabel('Seconds')
    
    # Adjust layout and display the plot
    plt.tight_layout()
    plt.show()

# Example usage: python script.py file1.csv file2.csv ...
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py file1.csv file2.csv ...")
    else:
        file_paths = sys.argv[1:]  # Get all the file paths passed as arguments
        create_combined_boxplot(file_paths)
