From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Mon, 15 Jul 2019 14:34:16 -0600
Subject: [Linux-kernel-mentees] [PATCH v3] PCI: Remove functions not called
	in include/linux/pci.h
In-Reply-To: <20190715181312.31403-1-skunberg.kelsey@gmail.com>
References: <20190715181312.31403-1-skunberg.kelsey@gmail.com>
Message-ID: <20190715203416.37547-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190715203416.dB7T8DwZkGBotk0_t68SXD8tPBBvCVcjkRzl3guxjUI@z>

Remove the following uncalled functions from include/linux/pci.h:

        pci_block_cfg_access()
        pci_block_cfg_access_in_atomic()
        pci_unblock_cfg_access()

Functions were added in commit fb51ccbf217c ("PCI: Rework config space
blocking services"), though no callers were added. Code continues to be
unused and should be removed.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---

Changes since v1:
  - Fixed Signed-off-by line to show full name

Changes since v2:
  - Change commit message to reference prior commit properly with the
    following format:
	commit <12-character sha prefix> ("<commit message>")

 include/linux/pci.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cf380544c700..3c9ba6133bea 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1656,11 +1656,6 @@ static inline void pci_release_regions(struct pci_dev *dev) { }
 
 static inline unsigned long pci_address_to_pio(phys_addr_t addr) { return -1; }
 
-static inline void pci_block_cfg_access(struct pci_dev *dev) { }
-static inline int pci_block_cfg_access_in_atomic(struct pci_dev *dev)
-{ return 0; }
-static inline void pci_unblock_cfg_access(struct pci_dev *dev) { }
-
 static inline struct pci_bus *pci_find_next_bus(const struct pci_bus *from)
 { return NULL; }
 static inline struct pci_dev *pci_get_slot(struct pci_bus *bus,
-- 
2.20.1
