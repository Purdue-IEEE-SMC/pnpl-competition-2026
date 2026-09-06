# PNPL Competition 2026

Team repository for Purdue IEEE-SMC's participation in the PNPL Competition 2026.

## Competition

The task is neural speech decoding from MEG recordings. Models rank a fixed vocabulary of 50 words for each example.

Primary metric: **Top-10 Balanced Accuracy (BAcc@10)**.

- Deep: https://www.kaggle.com/competitions/pnpl-competition-2026-deep/
- Broad: https://www.kaggle.com/competitions/pnpl-competition-2026-broad/
- PNPL 2026: https://libribrain.com/editions/2026/

| Track | Data | Main focus |
| --- | --- | --- |
| Deep | Subject 0, ~80 hours | Within-subject decoding |
| Broad | Subjects 1-32, ~10-40 labeled minutes each | Cross-subject generalization |

## Prerequisites

Install Git: https://git-scm.com/downloads  
Install Python 3.11: https://www.python.org/downloads/

## Clone

```bash
git clone https://github.com/Purdue-IEEE-SMC/pnpl-competition-2026.git
cd pnpl-competition-2026
```

## Setup

### macOS / Linux

```bash
bash scripts/setup.sh
```

Later, reactivate with:

```bash
source .venv/bin/activate
```

### Windows PowerShell

```powershell
.\scripts\setup.ps1
```

Later, reactivate with:

```powershell
.venv\Scripts\Activate.ps1
```

## Verify

```bash
python scripts/check_environment.py
```

## Repository structure

```text
pnpl-competition-2026/
├── README.md
├── requirements.txt
├── .gitignore
├── src/
├── notebooks/
├── configs/
├── experiments/
├── submissions/
└── scripts/
```

## Data

The competition uses **LibriBrain100**. The PNPL package downloads requested files automatically from Hugging Face.

Keep data outside this repository:

```text
projects/
├── pnpl-competition-2026/
└── pnpl-data/
    └── LibriBrain100/
```

Example:

```python
from pnpl.datasets import LibriBrain100Word

dataset = LibriBrain100Word(
    data_path="../pnpl-data/LibriBrain100",
    subjects="deep",
    corpus="podcasts",
    include_run_keys=[("0", "1", "TheMoth", "1")],
    download=True,
)

x, y = dataset[0]
print(x.shape, y)
```

Useful selectors:

```python
subjects="deep"
subjects="broad"
subjects=[1, 2, 3]

corpus="sherlock"
corpus="timit"
corpus="mocha"
corpus="podcasts"
corpus="all"
```

Only Subject 0 has TIMIT, MOCHA-TIMIT, and podcast data.

## Kaggle holdout

Use LibriBrain100 for training and local evaluation.

```python
from pnpl.competition import LibriBrainCompetitionHoldout

deep_holdout = LibriBrainCompetitionHoldout(track="deep")
broad_holdout = LibriBrainCompetitionHoldout(track="broad")
```

Do not train on holdout data.

## Kaggle authentication

Verify:

```bash
kaggle --version
```

Use `KAGGLE_API_TOKEN` for authentication. Never commit credentials, `.env`, or `kaggle.json`.

## Development

Create a branch:

```bash
git checkout -b feature/short-description
```

Commit and push:

```bash
git add .
git commit -m "Describe your change"
git push -u origin feature/short-description
```

Open a pull request into `main`.

The PNPL dependency is pinned in `requirements.txt`. Do not update it independently.
