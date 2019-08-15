From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 15 Aug 2019 09:33:49 -0600
Subject: [Linux-kernel-mentees] [PATCH v3 0/4] PCI: Clean up pci-sysfs.c
In-Reply-To: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
References: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
Message-ID: <20190815153352.86143-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190815153349.1cJWVSBrD33mQOS4W2_OqidqlKnTyaTV3Ug-ObuZTUY@z>

This series is designed to clean up device attributes and permissions in
pci-sysfs.c. Then move the sysfs SR-IOV functions from pci-sysfs.c to
iov.c for better organization.

Patch 1: Define device attributes with DEVICE_ATTR* instead of __ATTR*.

Patch 2: Change permissions from symbolic to the preferred octal.

Patch 3: Change DEVICE_ATTR() with 0220 permissions to DEVICE_ATTR_WO().

Patch 4: Move sysfs SR-IOV functions to iov.c to keep the feature's code
together.


Patch 1, 2, and 4 will report unusual permissions '0664' used from the
following:

  static DEVICE_ATTR(sriov_numvfs, 0664, sriov_numvfs_show,
                     sriov_numvfs_store);

  static DEVICE_ATTR(sriov_drivers_autoprobe, 0664,
                     sriov_drivers_autoprobe_show,
                     sriov_drivers_autoprobe_store);

This series preserves the existing permissions set in:


  commit 0e7df22401a3 ("PCI: Add sysfs sriov_drivers_autoprobe to control
                        VF driver binding")

  commit 1789382a72a5 ("PCI: SRIOV control and status via sysfs")

Either adding a comment verifying permissions are okay or changing the
permissions is to be completed with a new patch.

Changes since v1:
        Add patch 1 and 2 to fix the way device attributes are defined
        and change permissions from symbolic to octal. Patch 4 which moves
        sysfs SR-IOV functions to iov.c will then apply cleaner.

Changes since v2:

        Patch 1: Commit log updated. Example shows DEVICE_ATTR_RO()
        example instead of DEVICE_ATTR(). DEVICE_ATTR() should be avoided
        unless the files have unusual permissions. Changed to reflect a
        more encouraged usage.  Also updated regex to be accurate.

        Patch 3: [NEW] Add patch to change DEVICE_ATTR() with 0220
        permissions to DEVICE_ATTR_WO().

        Updated series log to reflect new patch and unusual permissions
        information.


Kelsey Skunberg (4):
  PCI: sysfs: Define device attributes with DEVICE_ATTR*
  PCI: sysfs: Change permissions from symbolic to octal
  PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()
  PCI/IOV: Move sysfs SR-IOV functions to iov.c

 drivers/pci/iov.c       | 168 ++++++++++++++++++++++++++++++
 drivers/pci/pci-sysfs.c | 223 ++++------------------------------------
 drivers/pci/pci.h       |   2 +-
 3 files changed, 191 insertions(+), 202 deletions(-)

-- 
2.20.1
