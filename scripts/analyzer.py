import sys
import glob
import pandas as pd

def main():
    files = sys.argv[1:]
    
    elapsed_time_results = []
    total_elapsed_time_results = []

    for file in files:
        df = pd.read_csv(file)

        # Calculate individual elapsed time in milliseconds
        elapsed_time = df['ELAPSED_TIME'].mean() / 1e6
        elapsed_time_results.append((file, elapsed_time))
        
        # Calculate total elapsed time in milliseconds
        valid_times = df[df['TIMESTAMP_RECEIVED'] > df['TIMESTAMP_SENT']]
        if valid_times.empty:
            print(f"Warning: No valid time intervals found in {file}. Check your data.")
            total_elapsed_time = 0
        else:
            total_elapsed_time = ((valid_times['TIMESTAMP_RECEIVED'] - valid_times['TIMESTAMP_SENT']).mean())
        total_elapsed_time_results.append((file, total_elapsed_time))

    # Sorting results
    elapsed_time_results.sort(key=lambda x: x[1])
    total_elapsed_time_results.sort(key=lambda x: x[1])

    # Outputting results
    print("\nElapsed Time Analysis:")
    best_elapsed_time = elapsed_time_results[0][1]
    for platform, time in elapsed_time_results:
        increment = ((time - best_elapsed_time) / best_elapsed_time) * 100
        formatted_time = "{:.3f}".format(time)
        print(f"{platform}: {formatted_time} milliseconds (+{increment:.2f}%)")
    
    print("\nTotal Elapsed Time Analysis:")
    best_total_elapsed_time = total_elapsed_time_results[0][1]
    for platform, time in total_elapsed_time_results:
        increment = ((time - best_total_elapsed_time) / best_total_elapsed_time) * 100 if best_total_elapsed_time > 0 else 0
        formatted_time = "{:.3f}".format(time)
        print(f"{platform}: {formatted_time} milliseconds (+{increment:.2f}%)")


if __name__ == "__main__":
    main()
