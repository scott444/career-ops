#!/usr/bin/env python3
"""Rough ATS keyword coverage: jd.md vs resume.md."""
import re, sys
from collections import Counter

STOP = set("""a an and are as at be by for from has have in is it its of on or
that the to was were will with you your we our this these those their they
role team work experience years strong ability""".split())

def terms(text):
    words = re.findall(r"[a-zA-Z][a-zA-Z0-9+#./-]{1,}", text.lower())
    uni = [w for w in words if w not in STOP and len(w) > 2]
    bi = [f"{a} {b}" for a, b in zip(words, words[1:])
          if a not in STOP and b not in STOP]
    return Counter(uni), Counter(bi)

if len(sys.argv) < 3:
    sys.exit("usage: ats_keywords.py <jd.md> <resume.md>")

jd, resume = (open(p, encoding="utf-8").read() for p in sys.argv[1:3])
jd_uni, jd_bi = terms(jd)
res_text = resume.lower()

keys = [k for k, _ in jd_bi.most_common(40) if jd_bi[k] > 1] + \
       [k for k, _ in jd_uni.most_common(60) if jd_uni[k] > 1]
keys = list(dict.fromkeys(keys))[:40]

hit = [k for k in keys if k in res_text]
miss = [k for k in keys if k not in res_text]
print(f"COVERAGE: {len(hit)}/{len(keys)} = {100*len(hit)//max(len(keys),1)}%")
print("\nPRESENT:", ", ".join(hit))
print("\nMISSING:", ", ".join(miss))
