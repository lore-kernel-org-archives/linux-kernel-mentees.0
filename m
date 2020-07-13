Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CD9C43478
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B9242082E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzzU4rig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B9242082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B6F288C7A;
	Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZkuCLYnqszW; Mon, 13 Jul 2020 13:23:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 86C8588CBE;
	Mon, 13 Jul 2020 13:23:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76673C0888;
	Mon, 13 Jul 2020 13:23:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85464C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EF042288E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mz-abDUjJua5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id BF18F226F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id ga4so17131093ejb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ySb4cVyYF18JeJj5T0tFW5w6nctyAdZFTa9nqX2wG3w=;
 b=bzzU4rigZM9VgRrJDuA8G5wyBzew6OWrk1bRB1hncHk2DuUfRSXS9DugQIKc+P3SL2
 4q/JI8q53ZGvCgnkAgEVAwL2QWxLBuEmO6jpKHwClHiE+ceDHaXRFPmv3UeTlaDhUSpV
 Qd9OKdINsDyM83qMCnxqiVA17fifLRggAWNQsyb5vPCCVL1srTdbmNuNqUaJRmhsPYyp
 zJYRYPPNLE+A98f3jqiDrGLhVKlUw2xIDzN+eRfrWuJKy/NDKGQivQMgwjVEJHHqAEQ1
 YR5OC7esz4U91cA6VE8pdCHKVv1BLtr+EzJZsU41cXjZ672C4P+VU0M4ULWWghne2yto
 z+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ySb4cVyYF18JeJj5T0tFW5w6nctyAdZFTa9nqX2wG3w=;
 b=UTuURkcQ5Aliah5/ulTZiFnb4rqvCLvQ+VF7gQB2lCiqfTUj5rG/AplRhTamRyu2OZ
 Py22Dyol+7ymt/2w0ncHgNbkRAdz/A6tfejhcqaIWe72PafX9VqbwEpUP38YUQFkNeaK
 vMTK4jks+WFytZPBOne3jLmBPYvaFw1eL8YP8Vp2ACYoFeVrwJhuYgDukqiAukTicrZI
 BL0AHBUCH/b6P7J3CneDvoVfuM4kGBI4Qa3kzPa1AwNTUEkun1aRUhIG4w5o82O9E0lC
 4uj815b/FutVuG3lYJ113ePi0b2I7ss6oxMrCY2cf20hvYAhwVA/jAN99lH2thu5SNJ/
 YDQA==
X-Gm-Message-State: AOAM532VQ6GB8D9OwVAHNJ2DSUMIDrAIYLzvX+A99tBjd0uCYbArBHhj
 rJM5Vf878DfsTjWLqNahHBc=
X-Google-Smtp-Source: ABdhPJz3ndHhmUstEcyV1mn6y1reXaOd6GVIU3cHrLl2Y08PMWPQUjU3IZX1hl4wZmswvHyE2N4Y6Q==
X-Received: by 2002:a17:906:4dd4:: with SMTP id
 f20mr77157529ejw.170.1594646597332; 
 Mon, 13 Jul 2020 06:23:17 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:16 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Michal Simek <monstr@monstr.eu>
Date: Mon, 13 Jul 2020 14:22:42 +0200
Message-Id: <20200713122247.10985-31-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 30/35] microblaze: Change
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
 arch/microblaze/pci/indirect_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/pci/indirect_pci.c b/arch/microblaze/pci/indirect_pci.c
index 1caf7d3e0eef..1f04a1f2c30b 100644
--- a/arch/microblaze/pci/indirect_pci.c
+++ b/arch/microblaze/pci/indirect_pci.c
@@ -65,7 +65,7 @@ indirect_read_config(struct pci_bus *bus, unsigned int devfn, int offset,
 		*val = in_le32(cfg_data);
 		break;
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int
@@ -132,7 +132,7 @@ indirect_write_config(struct pci_bus *bus, unsigned int devfn, int offset,
 		break;
 	}
 
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static struct pci_ops indirect_pci_ops = {
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
