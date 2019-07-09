From: lnowakow@eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Tue,  9 Jul 2019 13:07:18 -0700
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] Documentation: virtual:
	convert .txt to .rst
Message-ID: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190709200718.0FalewDyUrtiv3HEkcl63nSBAR4BYuEz4BueA1OyjpA@z>

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Converted a few documents in virtual and virtual/kvm to .rst format.
Also added toctree hooks wherever there were .rst files. Adding hooks to
the main doc tree should be in another patch series once there are more
files in the directory.

After confirming with the appropriate lists that all the
Documentation/virtual/* files are not obsolete I will continue
converting the rest of the .txt files to .rst.

Changes in v2: 
	Documentation: kvm: Convert cpuid.txt to .rst
	+ added updated Author email address
	+ changed table to simpler format
	- removed function bolding from v1
	Documentation: virtual: Add toctree hooks
	- Removed vcpu-request from hooks that was added in v1

Chanes in v1:
	Documentation: kvm: Convert cpuid.txt to .rst
	+ Converted doc to .rst format
	Documentation: virtual: Convert paravirt_ops.txt to .rst
	+ Converted doc to .rst format
	Documentation: virtual: Add toctree hooks
	+ Added index.rst file in virtual directory
	+ Added index.rst file in virtual/kvm directory


Luke Nowakowski-Krijger (3):
  Documentation: kvm: Convert cpuid.txt to .rst
  Documentation: virtual: Convert paravirt_ops.txt to .rst
  Documentation: virtual: Add toctree hooks

 Documentation/virtual/index.rst               | 18 ++++
 Documentation/virtual/kvm/cpuid.rst           | 99 +++++++++++++++++++
 Documentation/virtual/kvm/cpuid.txt           | 83 ----------------
 Documentation/virtual/kvm/index.rst           | 11 +++
 .../{paravirt_ops.txt => paravirt_ops.rst}    | 19 ++--
 5 files changed, 139 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/virtual/index.rst
 create mode 100644 Documentation/virtual/kvm/cpuid.rst
 delete mode 100644 Documentation/virtual/kvm/cpuid.txt
 create mode 100644 Documentation/virtual/kvm/index.rst
 rename Documentation/virtual/{paravirt_ops.txt => paravirt_ops.rst} (65%)

-- 
2.20.1
