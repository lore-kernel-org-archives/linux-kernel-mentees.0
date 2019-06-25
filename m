From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Tue, 25 Jun 2019 01:26:21 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 0/6] Documentation: RCU: Convert
	to reST
In-Reply-To: <20190623081413.7095-1-c0d1n61at3@gmail.com>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
Message-ID: <20190625062627.26378-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series is the initial conversion of the RCU documentation
section.  This includes reST markup and renaming txt files to rst.  For files
converted, internal and external links have been created with cross-references.
Checkpatch was used to leverage codespell for any spelling errors.  Each patch
in the series has been compiled and reviewed for warnings and errors.
Patches can be bisected.

The changes made in v3 include:
  - correcting markup to maintain even more of the original text
  - correcting markup for line breaks
  - combining all file renaming into one patch
  - add reviewed-by tags
  - add required public list to CC

The changes made in v2 include:
  - correcting markup to maintain as much of the original text as possible
  - correcting markup to reduce reader context switching
  - breakout file renaming into individual patches in the series

>8-----------------------------------------------------------------8<

Jiunn Chang (6):
  Documentation: RCU: Convert RCU basic concepts to reST
  Documentation: RCU: Convert RCU linked list to reST
  Documentation: RCU: Convert RCU UP systems to reST
  Documentation: RCU: Rename txt files to rst
  Documentation: RCU: Add links to rcu.rst
  Documentation: RCU: Add TOC tree hooks

 Documentation/RCU/index.rst                   | 19 ++++
 .../RCU/{listRCU.txt => list_rcu.rst}         | 38 ++++----
 Documentation/RCU/rcu.rst                     | 91 +++++++++++++++++++
 Documentation/RCU/rcu.txt                     | 89 ------------------
 Documentation/RCU/{UP.txt => up_rcu.rst}      | 37 +++++---
 5 files changed, 155 insertions(+), 119 deletions(-)
 create mode 100644 Documentation/RCU/index.rst
 rename Documentation/RCU/{listRCU.txt => list_rcu.rst} (92%)
 create mode 100644 Documentation/RCU/rcu.rst
 delete mode 100644 Documentation/RCU/rcu.txt
 rename Documentation/RCU/{UP.txt => up_rcu.rst} (84%)

-- 
2.22.0
