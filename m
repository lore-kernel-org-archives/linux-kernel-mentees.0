Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E09AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B18206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aynnQr9y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B18206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9AB742201C;
	Mon, 13 Jul 2020 13:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHMx7yybEO-a; Mon, 13 Jul 2020 13:22:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA5382002A;
	Mon, 13 Jul 2020 13:22:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4C12C0888;
	Mon, 13 Jul 2020 13:22:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF5AFC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B45288A89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6htPSMfj-4oj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B80888A60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:40 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id by13so13644595edb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wIKAQlJ5EJGoiOmdek0QEY4ROpHfaSKBPeLwiXvsVhs=;
 b=aynnQr9yYe4ZZ1ZrHtzXBl8SSf7HblZmsshVDBYFj9NrSxrnGirktKY/HZ6DlVUMRo
 zNvyjcCe47FefuyS03sMQ0xLJU58XwtxM5ihWJNrNC2+oGFM0+m4u9grTzP5heNWjczx
 46yKHiCd0qOYmibGFbP82US3V33mP0Qz0BbBs7sHjirydyTG/dP5i0Hb0YjsXuMO4BrB
 FQjDcLEEkoFdmrx7ZqmJHkTM8sy+pfx+sQgIDDFcPfSILhRS0uByhwHVIsHH5nCCoqc+
 N7S6TcWUMbpn/D7sJPLW9GfWUJxg0hVocp07mU4YHB2kVH1+fvOOX+9UChqHzqBvN4sx
 oxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wIKAQlJ5EJGoiOmdek0QEY4ROpHfaSKBPeLwiXvsVhs=;
 b=aVWnyUSUwQUxma3wS9+agHX2mNFfj7Zj7vXC4nrmn/H2wO5elOv8+CuWtsyWOox96d
 2VVy2g9XrgtPrAhuuHN1SPWD8UYgARtPWTTiR/4bSxcQqFhNdWVDkqbq/3yKnwepfDz4
 uSgK6/MCUgB06O//eJaZRT7D4XidTv7R0puSTVyIgmxUIufq5z5h/3z/m//U2vpmPor0
 V6Rs0UFktf5dU9rJgDPazZ+UZQ24xHDBQCp0tYY2jZ67wtkIObUbmPE3xBfaWlmfLGsZ
 TY7TsCeCbucQ9yCLhmeJht1Q5HJYgC6d1yPCLEofwNWAi79KxuD8u1Ktd1KCqQg98qA0
 YRag==
X-Gm-Message-State: AOAM533+tbbAL/slJhmySmRt8FS7N+CLJaHve0IPX4wPO4KCUsnjirOR
 kC+A94YaXGWuCKGFyJCP+J4=
X-Google-Smtp-Source: ABdhPJwUad8FS77l0N6XR9hbRFDjoFcDuPDZlPtaI+ROx0M/Xa+ASTlCW28qVdgQnqcUOGj6m510DA==
X-Received: by 2002:a05:6402:1ca6:: with SMTP id
 cz6mr70528395edb.171.1594646558717; 
 Mon, 13 Jul 2020 06:22:38 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:38 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Michael Buesch <m@bues.ch>
Date: Mon, 13 Jul 2020 14:22:14 +0200
Message-Id: <20200713122247.10985-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 02/35] ssb: Change
	PCIBIOS_SUCCESSFUL to 0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/ssb/driver_gige.c    | 4 ++--
 drivers/ssb/driver_pcicore.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ssb/driver_gige.c b/drivers/ssb/driver_gige.c
index ebee6b0e3c34..ccb4a35715bf 100644
--- a/drivers/ssb/driver_gige.c
+++ b/drivers/ssb/driver_gige.c
@@ -134,7 +134,7 @@ static int ssb_gige_pci_read_config(struct pci_bus *bus, unsigned int devfn,
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int ssb_gige_pci_write_config(struct pci_bus *bus, unsigned int devfn,
@@ -164,7 +164,7 @@ static int ssb_gige_pci_write_config(struct pci_bus *bus, unsigned int devfn,
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int ssb_gige_probe(struct ssb_device *sdev,
diff --git a/drivers/ssb/driver_pcicore.c b/drivers/ssb/driver_pcicore.c
index c1186415896b..1b67af1097c8 100644
--- a/drivers/ssb/driver_pcicore.c
+++ b/drivers/ssb/driver_pcicore.c
@@ -212,7 +212,7 @@ static int ssb_pcicore_read_config(struct pci_bus *bus, unsigned int devfn,
 				     PCI_FUNC(devfn), reg, val, size);
 	spin_unlock_irqrestore(&cfgspace_lock, flags);
 
-	return err ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+	return err ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 static int ssb_pcicore_write_config(struct pci_bus *bus, unsigned int devfn,
@@ -226,7 +226,7 @@ static int ssb_pcicore_write_config(struct pci_bus *bus, unsigned int devfn,
 				      PCI_FUNC(devfn), reg, &val, size);
 	spin_unlock_irqrestore(&cfgspace_lock, flags);
 
-	return err ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+	return err ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 static struct pci_ops ssb_pcicore_pciops = {
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
