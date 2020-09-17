Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C3DC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:53:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8293622211
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 14:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KmqnzkHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8293622211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0710720431;
	Thu, 17 Sep 2020 14:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGSP430aEe1c; Thu, 17 Sep 2020 14:53:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CD3CB203E9;
	Thu, 17 Sep 2020 14:53:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1D0AC0864;
	Thu, 17 Sep 2020 14:53:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73C8CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5C2D787675
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwJcWRYg+9HE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:53:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E596487646
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 14:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 64F0E529B1;
 Thu, 17 Sep 2020 16:53:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id alusn0SrReI9; Thu, 17 Sep 2020 16:53:36 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1600354411; bh=p3fT1aaFGZTGDTMrJDyVAj1K8o3PkclZnU7n4aq0Wa8=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=KmqnzkHEmq5cFpAeXfvb+7RRBNz8CUUWu3iO+5Es4HTnhaSyuWAlanuaDfA/g1zNq
 Z5jhaRvaKgZrcqpo0x6FDcT8i1Tysu+5Xh+A9rjQVqivcoMzQkGb/3rDZUUVB/WCi7
 PXzUB6qP25Ee1Lf7H9MdTISRhOyWaphiDalOUen7z4qeBCMYoYYrfNo8KtGKsLIG0n
 bFfnikVWMOBKIwNA6FqjMvR6mmvH56Z7pv1Hd2v+BkCl8sSqrZzk1Oa6LwdVeGxmKl
 Ab9hxzta4SM9OomcXmXs7EvJc1ekpGs2NzKffWUtpSF4MheIq1Z2o6b9fRTbJB03k0
 NFtv5E9jrSwaA==
Date: Thu, 17 Sep 2020 14:53:31 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <93e1e3d520482c0621176a9d2e6777b5@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2009140708240.7737@felia>
References: <alpine.DEB.2.21.2009140708240.7737@felia>
 <alpine.DEB.2.21.2009132005270.6806@felia>
 <alpine.DEB.2.21.2009131220070.22585@felia>
 <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
 <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
 <8178fe030ae071aec6397987e672e0fb@disroot.org>
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

I am sorry for the late reply, my health condition was not good in last few days.

> What is the problem you encountered? What did you expect? What did you
> observe? Which lines of code are involved? What git command is called?
> 
> Why do you expect a certain behaviour?were

When the git log is (trimmed portion of git log --no-merges --oneline):

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

then to check commits in this range, I will run:

$ scripts/checkpatch.pl --show-types -g d31275a9dc0b..a02254f8a676

The output is
https://gist.githubusercontent.com/eldraco19/b979e752baa2c6fdc1776c8b65dfa21e/raw/39ad42113141929d93
42d9a2962759b4b6b2e3b/checkpatch_issue.txt

here we can see:
1. Not all in-between commits are checked by checkpatch.pl
2. Some new commits (which are not in the given range) are also checked by checkpatch.pl

checkpatch internally used the following command for collecting the commit log:

$ git log --no-color --no-merges --pretty=format:'%H %s' $git_range

The result of this command is not what we expect checkpatch to test.

Please correct me if I am wrong.

Also I checked other evaluation too.
(https://lore.kernel.org/linux-kernel-mentees/e6fa87d7-3b80-390f-4db2-40e977a4b635@gmail.com/T/#m17c
7f43426bd44b16c4b7f7e59559ed2c8b69a0)

I am looking into that bug and will try to fix it in v3.

Regards
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
