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
            # Load the CSV file without using the first column as the index
            data = pd.read_csv(file_path, header=0)
            if data.shape[1] < 8:
                print(f"{file_path} does not contain 8 columns.")
                continue

            # Select the 8th column as the series to plot
            series = data.iloc[:, 7].dropna() / 1_000_000_000

            # Calculate moving average
            moving_avg = calculate_moving_average(series, window)

            # Plotting the original series and its moving average
            # plt.plot(series.index, series, label=f'Original - {os.path.basename(file_path)}', linestyle='-')
            plt.plot(moving_avg.index, moving_avg, label=f'Moving Average - {os.path.basename(file_path)}', linestyle='-')
        
        except Exception as e:
            print(f"Error processing {file_path}: {e}")

    plt.title("Combined Line Graph with Moving Averages")
    plt.xlabel('Events')
    plt.ylabel('Seconds')
    plt.legend()
    plt.tight_layout()

    # Save the combined plot
    plt.savefig(os.path.join(output_dir, 'combined_line_graph_with_moving_averages.png'))
    plt.close()

def main(file_paths):
    # Create output directory with timestamp
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    output_dir = f"graphics-timeline-{timestamp}"
    os.makedirs(output_dir, exist_ok=True)

    # Generate combined line graph with moving averages
    create_combined_line_graph_with_moving_average(file_paths, output_dir)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py file1.csv file2.csv ...")
    else:
        main(sys.argv[1:])
