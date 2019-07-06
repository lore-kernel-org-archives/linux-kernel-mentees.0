From: lnowakow@eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Sat,  6 Jul 2019 14:38:12 -0700
Subject: [Linux-kernel-mentees] [PATCH 0/3] [PATCH 0/3] Documentation:
	virtual: convert files from .txt to
Message-ID: <cover.1562448500.git.lnowakow@eng.ucsd.edu>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190706213812.9YPqFJYdLyqHZWtLXnfj8ykgIK53sF7XKMHv2Xrwj74@z>

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Converted a few documents in virtual and virtual/kvm to .rst format.
Also added toctree hooks wherever there were .rst files. Adding hooks to
the main doc tree should be in another patch series once there are more
files in the directory. 

After confirming with the appropriate lists that all the 
Documentation/virtual/* files are not obsolete I will continue
converting the rest of the .txt files to .rst. 

Luke Nowakowski-Krijger (3):
  Documentation: virtual: Add toctree hooks
  Documentation: kvm: Convert cpuid.txt to .rst
  Documentation: virtual: Convert paravirt_ops.txt to .rst

 Documentation/virtual/index.rst               | 18 ++++
 Documentation/virtual/kvm/cpuid.rst           | 99 +++++++++++++++++++
 Documentation/virtual/kvm/cpuid.txt           | 83 ----------------
 Documentation/virtual/kvm/index.rst           | 12 +++
 .../{paravirt_ops.txt => paravirt_ops.rst}    | 19 ++--
 5 files changed, 140 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/virtual/index.rst
 create mode 100644 Documentation/virtual/kvm/cpuid.rst
 delete mode 100644 Documentation/virtual/kvm/cpuid.txt
 create mode 100644 Documentation/virtual/kvm/index.rst
 rename Documentation/virtual/{paravirt_ops.txt => paravirt_ops.rst} (65%)

-- 
2.20.1
