From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 14:12:44 -0500
Subject: [Linux-kernel-mentees] [PATCH v4 0/5] Documentation: RCU: Convert
	to reST
In-Reply-To: <20190625062627.26378-1-c0d1n61at3@gmail.com>
References: <20190625062627.26378-1-c0d1n61at3@gmail.com>
Message-ID: <20190626191249.21135-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626191244.GDQm_rkW7VRY7KoVWiiqGm1n6dFxElwK1FNvqzhj4gM@z>

This patch series is the initial conversion of the RCU documentation
section.  This includes reST markup and renaming txt files to rst.  For files
converted, internal links have been created.  Checkpatch was used to leverage codespell
for any spelling errors.  Each patch in the series has been compiled and reviewed
for warnings and errors.  Patches can be bisected.

The changes made in v4 include:
  - Change links in rcu.rst to the path in documentation section
  - Maintain the original name of the txt files

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

>8---------------------------------------------------------------------------8<

Jiunn Chang (5):
  Documentation: RCU: Convert RCU basic concepts to reST
  Documentation: RCU: Convert RCU linked list to reST
  Documentation: RCU: Convert RCU UP systems to reST
  Documentation: RCU: Rename txt files to rst
  Documentation: RCU: Add TOC tree hooks

 Documentation/RCU/{UP.txt => UP.rst}          | 37 +++++---
 Documentation/RCU/index.rst                   | 19 ++++
 .../RCU/{listRCU.txt => listRCU.rst}          | 38 ++++----
 Documentation/RCU/rcu.rst                     | 92 +++++++++++++++++++
 Documentation/RCU/rcu.txt                     | 89 ------------------
 5 files changed, 156 insertions(+), 119 deletions(-)
 rename Documentation/RCU/{UP.txt => UP.rst} (84%)
 create mode 100644 Documentation/RCU/index.rst
 rename Documentation/RCU/{listRCU.txt => listRCU.rst} (92%)
 create mode 100644 Documentation/RCU/rcu.rst
 delete mode 100644 Documentation/RCU/rcu.txt

-- 
2.22.0
