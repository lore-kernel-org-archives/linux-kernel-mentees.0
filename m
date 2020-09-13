Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847B2C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 20:53:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E0721897
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 20:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="G7fh7AM4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E0721897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F3809203AE;
	Sun, 13 Sep 2020 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02WOQOK5YOLJ; Sun, 13 Sep 2020 20:53:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82DEF2001E;
	Sun, 13 Sep 2020 20:53:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 764CAC0864;
	Sun, 13 Sep 2020 20:53:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B17B8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE23F84917
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 20:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RL2j9InbdIa6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 20:53:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 512EC84785
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0576451B57;
 Sun, 13 Sep 2020 22:53:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uD88JP-5yYE2; Sun, 13 Sep 2020 22:53:24 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1600030404; bh=UrvqDqUQJLOBWuy3OvWNQKkS9HF5ID8Gp9n1Na8LtD8=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=G7fh7AM4C5J1evTE+bHFGDlr8q6R8JTpEQX80i5SR/hiCMzz1DJgMOdSFw/jErRJR
 iRG7jTxLnCmX4ZaYCuyqVJwI+t7bxCbCY/Obbf8NS1M51RFnCxZgUVA6lO3vfM+zWO
 I9WwVLLFkLs7YPa6aPEDPazm7MeRFHl581Tb7gZSdFcwEClI+Juc6WijTTuzcdjKHS
 LZ8V7qndaUa6JPSIetWuyGMoNMoUY9YfkdipzClDMGLo+UVgBaqxsU9jbqcVIuFh9+
 VczY0yrTaYD3qDn6dsJWZKGhzYjP0aDMtc7b2+/bKzL9+En20Vbf65tHgF3UEYXKyK
 7xpbisNzFT5MQ==
Date: Sun, 13 Sep 2020 20:53:20 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <8178fe030ae071aec6397987e672e0fb@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2009132005270.6806@felia>
References: <alpine.DEB.2.21.2009132005270.6806@felia>
 <alpine.DEB.2.21.2009131220070.22585@felia>
 <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
 <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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

Sir,

> Yes, we should investigate that. If checkpatch.pl does not work properly
> with git ranges, we should fix that first. Otherwise, all our evaluations
> are broken...

I noticed one more issue (more likely issue with git):

If I run:

$ scripts/checkpatch.pl --show-types -g d31275a9dc0b..a02254f8a676

Output is: https://gist.githubusercontent.com/eldraco19/b979e752baa2c6fdc1776c8b65dfa21e/raw/39ad42113141929d93142d9a2962759b4b6b2e3b/checkpatch_issue.txt

which doesn't include some in-between commits like: 3dbf1ee6abbb, 69388e15f507 e.t.c.

Strangely it includes commit like 022467444515, which isn't even in the given range.

then with,

$ git log --no-merges --oneline 
.
.
a02254f8a676 dmaengine: ioat: Decreasing allocation chunk size 2M->512K
bd2bf302eef2 dmaengine: ioat: fixing chunk sizing macros dependency
2fea2906b5cb dmaengine: Fix misspelling of "Analog Devices"
b3cb14310eb4 dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema
cde9a96ee24f dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
fc6f5d0a4983 dmaengine: dw-edma: Decouple dw-edma-core.c from struct pci_dev
69388e15f507 pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
3dbf1ee6abbb pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
9f676e5313c1 gpio: mlxbf2: remove unused including <linux/version.h>
b392350ec3f2 ALSA: hda/hdmi: Add module option to disable audio component binding
4c2b54f73aba gpio: dwapb: Split out dwapb_get_irq() helper
c59042ed8965 gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
4f344e86c739 gpio: dwapb: Drop bogus BUG_ON()s
48ce80568346 gpio: dwapb: Switch to more usual pattern of RMW in dwapb_gpio_set_debounce()
d31275a9dc0b gpio: dwapb: Convert to use IRQ core provided macros
.
.
(trimmed output for specific range)

It shows all the commits in between.

But if I run:

$ git log --no-merges v5.7..v5.8 --oneline
.
.
a02254f8a676 dmaengine: ioat: Decreasing allocation chunk size 2M->512K
bd2bf302eef2 dmaengine: ioat: fixing chunk sizing macros dependency
2fea2906b5cb dmaengine: Fix misspelling of "Analog Devices"
b3cb14310eb4 dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema
cde9a96ee24f dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
fc6f5d0a4983 dmaengine: dw-edma: Decouple dw-edma-core.c from struct pci_dev
3dbf1ee6abbb pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
9f676e5313c1 gpio: mlxbf2: remove unused including <linux/version.h>
4c2b54f73aba gpio: dwapb: Split out dwapb_get_irq() helper
c59042ed8965 gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
4f344e86c739 gpio: dwapb: Drop bogus BUG_ON()s
48ce80568346 gpio: dwapb: Switch to more usual pattern of RMW in dwapb_gpio_set_debounce()
d31275a9dc0b gpio: dwapb: Convert to use IRQ core provided macros
.
.
(trimmed output for specific range)

It shows commit 3dbf1ee6abbb but not 69388e15f507.
I confirmed both commits are present in tree from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-5.8.y&ofs=18900


I think it is an issue with git.

Please give your opinion on this.

Thanks,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
