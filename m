Return-Path: <SRS0=1He7=5J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F06C54FCE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Mar 2020 23:48:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C1C2072E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Mar 2020 23:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeWPhXQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C1C2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AED7C862E6;
	Tue, 24 Mar 2020 23:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olwkT7PNa-4E; Tue, 24 Mar 2020 23:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9218A86292;
	Tue, 24 Mar 2020 23:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ECB0C089F;
	Tue, 24 Mar 2020 23:48:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1168C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DEC7B20011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wH63I-hF2xf2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:48:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F29F1FC7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 23:48:51 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id r5so229739ilq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Mar 2020 16:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKgozUjj14O/q7Sm3dF4aSRoq0XpT1MQsgLL9CSaZjM=;
 b=DeWPhXQpyJwtpV6zpVMes5lNf1MkFRym44/YBfzxv15qVQi+jyr1z925UoywmmoWZn
 BK2hjAVZWA0xhtg1lcHInT0Zj6PFZI2FVOk0bECySiz62MJh9u6tWdpoGUTz/6yec+NG
 iozgC5ILG9Y8zbh/eU/F1T6Jqkde8IMXxl0QSAjm8T5oD0xIVQ0xkkNTIyiBW3tqUmgm
 eT+t6PQMqj2ULofVyrSlXrf1IQqsoWHTiZx+Bmjyp79TX/SSsG3edhsk5y+tQpvpMrgy
 oS5CsHtpyLss0V6gC1ZI1XHfy/IABjtoN2mGcvFayiM05qXhbAJU9mScyxVmL9z+1ruA
 dDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKgozUjj14O/q7Sm3dF4aSRoq0XpT1MQsgLL9CSaZjM=;
 b=ZOnbWGViQCgKP5i6bKqd73m9AZtPNPTyNb9nmNYvfyeiqOgUdaxXaY1ZsnCUlHCcOJ
 u5vf/R3p0YTOjIIKEhL7+UEXt4i+V1HNIWI6Q7qT4m7OVPvJTP0CbsLkU2dXC7BjHLJK
 k27bCOo2n9VHne0xX81pbDG0LBK6Vu5vPW0pPAbPlG7HZnw7xwBhNl+o0Ne/tbkIRg5I
 ux5gGPDV2PGKmvMqv8bon/7XCDMkQv6JmoqCrEBDFhsmKXji1CvKr+DtUtQ9aws8U+sR
 YbZYRswR7oFr+3X6FWp/h4MmoBtLkTuU3i+4Q5zi5eZU2+LJlaNm8GXLsf2gCznTEwva
 A8mw==
X-Gm-Message-State: ANhLgQ2lUByVu/KoR7FdZDKg2X0j0xe2S2qZCsck7gg5L/4e2tjl+CiQ
 fcsFUxs5ZLCa54Z7LHObXXg=
X-Google-Smtp-Source: ADFU+vsdM3mbTPQBMevcUkjAI+m/Vqp9UZy5xEiHOQ3XRZA7+etAQs3iMb0sTquEGpaZvcKIFHDPrQ==
X-Received: by 2002:a92:8151:: with SMTP id e78mr936348ild.227.1585093730380; 
 Tue, 24 Mar 2020 16:48:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-243-191-173.hsd1.co.comcast.net.
 [73.243.191.173])
 by smtp.gmail.com with ESMTPSA id c12sm6804109ila.31.2020.03.24.16.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 16:48:50 -0700 (PDT)
From: Kelsey Skunberg <skunberg.kelsey@gmail.com>
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 bhelgaas@google.com
Date: Tue, 24 Mar 2020 17:48:48 -0600
Message-Id: <20200324234848.8299-1-skunberg.kelsey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: rbilovol@cisco.com, ddutile@redhat.com, ruslan.bilovol@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, bodong@mellanox.com
Subject: [Linux-kernel-mentees] [PATCH] PCI: sysfs: Change bus_rescan and
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

Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
---
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
