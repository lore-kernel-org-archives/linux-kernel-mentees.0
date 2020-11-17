Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEE5C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 19:17:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC37E24248
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 19:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DacGbQXh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC37E24248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 47EDA214FD;
	Tue, 17 Nov 2020 19:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNrGB43Qt9sV; Tue, 17 Nov 2020 19:17:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CB2DA2094E;
	Tue, 17 Nov 2020 19:17:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B579FC0800;
	Tue, 17 Nov 2020 19:17:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C215C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5024F214FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZy9G-B0fUrr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:17:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C8522094E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 19:17:31 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j5so10775200plk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dpv3Vtg5vqLA90R+rlo2PRGIMTldlcoURJnFcnkg+9k=;
 b=DacGbQXhvF2/oDJarOOitDPGudRYd96K+W+S1yovH+/ox64CHWmxpR3BEw7znXZkA5
 W6p6zEHHo/n1rrJ08Zw7KGJRKS/D2eTupcWl65sLIRGNcPMmTei4guy1wc683nnztGXp
 BUQsy7/BTuToGRZ0VSGZWd4iXtJWRGXJ1wUoH/Nuj2BXmJ/AoM1kMZZ77TmCAZMUCMpw
 EArVKlCB4uFE40DiV3lTco82OcZrFmUxHZ9jajTqbf2son8ZaRZp8QiORpK4GM/N3yYH
 7Fsi/g/en4mzNAdf5cYUCr6J0/Sqg5IhE5qtg5G8I0FEvzk9WxDLSHOyJ2WKG0wpI4Rs
 cemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dpv3Vtg5vqLA90R+rlo2PRGIMTldlcoURJnFcnkg+9k=;
 b=NB8S+6zEv+hCZnwFTUWPlyZHxXDekwWVhoA9+5cBZRiM2F53LAE9U7CiKuz+H3t3H3
 7qld0oz47ytu5LaHj+iYIo5fkzlCJrUrrYFj0jIQIW5VBOU4zAgP58LkP8a+7a9tjzve
 VyysKj/syt0Ec/o9AzjEisvQy5IoE76CziAugrMO4xXIdZ1bCku80xkHYoWpMzED+91S
 yvw2Goom0jQ8xYiGRCQwTJe+PpnMtFf6Iu2RQMC2l8kuGTAxXhBZvlxqCzetqN8Jjs9x
 NPVt5bppVQ9sNh0+KN689q+l/PcFWfiDiTYFVDwbyIh00FCeRZ6M8b1OURrgqLAubh9P
 yKRw==
X-Gm-Message-State: AOAM5303U4Utgi4dRszLRkZa4XU8lHbTKLRuUu0TTh01uXSuNbvYn496
 s6xkqKs8ZTDJLuznGdEPCjw=
X-Google-Smtp-Source: ABdhPJwI+d0YvJcqf66Hvd4PP8z2uKvhci/ij+wUKUE1p4ue/199Os3b70gjnUU6HpF8YYb9gTvtkw==
X-Received: by 2002:a17:902:c3c9:b029:d6:7e88:cfa9 with SMTP id
 j9-20020a170902c3c9b02900d67e88cfa9mr891301plj.64.1605640649174; 
 Tue, 17 Nov 2020 11:17:29 -0800 (PST)
Received: from localhost.localdomain ([210.56.123.179])
 by smtp.googlemail.com with ESMTPSA id h32sm19073591pgl.36.2020.11.17.11.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:17:28 -0800 (PST)
From: Puranjay Mohan <puranjay12@gmail.com>
To: bjorn@helgaas.com
Date: Wed, 18 Nov 2020 00:47:18 +0530
Message-Id: <20201117191718.17885-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] PCI: Change return type of
	pci_find_capability()
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

PCI Capabilities are linked in a list that must appear in the first 256 bytes of config space.
The Capabilities Pointer register at 0x34 contains the address of the first Capability in the list.
Each Capability contains an 8 bit "Next Capability Pointer" that is set to 0x00 in the last item of the list.

Change the return type of pci_find_capability() from int to u8 to match the specification.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 drivers/pci/pci.c   | 4 ++--
 include/linux/pci.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 6d4d5a2f923d..05ac8a493e6b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -477,9 +477,9 @@ static int __pci_bus_find_cap_start(struct pci_bus *bus,
  *  %PCI_CAP_ID_PCIX         PCI-X
  *  %PCI_CAP_ID_EXP          PCI Express
  */
-int pci_find_capability(struct pci_dev *dev, int cap)
+u8 pci_find_capability(struct pci_dev *dev, int cap)
 {
-	int pos;
+	u8 pos;
 
 	pos = __pci_bus_find_cap_start(dev->bus, dev->devfn, dev->hdr_type);
 	if (pos)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 22207a79762c..19a817702ea9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1063,7 +1063,7 @@ void pci_sort_breadthfirst(void);
 
 /* Generic PCI functions exported to card drivers */
 
-int pci_find_capability(struct pci_dev *dev, int cap);
+u8 pci_find_capability(struct pci_dev *dev, int cap);
 int pci_find_next_capability(struct pci_dev *dev, u8 pos, int cap);
 int pci_find_ext_capability(struct pci_dev *dev, int cap);
 int pci_find_next_ext_capability(struct pci_dev *dev, int pos, int cap);
@@ -1719,7 +1719,7 @@ static inline int __pci_register_driver(struct pci_driver *drv,
 static inline int pci_register_driver(struct pci_driver *drv)
 { return 0; }
 static inline void pci_unregister_driver(struct pci_driver *drv) { }
-static inline int pci_find_capability(struct pci_dev *dev, int cap)
+static inline u8 pci_find_capability(struct pci_dev *dev, int cap)
 { return 0; }
 static inline int pci_find_next_capability(struct pci_dev *dev, u8 post,
 					   int cap)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
