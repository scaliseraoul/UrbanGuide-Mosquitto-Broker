from datetime import datetime
import pandas as pd
import matplotlib.pyplot as plt
import sys
import os

def create_combined_boxplot(file_paths, output_dir):
    data_list = []
    labels = []
    
    for file_path in file_paths:
        try:
            # Load the CSV file
            data = pd.read_csv(file_path)
            # Ensure the necessary columns are present
            if 'TIMESTAMP_RECEIVED' not in data.columns or 'TIMESTAMP_SENT' not in data.columns:
                print(f"{file_path} does not contain 'TIMESTAMP_RECEIVED' and 'TIMESTAMP_SENT' columns.")
                continue
            
            # Calculate the total elapsed time in milliseconds
            total_elapsed_time = (data['TIMESTAMP_RECEIVED'] - data['TIMESTAMP_SENT'])

            if not total_elapsed_time.empty:
                data_list.append(total_elapsed_time)
                # Add the label using the file name without its extension
                labels.append(os.path.basename(file_path).replace('.csv', ''))
            else:
                print(f"No usable data for total elapsed time in {file_path}.")
        except Exception as e:
            print(f"Error loading {file_path}: {e}")
    
    if not data_list:  # Check if data_list is empty
        print("No data to plot.")
        return

    # Create the combined box plot
    plt.figure(figsize=(10, 6))  # Adjust figure size as needed
    plt.boxplot(data_list, labels=labels,showfliers=False)
    plt.xticks(rotation=45)  # Rotate labels to avoid overlap
    plt.title('Box Plot of Total Elapsed Time')
    plt.ylabel('Milliseconds')
    
    # Adjust layout and save the plot
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, f'{labels[0]}_boxplot_total_elapsed.png'))
    plt.close()

# Example usage: python script.py file1.csv file2.csv ...
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py file1.csv file2.csv ...")
    else:
        timestamp = datetime.now().strftime("%Y%m%d")
        output_dir = f"Boxplot Total Elapsed {timestamp}"
        os.makedirs(output_dir, exist_ok=True)

        file_paths = sys.argv[1:]  # Get all the file paths passed as arguments
        create_combined_boxplot(file_paths, output_dir)
