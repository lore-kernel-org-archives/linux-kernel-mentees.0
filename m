Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B563C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 08:08:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390F42086A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 08:08:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="YTspYUzC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390F42086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EAACD26E75;
	Thu, 23 Jul 2020 08:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQs3iN8jgojR; Thu, 23 Jul 2020 08:08:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1C26D20242;
	Thu, 23 Jul 2020 08:08:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0312C004E;
	Thu, 23 Jul 2020 08:08:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AEABC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 08:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68FDF86FD8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 08:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21QJjsSdWzoS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 08:08:19 +0000 (UTC)
X-Greylist: delayed 01:05:30 by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 51BC786FD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 08:08:19 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id s9so5343237ljm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SfS8nf99hq7DuEx/kHoPEqmrbwoIsST4mSyABQnVZSQ=;
 b=YTspYUzCTPwfyoE5AgUNWSWm/7lHjJgCkRwdVPwjww4zm9w3luUg460JDLNEVmx1x4
 S8BzLS4eHF/AiT2KSekme/fJuTc299z1dMIieW3HNDHKNesyG4kuklzMgMc0mXC9i6Ri
 7exLlox951kHvcQ1jcaafBTZtD4ViRjp7LpkEijd+1SORDeMiJJ26Rk7dQpZb1Kmh/II
 N7eNo+2K9D/uEjEVKD2sm7L6rJhX3kWVqJHrWdN5ne+KS0ej7Wrr+44ARtQjBBj/xVEP
 vP0yRnG9nSBKsMs0yYa2LAP6r9iDmyaropf9IRUsYvOxdKphMs7SIGx3OUQIAYcAZyQC
 +ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SfS8nf99hq7DuEx/kHoPEqmrbwoIsST4mSyABQnVZSQ=;
 b=DY0BNBs+KrSIkjJ/Yoknqc6fmz6+yqy20O0IwOQfN2MpJjs2PRkeXJdmZ7dKcEIkcU
 LomDCT+IXXhk7k1fZqJes0K7TILXD0VtSeh3xhUFAOl9Fh8o5S4YHpyrIg8+lwPp3VAF
 Tjxp09gXITH/tpZIpTuoJKJXNJKJr/8HogvTU3xd6ji9yoYkutp2SZ0UhzlO6EbDnzd9
 fviP0yD2mnMIrbudI1/P/Y0Z90rZISsgPZgZJF4MzY5HoSxg8D69X0GuHhyqVkv8J+2h
 ilaqa4zupgLL2XZ/bzV2ZuaDm2nWimb1DLQwliw4iaznE0RACOiMWpglPGZczePHBIWB
 +RnA==
X-Gm-Message-State: AOAM530y44lL9yZpW1zwpSVA7WA7G7Cx7zaLH54AurAjbYFgCDi0FpWA
 pgq/raepWNb/kCmQJvo5bXygehmhgynPShOIphqYPZKUnM1CjnMc
X-Google-Smtp-Source: ABdhPJxTduRJ5al4/frVVD9fDofIlJ7ztuk37FWYsBSe0cNzQyQ+mBrOBScQo6owEDNSjYITuNkfVSMC62ellntxR68=
X-Received: by 2002:a05:6402:559:: with SMTP id
 i25mr2816567edx.35.1595487767298; 
 Thu, 23 Jul 2020 00:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-11-vaibhavgupta40@gmail.com>
In-Reply-To: <20200720133427.454400-11-vaibhavgupta40@gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Thu, 23 Jul 2020 09:02:36 +0200
Message-ID: <CAMGffE=K4Tx6oduwS1=_1pgOCpXPnrOF9XZghOvR2taTwnhn3A@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Don Brace <don.brace@microsemi.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>, esc.storagedev@microsemi.com,
 James Smart <james.smart@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Adam Radford <aradford@gmail.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 megaraidlinux.pdl@broadcom.com, Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 MPT-FusionLinux.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sumit Saxena <sumit.saxena@broadcom.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 10/15] scsi: pm_8001: use
	generic power management
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

On Mon, Jul 20, 2020 at 3:38 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> With legacy PM, drivers themselves were responsible for managing the
> device's power states and takes care of register states.
>
> After upgrading to the generic structure, PCI core will take care of
> required tasks and drivers should do only device-specific operations.
>
> The driver was calling pci_save/restore_state(), pci_choose_state(),
> pci_enable/disable_device() and pci_set_power_state() which is no more
> needed.
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
nit: subject should be pm8001
Thanks!
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
