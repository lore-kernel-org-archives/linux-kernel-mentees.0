Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BA1C54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 15:19:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6D620772
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 15:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkpVvk3c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6D620772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A370A2042C;
	Wed, 25 Mar 2020 15:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyabbfi-JtDV; Wed, 25 Mar 2020 15:18:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C164C2002F;
	Wed, 25 Mar 2020 15:18:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE5A1C1D7C;
	Wed, 25 Mar 2020 15:18:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAC0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9857D85BF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-qHXthKwUM0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E078785BE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:18:55 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y24so2574141ioa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwggEMzU8RT5gVextfFr6ZJ6Cb6aIGerS+OjEWSFzGM=;
 b=YkpVvk3cpUbmjXv2VeeH2Ikrh7SX9x5/EHloC3St2zeSPBRHUqXv50iLZfQkXRg5tK
 ZZkMUu7dL5a3Pu7U3dA2uAI7kfGNCv8nu5CX85tiKXmh4eU0LGq7ccnIWio+DY3BTHf5
 4bsQ9iCjmPM5BTtS5z9o7331oaMl+Y3nFAH/hBOI65DTAptyvuoX/m6r/rGHlOII8ZG/
 oOD4ScOEf2HKK7lH0Mt6P/gAUSSeYEas9rqTfE0FzP8A2n2Nob9l4gNBG5h9P3pzCbPS
 aZSkidmSKAYAlEj5tzPNYBoccl5zYgKX4+ZzHPqW3jwdF5vU6RvcoTb3IIIZoVY/5c/x
 qMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwggEMzU8RT5gVextfFr6ZJ6Cb6aIGerS+OjEWSFzGM=;
 b=ZUlAXRo/eCH5dpCw0gaAOmd2xwJvjJfxze851cUSnSHxNFzGtfn9fuyGIGbK3Fm14B
 d8UkMkwM08DzhqTY2tXJdRXHM3Og3V707D/0uSgeox1LfK+3uUv5uQZFL9aIb0iiQqii
 xrlUKMo+UyVCwviyYQlr6/84lUEKseVZrLEW1o9cD6+p3okMeI3tZlwnmpQ+q28AS4NT
 9eYUjLEHDkVSi9xBnuYz6s0CC/nvxKEFuHOw8g4yikY0S4++RIbMTyLk5X4x21dmTbCy
 CozpVsehCub3gWaiInUPCbw7E+O05PycZ7SjYd6pgEvBlHber5mJNUrXFWeXSgwcZYHC
 7oww==
X-Gm-Message-State: ANhLgQ34ZER6jHA2PTRrPwfNohqB4jifgDjc8h1nrm+UlXXDDRLuT/ij
 QL9b0aaqorWgUvpKYnQulEs=
X-Google-Smtp-Source: ADFU+vuVIMdR6DiEq04mOyja+XcS0ozqbhcLQiUa4XHsN5xHWYdfm9KfOs0VanJglVKI+l/wSGA/5w==
X-Received: by 2002:a5d:89d1:: with SMTP id a17mr2846961iot.11.1585149535139; 
 Wed, 25 Mar 2020 08:18:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-243-191-173.hsd1.co.comcast.net.
 [73.243.191.173])
 by smtp.gmail.com with ESMTPSA id p68sm7544047ilb.80.2020.03.25.08.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 08:18:54 -0700 (PDT)
From: Kelsey Skunberg <skunberg.kelsey@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Date: Wed, 25 Mar 2020 09:17:08 -0600
Message-Id: <20200325151708.32612-1-skunberg.kelsey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Kelsey Skunberg <kelsey.skunberg@gmail.com>, rbilovol@cisco.com,
 stable <stable@vger.kernel.org>, ddutile@redhat.com, ruslan.bilovol@gmail.com,
 bhelgaas@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 bodong@mellanox.com
Subject: [Linux-kernel-mentees] [PATCH v2] PCI: sysfs: Change bus_rescan and
	dev_rescan to rescan
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Kelsey Skunberg <kelsey.skunberg@gmail.com>

rename device attribute name arguments 'bus_rescan' and 'dev_rescan' to 'rescan'
to avoid breaking userspace applications.

The attribute argument names were changed in the following commits:
8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")

Revert the names used for attributes back to the names used before the above
patches were applied. This also requires to change DEVICE_ATTR_WO() to
DEVICE_ATTR() and __ATTR().

Note when using DEVICE_ATTR() the attribute is automatically named
dev_attr_<name>.attr. To avoid duplicated names between attributes, use
__ATTR() instead of DEVICE_ATTR() to a assign a custom attribute name for
dev_rescan.

change bus_rescan_store() to dev_bus_rescan_store() to complete matching the
names used before the mentioned patches were applied.

Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")

Cc: stable <stable@vger.kernel.org>
Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

v2 updates: 
	commit log updated to include 'Fixes: *' and Cc: stable to aid commit
	being backported properly.

 drivers/pci/pci-sysfs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 13f766db0684..667e13d597ff 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -464,7 +464,10 @@ static ssize_t dev_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR_WO(dev_rescan);
+static struct device_attribute dev_rescan_attr = __ATTR(rescan,
+							0220, NULL,
+							dev_rescan_store);
+
 
 static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 			    const char *buf, size_t count)
@@ -481,9 +484,9 @@ static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0220, NULL,
 				  remove_store);
 
-static ssize_t bus_rescan_store(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t dev_bus_rescan_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	unsigned long val;
 	struct pci_bus *bus = to_pci_bus(dev);
@@ -501,7 +504,7 @@ static ssize_t bus_rescan_store(struct device *dev,
 	}
 	return count;
 }
-static DEVICE_ATTR_WO(bus_rescan);
+static DEVICE_ATTR(rescan, 0220, NULL, dev_bus_rescan_store);
 
 #if defined(CONFIG_PM) && defined(CONFIG_ACPI)
 static ssize_t d3cold_allowed_store(struct device *dev,
@@ -641,7 +644,7 @@ static struct attribute *pcie_dev_attrs[] = {
 };
 
 static struct attribute *pcibus_attrs[] = {
-	&dev_attr_bus_rescan.attr,
+	&dev_attr_rescan.attr,
 	&dev_attr_cpuaffinity.attr,
 	&dev_attr_cpulistaffinity.attr,
 	NULL,
@@ -1487,7 +1490,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 
 static struct attribute *pci_dev_hp_attrs[] = {
 	&dev_attr_remove.attr,
-	&dev_attr_dev_rescan.attr,
+	&dev_rescan_attr.attr,
 	NULL,
 };
 
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
