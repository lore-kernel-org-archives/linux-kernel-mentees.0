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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA12C43446
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEB5206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTWOqfbp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DEB5206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34DCC89188;
	Mon, 13 Jul 2020 13:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-Wi7sCffoWJ; Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D11EF8908C;
	Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C10FBC0888;
	Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63184C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52CB58908C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5cfwge2D+sK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9742B8915B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id dr13so17158362ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DdekBSMp1R6DMOi8Ubgu/NKkVYPxPUhZ+i21xkvtPe8=;
 b=FTWOqfbply9IuxFuX4WbClT+NDxhwIxjM5Ro3JMMJvWUF/qmT2QqYgn9mPlI4ZQhXi
 v2c89Y7pRNNIkGHanZbWp714th0k6d/h/SqBbsn+TQXTvtHl1WfGUK+WeRAROyk9zne2
 GtYuFQG89vv7dtXuHtwkzzKJDhwHfvwWHwTbjCOUd9cUdw41wUN78Ov22kBOR8YHFYQ5
 wrBmxb1+4kdpnw2QV/j7UQp6iZ+bvCdiStFmNnTvD3pP+jCsVYww9Dxnz3+0lznY6oNv
 4kZM5mNHRH1z1WUnoN3xGqKrYKvdrXbBTYmFSue4FHdg/I3vdUFls2hkGjyHozP9urHc
 yikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DdekBSMp1R6DMOi8Ubgu/NKkVYPxPUhZ+i21xkvtPe8=;
 b=WKRHRkqY5rQmJm6uObphjz++AcXzl4XDfRe6HRb9Qp3DPTTtNuSRe9Kd232J9dORNI
 5GKlR9U9HkHuAzclriupQl2MF5OUHNUffu3y4RIC/Ulxiy8ixpuAIi5yOPmlA9CBaaSe
 9THEgltJPy3ek10GRDT8ehxoNrdYPbryKWRMUu/+Qy9WJ+rxzPLiCab4WfSMFhgwvf3Q
 oA+UrbyYpd1wEEAhjDiJIcJiIFIqfI5Te+SWzu8hP2xGkixDQI79na+D0DtDv/20rLa6
 UqHK4dPKtIh32ZFm1CWwAjcBXKimppVpFR7z+taB18s5MX6XeS+6iMjf2sBjw6OzyyUR
 TRjA==
X-Gm-Message-State: AOAM5328YY+i/zI3/ko4oFDgZAvSDP0DGGaE9Jkm5YJ5dbjxZjymZ81f
 VoAslJJqRrNvbLFNoUa3vTg=
X-Google-Smtp-Source: ABdhPJwlZKUK04d4vumCE1XKJSvgTpI1XxdiZZmiZ06iFJo6g09xUAqwOaAm7kBfWxZHFEZ22od4hg==
X-Received: by 2002:a17:906:6606:: with SMTP id
 b6mr77145046ejp.102.1594646575134; 
 Mon, 13 Jul 2020 06:22:55 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:54 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 13 Jul 2020 14:22:25 +0200
Message-Id: <20200713122247.10985-14-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 13/35] cxl: Change
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
There scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/misc/cxl/vphb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/vphb.c b/drivers/misc/cxl/vphb.c
index 1cf320e2a415..1264253cc07b 100644
--- a/drivers/misc/cxl/vphb.c
+++ b/drivers/misc/cxl/vphb.c
@@ -150,7 +150,7 @@ static int cxl_pcie_read_config(struct pci_bus *bus, unsigned int devfn,
 
 out:
 	cxl_afu_configured_put(afu);
-	return rc ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+	return rc ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 static int cxl_pcie_write_config(struct pci_bus *bus, unsigned int devfn,
@@ -184,7 +184,7 @@ static int cxl_pcie_write_config(struct pci_bus *bus, unsigned int devfn,
 
 out:
 	cxl_afu_configured_put(afu);
-	return rc ? PCIBIOS_SET_FAILED : PCIBIOS_SUCCESSFUL;
+	return rc ? PCIBIOS_SET_FAILED : 0;
 }
 
 static struct pci_ops cxl_pcie_pci_ops =
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
