From: helgaas@kernel.org (Bjorn Helgaas)
Date: Wed, 14 Aug 2019 00:40:38 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] PCI: pci-sysfs.c cleanup
In-Reply-To: <20190813204513.4790-1-skunberg.kelsey@gmail.com>
References: <20190809195721.34237-1-skunberg.kelsey@gmail.com>
	<20190813204513.4790-1-skunberg.kelsey@gmail.com>
Message-ID: <20190814054038.GB253360@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190814054038.SzbzR6Fg1ABehC873sijGI0mFD3goGBna3Deg4DEU8A@z>

[+cc Greg]

On Tue, Aug 13, 2019 at 02:45:10PM -0600, Kelsey Skunberg wrote:
> This series is designed to clean up device attributes and permissions in
> pci-sysfs.c. Then move the sysfs SR-IOV functions from pci-sysfs.c to
> iov.c for better organization. Patches build off of each other.
> 
> Patch 1: Define device attributes with DEVICE_ATTR*() instead of __ATTR*().
> 
> Patch 2: Change permissions from symbolic to the preferred octal.
> 
> Patch 3: Move sysfs SR-IOV functions to iov.c to keep the feature's code
> together.
> 
> Changes since v1:
>         Add patch 1 and 2 to fix the way device attributes are defined
>         and change permissions from symbolic to octal. Patch 3 which moves
>         sysfs SR-IOV functions to iov.c will then apply cleaner.
> 
> 
> Kelsey Skunberg (3):
>   PCI: sysfs: Define device attributes with DEVICE_ATTR*()
>   PCI: sysfs: Change permissions from symbolic to octal
>   PCI/IOV: Move sysfs SR-IOV functions to iov.c
> 
>  drivers/pci/iov.c       | 168 +++++++++++++++++++++++++++++++
>  drivers/pci/pci-sysfs.c | 217 ++++------------------------------------
>  drivers/pci/pci.h       |   2 +-
>  3 files changed, 188 insertions(+), 199 deletions(-)

Applied to pci/virtualization for v5.4, thanks!

Beginning of thread:
https://lore.kernel.org/r/20190813204513.4790-1-skunberg.kelsey at gmail.com
