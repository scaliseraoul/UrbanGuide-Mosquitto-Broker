import pandas as pd
import matplotlib.pyplot as plt
import os
import sys
from datetime import datetime

def calculate_moving_average(values, window=5):
    """Calculate the moving average using a simple rolling window approach."""
    return values.rolling(window=window, min_periods=1).mean()

def create_combined_line_graph_with_moving_average(file_paths, output_dir, window=10):
    """Generate combined line graphs with moving averages for given CSV files."""
    plt.figure(figsize=(10, 6))

    for file_path in file_paths:
        try:
            # Load the CSV file
            data = pd.read_csv(file_path, header=0)
            if 'TIMESTAMP_RECEIVED' not in data.columns or 'TIMESTAMP_SENT' not in data.columns:
                print(f"{file_path} does not contain 'TIMESTAMP_RECEIVED' and 'TIMESTAMP_SENT' columns.")
                continue

            # Calculate the total elapsed time in seconds
            data['Total_Elapsed_Time'] = (data['TIMESTAMP_RECEIVED'] - data['TIMESTAMP_SENT'])

            # Calculate moving average for the total elapsed time
            moving_avg = calculate_moving_average(data['Total_Elapsed_Time'], window)

            # Plotting the moving average of the total elapsed time
            name=os.path.basename(file_path).replace('.csv', '')
            plt.plot(moving_avg.index, moving_avg, label=f'Moving Average - {name}', linestyle='-')

        except Exception as e:
            print(f"Error processing {file_path}: {e}")

    plt.title("Moving Averages of Total Elapsed Time")
    plt.xlabel('Events')
    plt.ylabel('Milliseconds')
    plt.legend()
    plt.tight_layout()

    # Save the combined plot
    name=os.path.basename(file_paths[0]).replace('.csv', '')
    plt.savefig(os.path.join(output_dir, f'{name}_moving_average_total_elapsed.png'))
    plt.close()

def main(file_paths):
    # Create output directory with timestamp
    timestamp = datetime.now().strftime("%Y%m%d")
    output_dir = f"Moving Average Total Elapsed {timestamp}"
    os.makedirs(output_dir, exist_ok=True)

    # Generate combined line graph with moving averages
    create_combined_line_graph_with_moving_average(file_paths, output_dir)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py file1.csv file2.csv ...")
    else:
        main(sys.argv[1:])