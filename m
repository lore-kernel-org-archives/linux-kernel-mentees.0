From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Thu, 11 Jul 2019 16:23:41 -0600
Subject: [Linux-kernel-mentees] [PATCH 11/11] PCI: Move pci_*_node()
	declarations to drivers/pci/pci.h
In-Reply-To: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
References: <20190711222341.111556-1-skunberg.kelsey@gmail.com>
Message-ID: <20190711222341.111556-12-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190711222341.0BkX9qtQPpmtmxF7sBIBUMAFm97mTWpPnllEAbXef88@z>

pci_*_node() is only called from drivers/pci/. Since these declarations do
not need to be visible to the rest of the kernel, move to
drivers/pci/pci.h.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/pci/pci.h   | 8 ++++++++
 include/linux/pci.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 95bca00ea85a..a8d04dac3430 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -588,6 +588,10 @@ struct device_node;
 int of_pci_parse_bus_range(struct device_node *node, struct resource *res);
 int of_get_pci_domain_nr(struct device_node *node);
 int of_pci_get_max_link_speed(struct device_node *node);
+void pci_set_of_node(struct pci_dev *dev);
+void pci_release_of_node(struct pci_dev *dev);
+void pci_set_bus_of_node(struct pci_bus *bus);
+void pci_release_bus_of_node(struct pci_bus *bus);
 
 #else
 static inline int
@@ -607,6 +611,10 @@ of_pci_get_max_link_speed(struct device_node *node)
 {
 	return -EINVAL;
 }
+static inline void pci_set_of_node(struct pci_dev *dev) { }
+static inline void pci_release_of_node(struct pci_dev *dev) { }
+static inline void pci_set_bus_of_node(struct pci_bus *bus) { }
+static inline void pci_release_bus_of_node(struct pci_bus *bus) { }
 #endif /* CONFIG_OF */
 
 #if defined(CONFIG_OF_ADDRESS)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ea4dfb6b6693..cf380544c700 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2206,10 +2206,6 @@ int pci_vpd_find_info_keyword(const u8 *buf, unsigned int off,
 #ifdef CONFIG_OF
 struct device_node;
 struct irq_domain;
-void pci_set_of_node(struct pci_dev *dev);
-void pci_release_of_node(struct pci_dev *dev);
-void pci_set_bus_of_node(struct pci_bus *bus);
-void pci_release_bus_of_node(struct pci_bus *bus);
 struct irq_domain *pci_host_bridge_of_msi_domain(struct pci_bus *bus);
 int pci_parse_request_of_pci_ranges(struct device *dev,
 				    struct list_head *resources,
@@ -2219,10 +2215,6 @@ int pci_parse_request_of_pci_ranges(struct device *dev,
 struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus);
 
 #else	/* CONFIG_OF */
-static inline void pci_set_of_node(struct pci_dev *dev) { }
-static inline void pci_release_of_node(struct pci_dev *dev) { }
-static inline void pci_set_bus_of_node(struct pci_bus *bus) { }
-static inline void pci_release_bus_of_node(struct pci_bus *bus) { }
 static inline struct irq_domain *
 pci_host_bridge_of_msi_domain(struct pci_bus *bus) { return NULL; }
 static inline int pci_parse_request_of_pci_ranges(struct device *dev,
-- 
2.20.1
