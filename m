Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B84FC433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 05:19:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5BF621883
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 05:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDHCpeeK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5BF621883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF3DE882F3;
	Tue, 28 Jul 2020 05:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwEji+HczIQU; Tue, 28 Jul 2020 05:19:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 505A4882DB;
	Tue, 28 Jul 2020 05:19:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3779DC0050;
	Tue, 28 Jul 2020 05:19:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20D81C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 097778688C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShYL7pnSKdPg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:19:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8D96A8688A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:19:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l63so11207853pge.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9ghlAYTyzFZwTZgv3PuWK0Pqom48ugz1LIIW6nutfN0=;
 b=DDHCpeeKFIvand3ijvOlzW1o6Bwf1v/pnGmPNiE8ejUG8vuxqOAjjI3HXEl1LC0pyA
 fJIGCAGcWTYXIYUY47OXImPiMsDDxwKZwyBRoFVgPeAJ32R+warIxyiqEuVq19OHR9Io
 JOjC4bc2vEXTt4PuabQcyHuGfVvYNdLntd6Lc5l20glat+NFQv9KPA1bvUjq++IAtxjn
 kF3ghZqaThYfqEC7CCgKVCf0v66n+IJfYPazs96AzrMCgeEhzcmPF0TuUdas5GLJCZQt
 vfjPSNYp1XOx99K9yIhkiOu7Cy9MjjaMQfOIEsAASErLtZB6Uo8fD7C6KzJlig/8+pr+
 jeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ghlAYTyzFZwTZgv3PuWK0Pqom48ugz1LIIW6nutfN0=;
 b=VR6sR5DnYJrJKkmUAuK+uNI6+WvcsiHHDd/wlnt7JRRBMsXuUmxOdReKvPtzbHVnl4
 CAbgmUItiP4KyEPwKl3kE/BJK1emuMQMP4rupei+z0aTooHENqNYE8DPGTRfsMOPk6mU
 Z5g3A+3rMoouqxRe6jLZuS9Tm4zbMZNeAr0yrj9U1oDc/LYOD6YDtKnI+yuyjUMdvBDZ
 shUBJmOkhHrGlzocSotpOr6KFYP54XMZdXY7WIeie/JokI34dDIiK/vUKn3IkkBvhu7c
 JCEpflpSP1BJ/iL/VOfdeszrd/ZvU60phFqlSNo8QwC5WZBSaRJQnz9YzteRGpxChT+Y
 COvQ==
X-Gm-Message-State: AOAM533e6IoX6T2/av9a1I0M0E02APc85101c6UxVYMWBIC0i1A6461C
 OkSJmNddBDb8Qt2Rx/2/MnY=
X-Google-Smtp-Source: ABdhPJxj98U/h9D2NiyHWET1poZTnBjn/xdQ09g3tOwYLU9+dhSYrjB2Yyl6WXPjpEujKJSAZiFOiQ==
X-Received: by 2002:a63:6e4c:: with SMTP id j73mr22409995pgc.182.1595913548066; 
 Mon, 27 Jul 2020 22:19:08 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f6sm4299245pfa.23.2020.07.27.22.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 22:19:07 -0700 (PDT)
Date: Tue, 28 Jul 2020 10:47:42 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200728051742.GA198538@gmail.com>
References: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
 <20200727174012.GA696265@gmail.com>
 <2b4738b0-5c2c-8ee2-83f9-10b961a5d0d3@kernel.dk>
 <20200727175119.GA700880@gmail.com>
 <99b7cc57-1b4f-6c0b-00c6-08e22021c373@kernel.dk>
 <20200727181144.GA543@gmail.com>
 <9718954b-2152-1bc2-e702-ebe8799fdfb3@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9718954b-2152-1bc2-e702-ebe8799fdfb3@kernel.dk>
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] ata: use generic power
	management
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

On Mon, Jul 27, 2020 at 02:30:03PM -0600, Jens Axboe wrote:
> On 7/27/20 12:11 PM, Vaibhav Gupta wrote:
> > On Mon, Jul 27, 2020 at 11:59:05AM -0600, Jens Axboe wrote:
> >> On 7/27/20 11:51 AM, Vaibhav Gupta wrote:
> >>> On Mon, Jul 27, 2020 at 11:42:51AM -0600, Jens Axboe wrote:
> >>>> On 7/27/20 11:40 AM, Vaibhav Gupta wrote:
> > Yes, I agree. Actually with previous drivers, I was able to get help
> > from maintainers and/or supporters for the hardware testing. Is that
> > possible for this patch?
> 
> It might be, you'll have to ask people to help you, very rarely do people
> just test patches unsolicited unless they have some sort of interest in the
> feature.
> 
> This is all part of what it takes to get code upstream. Writing the code
> is just a small part of it, the bigger part is usually getting it tested
> and providing some assurance that you are willing to fix issues when/if
> they come up.
> 
> You might want to consider splitting up the patchset a bit - you could
> have one patch for the generic bits, then one for each chipset. That
> would allow you to at least get some of the work upstream, once tested.
>
I think I can break this patch into one commit per driver. The reason that
all updates got into one single patch is that I made
ata_pci_device_suspend/resume() static and exported just the
ata_pci_device_pm_ops variable. Thus, all the driver using .suspend/.resume()
had to be updated in a single patch.

First I will make changes in drivers/ata/libata-core.c, but won't make any
function static. Thus, each driver can be updated in independent commits
without breaking anything. And then in the last commit, I can hide the
unnecessary .suspend()/.resume() callbacks. This will create patch-series of 55
or 56 patches.

Will this approach work?

Thanks
Vaibhav Gupta
> -- 
> Jens Axboe
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
