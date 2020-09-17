Return-Path: <SRS0=D/zP=C2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06800C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 15:17:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801BE221F1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Sep 2020 15:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sgdwi73R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801BE221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2230E875F7;
	Thu, 17 Sep 2020 15:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6m3yvw20MwxO; Thu, 17 Sep 2020 15:17:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 894F4875DD;
	Thu, 17 Sep 2020 15:17:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ECE9C0888;
	Thu, 17 Sep 2020 15:17:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5271BC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3DD32875E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C23SllbvvzFk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:17:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5C81F875DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 15:17:26 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id i22so3836999eja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Sep 2020 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=so5t/bYxDwysfb6yWaIcnDP/Hlq1XY/E9k8ZGreLMQA=;
 b=Sgdwi73Ra4/KArwemaoXJ5R036j0lEgoUUYxYyAJbPkX7+8gjCkfqNcwzWMBwgaOjD
 Q7YFaejU4xrd6kdFUuO58biIa9dNwr2GoERLadzsiq6z6NWGhgNvFkUGwRU63GCA2cTl
 M7oEh4YHkY4IcrBP0z3Pc+QR2GBhECd/Uj08XySvlv5pe9kAJE9tRxwCmnmpl7PYMkJt
 o8N0kmq7aj5PeM+WxC31TpriHvJnigq3royyrbEte6mubd0GGtUbYGePzRf0V/GLCgs4
 LDFs9x3YbrmWMrE6mvjFK00TS+q5vUF1Y2PC1S5uI5mOvgCBFIb7AiId544MWvc+6gGV
 E4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=so5t/bYxDwysfb6yWaIcnDP/Hlq1XY/E9k8ZGreLMQA=;
 b=BrxAjPEnjaDgHeatV9vqbdimPTQq2H5EO2c+L6ay8zHqySboVw69vSlGdHCCRCykRz
 uoHrl9uHTG5QZ+WKYJ1kUl5gPuOJOXuJxuAligmmQB+7NOXFW99N8PALMMokDsf6W6s4
 946Vqglk5NSVT0lahMrWPv69r8lY707mRLrEjqBTfBo2828c3ZK1hx9JZ5VMawo7M3rj
 YwGyqIz3YdmvuLLCPFKGkdU2Cu8+Hop1GrjOCfB+Ua1Tpwk6jYzQ4EXZoD4am2QfYzAg
 5K7G/gVfo5g5eT2K+K60QiOL6lDyrJDko6Fjke10M5JPltbVqm2tnbXjIon8iSCn5/95
 U2jQ==
X-Gm-Message-State: AOAM532DA99KVePXBGHSb8/pySjmrrc4BaLWkDkuZ4W7u7kR9B7PM5n0
 j5YfhGNPTu8M9W9fkagXCN0=
X-Google-Smtp-Source: ABdhPJxW9NYTr+3vtRXNVvsYjOKpJDSk1b3SnP03pXgyZ/GODyG4H7le1BtvLQOSoqBQIGfDLn8PMg==
X-Received: by 2002:a17:906:9443:: with SMTP id
 z3mr32691800ejx.156.1600355844672; 
 Thu, 17 Sep 2020 08:17:24 -0700 (PDT)
Received: from felia ([2001:16b8:2da3:1100:b096:8628:b410:46b3])
 by smtp.gmail.com with ESMTPSA id p17sm107069ejw.125.2020.09.17.08.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 08:17:23 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 17 Sep 2020 17:17:22 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <93e1e3d520482c0621176a9d2e6777b5@disroot.org>
Message-ID: <alpine.DEB.2.21.2009171707240.9985@felia>
References: <alpine.DEB.2.21.2009140708240.7737@felia>
 <alpine.DEB.2.21.2009132005270.6806@felia>
 <alpine.DEB.2.21.2009131220070.22585@felia>
 <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
 <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
 <8178fe030ae071aec6397987e672e0fb@disroot.org>
 <93e1e3d520482c0621176a9d2e6777b5@disroot.org>
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



On Thu, 17 Sep 2020, Ayush wrote:

> Sir,
> 
> I am sorry for the late reply, my health condition was not good in last few days.
> 
> > What is the problem you encountered? What did you expect? What did you
> > observe? Which lines of code are involved? What git command is called?
> > 
> > Why do you expect a certain behaviour?were
>

Very short: you do not understand git. Okay, let us go into detail:
 
> When the git log is (trimmed portion of git log --no-merges --oneline):
> 
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
>

How did you generate this list? (Trimming a list is not a valid 
operation...)

If you run:

$ git log --no-merges --oneline d31275a9dc0b..a02254f8a676
a02254f8a676 dmaengine: ioat: Decreasing allocation chunk size 2M->512K
bd2bf302eef2 dmaengine: ioat: fixing chunk sizing macros dependency
2fea2906b5cb dmaengine: Fix misspelling of "Analog Devices"
b3cb14310eb4 dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema
cde9a96ee24f dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
fc6f5d0a4983 dmaengine: dw-edma: Decouple dw-edma-core.c from struct pci_dev
c2ce6bbcfc9f dmaengine: idxd: export hw version through sysfs
a4e688535a08 dmaengine: ti: k3-udma: Disable memcopy via MCU NAVSS on am654
022467444515 dmaengine: ti: k3-udma: Drop COMPILE_TEST for the drivers for now

that is the full list you get.

If you just copy a subset of git commits from a git log that is not its 
range. A git history is not linear, but only your console is. So something 
happens to make the history look linear, but do not judge a git history by 
its look, its beauty is in its inside.


> then to check commits in this range, I will run:
> 
> $ scripts/checkpatch.pl --show-types -g d31275a9dc0b..a02254f8a676
> 
> The output is
> https://gist.githubusercontent.com/eldraco19/b979e752baa2c6fdc1776c8b65dfa21e/raw/39ad42113141929d93
> 42d9a2962759b4b6b2e3b/checkpatch_issue.txt
> 
> here we can see:
> 1. Not all in-between commits are checked by checkpatch.pl
> 2. Some new commits (which are not in the given range) are also checked by checkpatch.pl
> 
> checkpatch internally used the following command for collecting the commit log:
> 
> $ git log --no-color --no-merges --pretty=format:'%H %s' $git_range
> 
> The result of this command is not what we expect checkpatch to test.
> 
> Please correct me if I am wrong.
>

Yes, you are wrong. Understand git and you will understand the mistake.

> Also I checked other evaluation too.
> (https://lore.kernel.org/linux-kernel-mentees/e6fa87d7-3b80-390f-4db2-40e977a4b635@gmail.com/T/#m17c
> 7f43426bd44b16c4b7f7e59559ed2c8b69a0)
> 
> I am looking into that bug and will try to fix it in v3.
>

Please do. Good luck :)

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
