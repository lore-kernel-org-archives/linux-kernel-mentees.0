Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7EEC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:29:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69BB161164
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69BB161164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465F940746;
	Fri, 15 Oct 2021 14:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4UV_gApjs0T; Fri, 15 Oct 2021 14:29:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 657A1406D9;
	Fri, 15 Oct 2021 14:29:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43F87C000F;
	Fri, 15 Oct 2021 14:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1386FC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E6F83530
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cju27x5Puprj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E09B9834CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:29:41 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id np13so7301674pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRGYUiiPkOf4nvJAYXjsEdQZ9uhs5fYStilswkWIKIU=;
 b=mbgR3J7vdSv9ydYMWh/7rebsHNDZK201cmfpd/sP/GQkhd7GlhzenAoBzgbBCwnXBG
 CAq8Zpd7QORKvVApiIrhgnRPNKEK6ST35pkfMd2FtfsY5vF/zq9X/vg6fa8YhckkADYt
 tNNUwtsmHFdgdufpXYRbBziX3kyROMiDVTqLMytC6w1scCrqwTlHO4q4/hvjGJxLhCdK
 gGvHdPu6r4bqi2JeA9S+O8smBkUr6IXgrL4IhUajdlqSSLTjzIjCJiR5JOdmQHbXd4Gi
 ztnyD8kyLx77TpkEuO5F74jpZ9qlaIOOpVRconGOVNyvkwY0mi4nv74+v7Wm2sRMk4yc
 Xbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRGYUiiPkOf4nvJAYXjsEdQZ9uhs5fYStilswkWIKIU=;
 b=QRXtE1yN66QI7bAXFKkjExtmvNKmOB75zBVBQe8rBz6T9TA3ha4pazg9t26RS4/lxW
 0nYyFcL+HLi+f+NUmK/xY9MmyYXze5ZopKQHB3uwrOlxbvzB8gz6t0ByHDoM6F7/8Ycs
 Q/nUXyjH4RXfGYvRUdk17rNqXk7Y6Q+04QeK/HMLuqOQ0/EZ5kKdD3A0U+09Sef59OLw
 3BX62TVqHmYx0wts9O3lRsR2ahi8bv99zC0WHmDn/eKbhwMiSNFCXWZ255bgXFzOt57X
 Xb4b+am2hhm2TAMm9+6uBEYxUM9hTZmoFvgakVsYhLq7rVCGsxw8LLUQIwy82ApC1kh7
 525w==
X-Gm-Message-State: AOAM533gO+mfyh/gWhxD7i7xiTA4hsQhs1FZ6UrWZY3LQyJttkP193Tv
 thd4RgLwNPSc0GNNpmZHzB4=
X-Google-Smtp-Source: ABdhPJyjQOHOMIPirQe+ArNXa7MTJzJ4Tjdlo6+nV496dLZOdE/edVf0nuqiqNA+WJIBx+vicXR27g==
X-Received: by 2002:a17:90a:de0b:: with SMTP id
 m11mr13852310pjv.90.1634308181312; 
 Fri, 15 Oct 2021 07:29:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 j12sm5210806pff.127.2021.10.15.07.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:29:40 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 02/24] PCI: Set error response in config access defines
 when ops->read() fails
Date: Fri, 15 Oct 2021 19:58:17 +0530
Message-Id: <b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
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

Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
response (~0), when the PCI device read by a host controller fails.

This ensures that the controller drivers no longer need to fabricate
(~0) value when they detect error. It also  gurantees that the error
response (~0) is always set when the controller drivers fails to read a
config register from a device.

This makes error response fabrication consistent and helps in removal of
a lot of repeated code.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 46935695cfb9..b3b2006ed1d2 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -42,7 +42,10 @@ int noinline pci_bus_read_config_##size \
 	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
 	pci_lock_config(flags);						\
 	res = bus->ops->read(bus, devfn, pos, len, &data);		\
-	*value = (type)data;						\
+	if (res)									\
+		SET_PCI_ERROR_RESPONSE(value);			\
+	else										\
+		*value = (type)data;						\
 	pci_unlock_config(flags);					\
 	return res;							\
 }
@@ -228,7 +231,10 @@ int pci_user_read_config_##size						\
 	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
 					pos, sizeof(type), &data);	\
 	raw_spin_unlock_irq(&pci_lock);				\
-	*val = (type)data;						\
+	if (ret)								\
+		SET_PCI_ERROR_RESPONSE(val);			\
+	else									\
+		*val = (type)data;						\
 	return pcibios_err_to_errno(ret);				\
 }									\
 EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
