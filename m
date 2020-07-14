Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AE8C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 08:25:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFB621835
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 08:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Darf2Q0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFB621835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA3A28A962;
	Tue, 14 Jul 2020 08:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d02cwC8oZ3F2; Tue, 14 Jul 2020 08:25:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B6EA8A17A;
	Tue, 14 Jul 2020 08:25:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59D55C0888;
	Tue, 14 Jul 2020 08:25:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5610BC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 441F58A960
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5idb2x1rnPWw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A2D8F8A17A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:25:52 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s189so2238366pgc.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZWUwJu20ntegLxeLLUqqY9GoM4PIf6WDr0U1QRPCyz8=;
 b=Darf2Q0a0jpRgttYMoFvMgwq+LwapC98MDClJbfjYU8niFJTsvIYg6qqG7+YyGSl4g
 BVANOvMGHizpFJIsXFlORc9YkqZfSREZPfQLDljPrd7WdN//n51wc8ZJ2z6bJZCuYdP4
 JfhNJ7sK5U/fsWuDuMkaknhLm0fmeiLZrOhJl5rer8nGCqprfezgCAsgCaP86lWGd/RD
 rz5h0+PEC7Fnob8KbAu/ELHee03RVnZHqTaarQbQcpTjzIm7dXudutq+AT812XR4rye2
 JWfMWoZkhXeBCrKavWJswfO1LkV6ma0ssNQxlxNEG8NPUQBYt5v9y459teksLszUzRjl
 yrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZWUwJu20ntegLxeLLUqqY9GoM4PIf6WDr0U1QRPCyz8=;
 b=t2mR33STpcXtVtQ5+UscFoHO79es2PG5WZx+PZNL7SzxVltOwxayqMSUO7zo0e3bIc
 g0lwLJ2+szwiATGP5H/erGELhtp1F4DnOjp+RgGPfXKG61xxUelALLz+jygkWet8q08g
 nDY5CyZkW7E6fBfO5zHL7J+VAu8Mo9VZykn575ayv16o2g0/ndaaJuOaeprsiOPIGBB8
 4rIrBw4y5rdLQPYp5pgLoWfS8wkpM/Ef+N9sY2CNPE2N1mNx/A2YcG//MY8IJ88ysAP1
 N7OgzQoCJ0yklH93LGr+i1tlOBIpBIhl5wXrIqxnHNVSVe0mR3UkVc0jByBDjIWonX8w
 +kmA==
X-Gm-Message-State: AOAM5321PZzE4wV7HZGuC1RN2PAkkaxmVplO24qFayJXygL/47y4XemH
 3kMgBPy8k8q0BXmUuciBZQg=
X-Google-Smtp-Source: ABdhPJygF5X1M5e9T6GC2BhRd2ugrdwtEBpQe4L+h8fYZn97BoUouscBcjxQDAIzI2+9+Tnii+xgvQ==
X-Received: by 2002:a63:9342:: with SMTP id w2mr2554954pgm.20.1594715152238;
 Tue, 14 Jul 2020 01:25:52 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id i21sm16683167pfa.18.2020.07.14.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 01:25:51 -0700 (PDT)
Date: Tue, 14 Jul 2020 13:54:26 +0530
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <20200714082426.GA5817@gmail.com>
References: <20200713173613.2095-1-vaibhavgupta40@gmail.com>
 <CGME20200714073256eucas1p13ebe9585c29b766e48506400ba91a8ed@eucas1p1.samsung.com>
 <3b26bfff-7a42-7bbe-2050-51fe1ce96d4e@samsung.com>
 <20200714075247.GA4859@gmail.com>
 <834eb293-bd4f-626c-4558-fbf71a5999f0@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <834eb293-bd4f-626c-4558-fbf71a5999f0@samsung.com>
Cc: linux-ide@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 0/3] drivers: ide: use generic
	power management
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

On Tue, Jul 14, 2020 at 10:19:06AM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> On 7/14/20 9:52 AM, Vaibhav Gupta wrote:
> > On Tue, Jul 14, 2020 at 09:32:56AM +0200, Bartlomiej Zolnierkiewicz wrote:
> >>
> >>
> >> IDE subsystem (drivers/ide/) is deprecated and has been superseded by libata
> >> subsystem (drivers/ata/).
> >>
> >> libata drivers have the same issue so please concentrate on fixing them
> >> first. Later (if desirable) changes can be back-ported to drivers/ide/.
> >>
> > Hello, (drivers/ide) and (drivers/ata) are the two major families, I am working
> > on, for generic PM upgradation. I was bit unaware about priority, and also in
> > the last, both ide and ata drivers have to be upgraded.
> 
> Well, drivers/ide/ is scheduled for removal in 2021
> (it even prints the warning during initialization of
> every host driver)..
Okay then, I will start with ata family.

Thanks,
Vaibhav Gupta
> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> >>> All patches are compile-tested only.
> >>
> >> This patchset needs (at least) some basic testing. It should be easier with
> >> libata subsystem as it also support SATA controllers and devices.
> > To upgrade PM in (drivers/ide) I have made .suspend() and .resume() static. Then
> > bind them in "struct dev_pm_ops" variable (ide_pci_pm_ops) and expose it using
> > EXPORT_SYMBOL_GPL(). This has affected 30 drivers. I was hoping if ide changes
> > can be tested/verified, specially [PATCH 1/3]. As then, I will be sure about
> > similar change in ata, as it also requires similar alteration.
> > 
> > Thanks
> > Vaibhav Gupta
> > 
> >>
> >> Best regards,
> >> --
> >> Bartlomiej Zolnierkiewicz
> >> Samsung R&D Institute Poland
> >> Samsung Electronics
> >>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
