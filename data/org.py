import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument("dataset", type=str)


def ignore(xs: list[str], blacklist: list[str]) -> list[str]:
    """
    Ignore blacklisted files or directories.
    """
    return [x for x in xs if x not in blacklist]


def walk_ignore_sort_abs(
    target: str,
    blacklist: list[str] = [],
) -> tuple[list[str], list[str]]:
    """
    Get directories and files contained in the target, ignore blacklisted, sort, and return absolute.
    """
    for _, ds, fs in os.walk(target):
        break

    ds = sorted(ignore(ds, blacklist))
    fs = sorted(ignore(fs, blacklist))

    ds = [os.path.join(target, d) for d in ds]
    fs = [os.path.join(target, f) for f in fs]
    return ds, fs


def pretty_print(ds: list[str], fs: list[str]) -> None:
    """
    Not yet pretty though.
    """
    for d in ds:
        print(d)
    for f in fs:
        print(f)
    print()


def file_ext(fs: list[str], num: int = 2) -> list[str]:
    """
    Condense {fs} so that for each extension, there are at most {num} samples.
    """
    ext2cnt: dict[str, int] = {}
    collected: list[str] = []

    for f in fs:
        _, ext = os.path.splitext(f)

        cnt = ext2cnt.get(ext, 0)
        if cnt >= num:
            continue

        ext2cnt[ext] = cnt + 1
        collected.append(f)

    return collected


if __name__ == "__main__":
    args = parser.parse_args()
    dataset: str = args.dataset
    blacklist = [".thumbs"]

    ds, fs = walk_ignore_sort_abs("./n1_eval_scenes/SkyTexture", blacklist)
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs("./n1_eval_scenes/Materials/Carpet", blacklist)
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs("./n1_eval_scenes/cluttered_easy/easy_0", blacklist)
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs("./n1_eval_scenes/cluttered_hard/hard_0", blacklist)
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs("./n1_eval_scenes/internscenes_commercial", blacklist)
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs(
        "./n1_eval_scenes/internscenes_commercial/"
        "scenes_commercial/MV4AFHQKTKJZ2AABAAAAADQ8_usd",
        blacklist,
    )
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs("./n1_eval_scenes/internscenes_home", blacklist)
    fs = file_ext(fs)
    pretty_print(ds, fs)

    ds, fs = walk_ignore_sort_abs(
        "./n1_eval_scenes/internscenes_home/"
        "scenes_home/MVUCSQAKTKJ5EAABAAAAADQ8_usd",
        blacklist,
    )
    fs = file_ext(fs)
    pretty_print(ds, fs)
