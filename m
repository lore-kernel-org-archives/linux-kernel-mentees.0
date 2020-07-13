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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045ACC432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CD9207F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ0hp1NN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CD9207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9FA9B23223;
	Mon, 13 Jul 2020 13:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seZRcOGjfc9f; Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A09A32313B;
	Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D8BCC0888;
	Mon, 13 Jul 2020 13:23:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28CB6C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 18AC6876E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbf8yOELiTcM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 61132876E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:22 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id a1so17116355ejg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q0DdfK+UqqJL8YcIl12EqmY6PSz1+/PN6RVfEMMF3Q4=;
 b=NJ0hp1NNApuQU8bw6tjVSWHitDg1vIDtFUaeiDmwx+ow60WBbHEGBeAnEHj2j8qP02
 osWR34BF9/0x8PP9hyxdf/f30PfvtWe+O+aml4jtazke07Tlc8rIfTA/0UyD53kV/T0S
 rWlpmKn5qM3eaFqMksBujvyYkHysClu8JPEN4xHZOp3xZ5xRgzdKkinh7WhCxvY5JY3Y
 fi7mzT8DuGLOGVZz2ptsFk4NskphYU8XMgi3rCJu7VPwP/nDmOJP6fv3IlmWScA3Jgip
 NZMp29fPPm1OhZBhqAwiUhNo+exFWu5DYVBfDT19KBqUrNYPzkbNZqWnzLY0/B5iuezX
 3aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q0DdfK+UqqJL8YcIl12EqmY6PSz1+/PN6RVfEMMF3Q4=;
 b=X6mbTUJw/JPtZVH/B9T3nl2WDSdhlCCG1qQyEa2q+gJEXaPtKEQbXh3Rk/gqJqeXQf
 06F/CsLU7GRk5Sce1oKpUd5KGSavpjDS2CAnzS3JbmzN8O1LbSqjKhWw7uIlH5lbxyhX
 TmKbhoDXIs5J5MQfXTcjKnxCpKoOMfURYqKvkEp45iAlCN9DRynSBANr+50/SYs2oOfn
 ShYKg1jMTifdJOzveDe3mWAz6Mtk8JJy4pIdcfhjIP0Ia+ssVanBPrcktuX9EWs29nfm
 3d444FTAk85ptmar+9gb9G4ENCo6+daoxrrF0QbQrl3JM4unA7feb+WMeC8UxPdYvlVS
 qWew==
X-Gm-Message-State: AOAM530Ox1hJj8XgdYLCHyz/BtssU5DfKm9n3UdVaVaZnJBDQOx+LSE1
 t2bRSnyfOpmZZ7ZBkPZyKhM=
X-Google-Smtp-Source: ABdhPJwnEBexXFGQz22NWjdykgIfoLXjIHNBfzIIKQCDH2Im79N2tI7W18NL0nmBRmj7cAZNYPAT3w==
X-Received: by 2002:a17:906:9387:: with SMTP id
 l7mr70963250ejx.274.1594646600908; 
 Mon, 13 Jul 2020 06:23:20 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:20 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Russell King <linux@armlinux.org.uk>
Date: Mon, 13 Jul 2020 14:22:45 +0200
Message-Id: <20200713122247.10985-34-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 33/35] arm/PCI: Tidy
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
This patch depends on PATCH 32/35

 arch/arm/mach-cns3xxx/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-cns3xxx/pcie.c b/arch/arm/mach-cns3xxx/pcie.c
index 7020071a2dc5..c249d4cbf4f0 100644
--- a/arch/arm/mach-cns3xxx/pcie.c
+++ b/arch/arm/mach-cns3xxx/pcie.c
@@ -92,7 +92,7 @@ static int cns3xxx_pci_read_config(struct pci_bus *bus, unsigned int devfn,
 
 	ret = pci_generic_config_read(bus, devfn, where, size, val);
 
-	if (ret == 0 && !bus->number && !devfn &&
+	if (!ret && !bus->number && !devfn &&
 	    (where & 0xffc) == PCI_CLASS_REVISION)
 		/*
 		 * RC's class is 0xb, but Linux PCI driver needs 0x604
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
