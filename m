Return-Path: <SRS0=lIAf=FD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB837C3E8C5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 16:46:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009BB20727
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 16:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxXgVcAv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009BB20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75DC3872D4;
	Sun, 29 Nov 2020 16:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJfiDiUj1YAT; Sun, 29 Nov 2020 16:46:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBAB7872D0;
	Sun, 29 Nov 2020 16:46:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B40A8C0859;
	Sun, 29 Nov 2020 16:46:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 497D5C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 16:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 459D5872C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 16:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGIeq2n2ZHIl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 16:46:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B176C872B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 16:46:38 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b10so7367318pfo.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePbNVNuf2h+BXgSDx7rTfQZRRCtnCpZLYv1u6UwyijE=;
 b=LxXgVcAvuYRMX8jRzkuJygJWPYX0Vxzy+sAyq65jEYJWpqJH0b48mTNasd+tcJLf1f
 uYZcDhZ+mmSxsxNRIvnrzvFZSXYQJRukmHGz5KYNtpAGKlO3B6d4SA3iISK2OmRMjXbS
 V5WFnI7p5ZMMHs+kSYCNLuzXJXM4Y0D3OdXk5RitjOXew0H/5x749hQVd8HKG9G5Phvz
 I7p40g7iSBNMsdxapQEBa0OyS8NU3s2qM24HOkktUiveIbT3MgvQgyZH1ls9Ys2pIVZE
 10RNt+q1gsyWSZVZzdC+Jmy38NWHHwC44gbbrioSvMK4b/j4w/1Ffp6OIuxAoJkFL03t
 Jubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePbNVNuf2h+BXgSDx7rTfQZRRCtnCpZLYv1u6UwyijE=;
 b=rzzUVnbmRlAcQcYcw//IFRisLme3SxH1fSm1vwbHzqpvpU8SLy7DUluBOb2ppQvfyt
 Y6wTli1OCclNkmxcynWFlCpfF/TYjRsE/Qh7FANYjwH4f1dpBBqx7+4DnBT80+B8yiBn
 R1c4oUlgLhUSTgazCHkAhr/49ofNbPDHwWzCxg3gVMx8hGKowW8nHwc5btCJ/8g93QLD
 2YwCAY9fERBnB8fzJTA1NwbiyrNEpUhz5l+NJajr+2/Nlm6qU11TT3wsYRhFSOk9jorm
 8BBIC9n8y7KzbnvELvd3MVI8TdOQ8rr+fbYENaxpFD6baxQ2lovEHa2w4fR1ZGRBDHid
 T/LA==
X-Gm-Message-State: AOAM530rWlKns1gAzynBhLKl0wwCJLW9DaDuCz8aP5AQxlK6/FprPgYu
 x5sxsL5mVynH+ZQ/n4cyLBI=
X-Google-Smtp-Source: ABdhPJxWtS3E6RQcvY/kw2ez6XNN8zvQWUDwtVFRi7Nt2jkvWBFj0NAMTap7505ZCOvyGANk6l56XQ==
X-Received: by 2002:a17:90a:8d86:: with SMTP id
 d6mr21906563pjo.120.1606668398125; 
 Sun, 29 Nov 2020 08:46:38 -0800 (PST)
Received: from localhost.localdomain ([124.253.118.66])
 by smtp.googlemail.com with ESMTPSA id
 g16sm13684476pfb.201.2020.11.29.08.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 08:46:37 -0800 (PST)
From: Puranjay Mohan <puranjay12@gmail.com>
To: bjorn@helgaas.com
Date: Sun, 29 Nov 2020 22:16:26 +0530
Message-Id: <20201129164626.12887-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] PCI: Return u8 from
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

PCI Capabilities are linked in a list that must appear in the first 256
bytes of config space. The pointer to capabilities is of 8 bits.

Change the return type of pci_find_capability() and supporting
functions from int to u8 to match the specification.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
v1 - change return types of supporting functions of pci_find_capability.
---
 drivers/pci/pci.c   | 8 ++++----
 include/linux/pci.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e578d34095e9..5caae09e0d20 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -399,7 +399,7 @@ static int pci_dev_str_match(struct pci_dev *dev, const char *p,
 	return 1;
 }
 
-static int __pci_find_next_cap_ttl(struct pci_bus *bus, unsigned int devfn,
+static u8 __pci_find_next_cap_ttl(struct pci_bus *bus, unsigned int devfn,
 				   u8 pos, int cap, int *ttl)
 {
 	u8 id;
@@ -438,7 +438,7 @@ int pci_find_next_capability(struct pci_dev *dev, u8 pos, int cap)
 }
 EXPORT_SYMBOL_GPL(pci_find_next_capability);
 
-static int __pci_bus_find_cap_start(struct pci_bus *bus,
+static u8 __pci_bus_find_cap_start(struct pci_bus *bus,
 				    unsigned int devfn, u8 hdr_type)
 {
 	u16 status;
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
