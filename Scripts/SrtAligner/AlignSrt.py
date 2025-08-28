import argparse
from pathlib import Path

def align_srt_files(directory: Path, format: str) -> None:
    original_srt_paths = sorted(directory.glob("*.srt"))
    aligned_srt_paths = sorted([video_file_path.with_suffix(".srt") for video_file_path in directory.glob(f"*.{format}")])

    for original_srt, aligned_srt in zip(original_srt_paths, aligned_srt_paths):
        print(f"Aligning\t{original_srt.stem}\t\tto\t\t{aligned_srt.stem}")
        original_srt.rename(aligned_srt)


if __name__ == "__main__":
    argument_parser = argparse.ArgumentParser(prog="AlignSrt", description="Align SRT files")
    argument_parser.add_argument("--directory", type=str, help="Directory containing SRT files", required=True)
    argument_parser.add_argument("--format", type=str, help="Format of your video files (e.g. 'mkv', 'mp4')", required=True)
    args = argument_parser.parse_args()

    parsed_directory_path = Path(args.directory.replace("~", str(Path.home()))) if args.directory.startswith("~") else Path(args.directory)

    print(f"Aligning SRT files in directory: {parsed_directory_path} with video format: {args.format}")

    align_srt_files(parsed_directory_path, args.format)

    print("Alignment complete.")