From: lnowakow at eng.ucsd.edu (Luke Nowakowski-Krijger)
Date: Wed, 10 Jul 2019 08:30:51 -0700
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] Documentation: virtual:
	convert .txt to .rst
Message-ID: <20190710153054.29564-1-lnowakow@neg.ucsd.edu>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>

Converted a few documents in virtual and virtual/kvm to .rst format.
Also added toctree hooks to newly added files. 
Adding hooks to the main doc tree should be in another patch series 
once there are more files in the directory.

Changes in v3:
	Documentation: kvm: Convert cpuid.txt to .rst
	+ Added extra table entries that were in updated cpuid.txt

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
  Documentation: virtual: Convert paravirt_ops.txt to .rst
  Documentation: kvm: Convert cpuid.txt to .rst
  Documentation: virtual: Add toctree hooks

 Documentation/virtual/index.rst               |  18 ++
 .../virtual/kvm/{cpuid.txt => cpuid.rst}      | 162 ++++++++++--------
 Documentation/virtual/kvm/index.rst           |  11 ++
 .../{paravirt_ops.txt => paravirt_ops.rst}    |  19 +-
 4 files changed, 129 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/virtual/index.rst
 rename Documentation/virtual/kvm/{cpuid.txt => cpuid.rst} (13%)
 create mode 100644 Documentation/virtual/kvm/index.rst
 rename Documentation/virtual/{paravirt_ops.txt => paravirt_ops.rst} (65%)

-- 
2.20.1
