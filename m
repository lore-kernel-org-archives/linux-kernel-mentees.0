Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B31C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 05:12:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDCBB214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 05:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvGmo8rD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDCBB214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E6D885F79;
	Mon, 14 Sep 2020 05:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zR2cBW8_Fqj8; Mon, 14 Sep 2020 05:12:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EEC1585F77;
	Mon, 14 Sep 2020 05:12:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5156C088B;
	Mon, 14 Sep 2020 05:12:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCF27C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B5EEE85F77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nC99kSsiErsd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:12:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D413885F75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:12:12 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id r7so21262960ejs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 22:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=r/kPEICVkmCB7ZXrYZMgoQ7sz8+zlwLXXhZLaVuTWVU=;
 b=hvGmo8rDY9/Z/nrJMtLUDiZt2FA6rXz5Ts1Sz+bxcm2L94n7DbfD8EQk+M0VCb8Rhx
 E7gzceYH/TAk6OzK3STfYST4IeTjRcShL/ktnU9EWInF4GEjHh1Tx/XnLqQgRx9VQurz
 ducZYcWBzWHO141/FqHU0moQPKJ5nD6SfqCnGTum3FmjqVrSVicsCz9GCy2JOYV4aUPN
 ulHi1Pmrm3MGkL/kgo+zYARsqgHIiThWaSL3oYQEe+/5FkjVibvIvDFcr+0isAq0vA9E
 GurOCA/9oyBPUgRjQD2M0+3np4jkcvkIDviJVU/7QmRVjtg6U+aEVlIA+vs0ClkoZG/V
 ajww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=r/kPEICVkmCB7ZXrYZMgoQ7sz8+zlwLXXhZLaVuTWVU=;
 b=QtdlIwS5l+2FCPpJ5031M9Py16PaxGmmEozyaMEXzr3gexaWF4jkLsp066RvLw7+Wv
 FrrVXEqZQ0RrlFuY1VNEVT9BkCtbwzqiaL5onLdiuAvenc+91UHc+97WsCBis2eUEt79
 ZypzFlIR2dhjsQPJM6bz4yeiGrgfoJBaQ9+E2DGJz4/OkZYi5PcDyJoOz2b3d198XAj2
 AtoI8Yuy9+OpCnXF3NboL0XW1F3q4LzI70nQtkZ8Yy8C4gz66BPheLJSR59yuvMCMBNy
 q/GKo6K29x8Lv9rnRomHs5iDdGYuLEsoM9NO9MJ+xJn2ehJxpxZE4hOsGqebnJXRkxSr
 fWPA==
X-Gm-Message-State: AOAM533o2pjAAH4g7cMPVutKe7X9rkgvO+ab61nz/MVGPRzTvNhxDwSU
 j2QNZFZRiiJauZrNPR/By+A=
X-Google-Smtp-Source: ABdhPJxgNbjj+VQDX/uoNIRuNlQB7Ulxg7r2RZicjUJdmjxXirOJs0pNS1s/xDC7CU+2GgiEx5+ttg==
X-Received: by 2002:a17:907:2506:: with SMTP id
 y6mr12297677ejl.265.1600060331100; 
 Sun, 13 Sep 2020 22:12:11 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id lg22sm6987700ejb.48.2020.09.13.22.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 22:12:10 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 07:12:04 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <8178fe030ae071aec6397987e672e0fb@disroot.org>
Message-ID: <alpine.DEB.2.21.2009140708240.7737@felia>
References: <alpine.DEB.2.21.2009132005270.6806@felia>
 <alpine.DEB.2.21.2009131220070.22585@felia>
 <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
 <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
 <8178fe030ae071aec6397987e672e0fb@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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



On Sun, 13 Sep 2020, Ayush wrote:

> Sir,
> 
> > Yes, we should investigate that. If checkpatch.pl does not work properly
> > with git ranges, we should fix that first. Otherwise, all our evaluations
> > are broken...
> 
> I noticed one more issue (more likely issue with git):
> 
> If I run:
> 
> $ scripts/checkpatch.pl --show-types -g d31275a9dc0b..a02254f8a676
> 
> Output is: https://gist.githubusercontent.com/eldraco19/b979e752baa2c6fdc1776c8b65dfa21e/raw/39ad42113141929d93142d9a2962759b4b6b2e3b/checkpatch_issue.txt
> 
> which doesn't include some in-between commits like: 3dbf1ee6abbb, 69388e15f507 e.t.c.
> 
> Strangely it includes commit like 022467444515, which isn't even in the given range.
> 
> then with,
> 
> $ git log --no-merges --oneline 
> .
> .
> a02254f8a676 dmaengine: ioat: Decreasing allocation chunk size 2M->512K
> bd2bf302eef2 dmaengine: ioat: fixing chunk sizing macros dependency
> 2fea2906b5cb dmaengine: Fix misspelling of "Analog Devices"
> b3cb14310eb4 dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema
> cde9a96ee24f dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
> fc6f5d0a4983 dmaengine: dw-edma: Decouple dw-edma-core.c from struct pci_dev
> 69388e15f507 pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
> 3dbf1ee6abbb pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
> 9f676e5313c1 gpio: mlxbf2: remove unused including <linux/version.h>
> b392350ec3f2 ALSA: hda/hdmi: Add module option to disable audio component binding
> 4c2b54f73aba gpio: dwapb: Split out dwapb_get_irq() helper
> c59042ed8965 gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
> 4f344e86c739 gpio: dwapb: Drop bogus BUG_ON()s
> 48ce80568346 gpio: dwapb: Switch to more usual pattern of RMW in dwapb_gpio_set_debounce()
> d31275a9dc0b gpio: dwapb: Convert to use IRQ core provided macros
> .
> .
> (trimmed output for specific range)
> 
> It shows all the commits in between.
> 
> But if I run:
> 
> $ git log --no-merges v5.7..v5.8 --oneline
> .
> .
> a02254f8a676 dmaengine: ioat: Decreasing allocation chunk size 2M->512K
> bd2bf302eef2 dmaengine: ioat: fixing chunk sizing macros dependency
> 2fea2906b5cb dmaengine: Fix misspelling of "Analog Devices"
> b3cb14310eb4 dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema
> cde9a96ee24f dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
> fc6f5d0a4983 dmaengine: dw-edma: Decouple dw-edma-core.c from struct pci_dev
> 3dbf1ee6abbb pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
> 9f676e5313c1 gpio: mlxbf2: remove unused including <linux/version.h>
> 4c2b54f73aba gpio: dwapb: Split out dwapb_get_irq() helper
> c59042ed8965 gpio: dwapb: Drop of_match_ptr() & ACPI_PTR() calls
> 4f344e86c739 gpio: dwapb: Drop bogus BUG_ON()s
> 48ce80568346 gpio: dwapb: Switch to more usual pattern of RMW in dwapb_gpio_set_debounce()
> d31275a9dc0b gpio: dwapb: Convert to use IRQ core provided macros
> .
> .
> (trimmed output for specific range)
> 
> It shows commit 3dbf1ee6abbb but not 69388e15f507.
> I confirmed both commits are present in tree from:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-5.8.y&ofs=18900
> 
> 
> I think it is an issue with git.
> 
> Please give your opinion on this.
>

I cannot follow your description and explanation.

What is the problem you encountered? What did you expect? What did you 
observe? Which lines of code are involved? What git command is called?

Why do you expect a certain behaviour?

I would bet that you misunderstand git and git is not broken; so, convince 
us on the mailing list that I lose this bet.

You can do better explaining, then we might help you.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
