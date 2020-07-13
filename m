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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E632CC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72EB20773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayIR4bAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72EB20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9906B89188;
	Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPCFy8pCldlg; Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D73A891D2;
	Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07D5BC0888;
	Mon, 13 Jul 2020 13:23:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F89EC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 09B9689188
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhJHMhNLKPtH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 11998891E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:15 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id o18so17133533eje.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lE8AN0pbCu/dDP6jrScw+PxyAG3fiRl3vN639OZNf9c=;
 b=ayIR4bAOLjTG4FPDTwj9Bv/rT1Mu5DSxUxmly1JRltd3/t49vc11ms35/6SaQTBnDW
 grgTbiRcbvJv/DP8VfCI2t5YIAma/O83HsL8bg6F3jmYn8DjHIHlFyBlPbwgK9NZvLpV
 NhVTBRZ7lKyJjY2HhB4nOgVrjuzjGx7Gbvx/0Ct/jc4ZoZkaXRHDGimKOxD6qy9dBCS+
 sqcnADgH9diLoghHvHkKw+ljTOKr7vUjZGCiVth+JL4t+Oj2ZMh2VG+Nl97H8BDvhtip
 06AOHg8fxgsVax5a7Dn03qBbGWuJCeSxlPhhmGspiYLN45bio5jqhu1ESiQs78Ezc6ow
 QJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lE8AN0pbCu/dDP6jrScw+PxyAG3fiRl3vN639OZNf9c=;
 b=Ru//auY3Io0O8fHxbQ7vDAN6gySLySDQAkS2j9Wa7/equqe/TeBARo+lwODdF1zUk9
 aP4KCg/3J6Owkjnc371iSFEVUIFGuFukfz4zqJb1gLJt+a/YXOCHY+RjR7p2WtTQ6BDT
 CsGcz+9DRiy1eDNd+r4XLKLKymd/PwnVutA3Cs6GNQMUDwnb3HEJEwWyMk3ik6pAnWVB
 k5INhWpWlDk54d/gPYD9tOyIo0cj67PRGrimOPfZitwAbpncm+szHFSr4cmN0Gva1K2U
 D3WWoa2j8+rxaIEIN7vBa+NNs49KgPYhR7Pt5uLpWyJxa1nR+QVUseZoiHnP8fQoDfcb
 PcEQ==
X-Gm-Message-State: AOAM533Lxi82HrN/+mjM8Q3k7vVS2Fenl9NqcYNT6702G2WzCoaxVMcX
 3kDe/Yv6rEnY+8tl1B1jxl0=
X-Google-Smtp-Source: ABdhPJxhwheaZHFk6xB+rN51Yz6X0yo6JNfKZG64pSHUWsziY38Td4p53F5FZbITqU6TE36B/dChCA==
X-Received: by 2002:a17:906:c24e:: with SMTP id
 bl14mr71978064ejb.285.1594646593479; 
 Mon, 13 Jul 2020 06:23:13 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:13 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Date: Mon, 13 Jul 2020 14:22:39 +0200
Message-Id: <20200713122247.10985-28-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 27/35] powerpc: Tidy
	Success/Failure checks
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

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 26/35

 arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
 arch/powerpc/platforms/pseries/eeh_pseries.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 92f145dc9c1d..834cb6175cc4 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -318,7 +318,7 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 
 	if (!edev || !edev->pcie_cap)
 		return 0;
-	if (pnv_pci_cfg_read(pdn, pos, 4, &header) != 0)
+	if (pnv_pci_cfg_read(pdn, pos, 4, &header))
 		return 0;
 	else if (!header)
 		return 0;
@@ -331,7 +331,7 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 		if (pos < 256)
 			break;
 
-		if (pnv_pci_cfg_read(pdn, pos, 4, &header) != 0)
+		if (pnv_pci_cfg_read(pdn, pos, 4, &header))
 			break;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 9c023b928f2c..aec6f76879a9 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -200,7 +200,7 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
 
 	if (!edev || !edev->pcie_cap)
 		return 0;
-	if (rtas_read_config(pdn, pos, 4, &header) != 0)
+	if (rtas_read_config(pdn, pos, 4, &header))
 		return 0;
 	else if (!header)
 		return 0;
@@ -213,7 +213,7 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
 		if (pos < 256)
 			break;
 
-		if (rtas_read_config(pdn, pos, 4, &header) != 0)
+		if (rtas_read_config(pdn, pos, 4, &header))
 			break;
 	}
 
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
