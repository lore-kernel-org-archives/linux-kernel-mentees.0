From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed, 24 Jul 2019 17:38:39 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 02/11] PCI: Move PME declarations
	to drivers/pci/pci.h
In-Reply-To: <20190724233848.73327-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
	<20190724233848.73327-1-skunberg.kelsey@gmail.com>
Message-ID: <20190724233848.73327-3-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

pci_check_pme_status() and pci_pme_wakeup_bus() are only
called within drivers/pci/. Since declarations do not need to be visible
to the rest of the kernel, move to drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 2 ++
 include/linux/pci.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 708413632429..ad1fe54ab8ee 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -89,6 +89,8 @@ void pci_power_up(struct pci_dev *dev);
 void pci_disable_enabled_device(struct pci_dev *dev);
 int pci_finish_runtime_suspend(struct pci_dev *dev);
 void pcie_clear_root_pme_status(struct pci_dev *dev);
+bool pci_check_pme_status(struct pci_dev *dev);
+void pci_pme_wakeup_bus(struct pci_bus *bus);
 int __pci_pme_wakeup(struct pci_dev *dev, void *ign);
 void pci_pme_restore(struct pci_dev *dev);
 bool pci_dev_need_resume(struct pci_dev *dev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 238449460210..e1f784de459f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1236,8 +1236,6 @@ int pci_wake_from_d3(struct pci_dev *dev, bool enable);
 int pci_prepare_to_sleep(struct pci_dev *dev);
 int pci_back_from_sleep(struct pci_dev *dev);
 bool pci_dev_run_wake(struct pci_dev *dev);
-bool pci_check_pme_status(struct pci_dev *dev);
-void pci_pme_wakeup_bus(struct pci_bus *bus);
 void pci_d3cold_enable(struct pci_dev *dev);
 void pci_d3cold_disable(struct pci_dev *dev);
 bool pcie_relaxed_ordering_enabled(struct pci_dev *dev);
-- 
2.20.1
