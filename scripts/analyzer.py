import pandas as pd

def analyze_csv(file_paths):
    results = []
    for path in file_paths:
        df = pd.read_csv(path, header=None)
        df = df.apply(pd.to_numeric, errors='coerce')
        average_elapsed_time = df.iloc[:, 7].mean()
        average_latency = (df.iloc[:, 8] - df.iloc[:, 0]).mean()
        results.append({
            "file_path": path,
            "average_elapsed_time": average_elapsed_time,
            "average_latency": average_latency
        })
    
    results_df = pd.DataFrame(results)
    best_file = results_df.loc[results_df['average_elapsed_time'].idxmin(), 'file_path']
    
    # Calculate differences from the best file for each file
    best_elapsed_time = results_df[results_df['file_path'] == best_file]['average_elapsed_time'].iloc[0]
    best_latency = results_df[results_df['file_path'] == best_file]['average_latency'].iloc[0]
    
    results_df['elapsed_time_diff_%'] = ((results_df['average_elapsed_time'] - best_elapsed_time) / best_elapsed_time) * 100
    results_df['latency_diff_%'] = ((results_df['average_latency'] - best_latency) / best_latency) * 100
    
    results_df['average_elapsed_time'] = results_df['average_elapsed_time'].round(2)
    results_df['average_latency'] = results_df['average_latency'].round(2)
    results_df['elapsed_time_diff_%'] = results_df['elapsed_time_diff_%'].round(2)
    results_df['latency_diff_%'] = results_df['latency_diff_%'].round(2)
    
    return results_df, best_file


file_paths = [
    "AndroidKotlinGoogleMapsMoveMapComplete.csv",
    "AndroidKotlinMapboxMoveMapComplete.csv"
]

results_df, best_file = analyze_csv(file_paths)
print("Best File:", best_file)

# Output the results to a CSV file
results_df.to_csv("analysis_results.csv", index=False)