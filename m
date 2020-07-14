Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13C6C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:54:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76662220F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE9u4VML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76662220F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 768178A110;
	Tue, 14 Jul 2020 10:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0jvUU4x5hpq; Tue, 14 Jul 2020 10:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0092A8A107;
	Tue, 14 Jul 2020 10:54:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0AF3C0888;
	Tue, 14 Jul 2020 10:54:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC88C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 533842633A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMNuayTLA-vR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:54:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 979B722098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:54:25 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b9so6872054plx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KLbw3IbcrAXc8QouI0Bu7vFi8chhw+Ci6U+9y5k9Blc=;
 b=lE9u4VMLUxfwNTkRBiprv6dokWrJVjtKXiRnrU6P9O+8tygFUhLocZMypfx2Mlhy/j
 9G7cWav9fC5RST46LWUTZFny/hGE4UtULyRSyT+F7AEja24kGYLnRkDH5kAPu/7QwXW2
 NxKNZSR1mwxZvXUYMQdT2aQQFbzJSwqoItizQWcg9Dqz/On1W7H4uXtrXK5Jn04lapnM
 rVsSWXX9/ecM8EKNAClLo/JWxWak4bFjTnOXbrWemEQv5rrT51b0BIBqiMzhjX33NmeT
 DP0w5zQErt6EJDcATI4cavAG75gRX+5EtrxuVf9CpBeK5EHoqPijRyMR4W1QKkx9pgeh
 2zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KLbw3IbcrAXc8QouI0Bu7vFi8chhw+Ci6U+9y5k9Blc=;
 b=LHgn+X485JW5YlYMENyqIYA54RjlRoGGA9JztZrts5Fr2gI5lySK71FTIVanDf60PL
 EFtyZ3TrnRbl9GaH/qIEarXZP3quxr73OdVXioQ2N2WPyM9dD3t14tpocOYkM778foyA
 M/OZ9RotWHAF2GmjnWfXSfzUnR25DSbqkOewgnGhQMURH2QYT6mXcQ3y8o3tG+u+h4Ar
 lXPetdE5F4/AFMggN0GT4kTFEEHsHaIi5VMkjHD8coNovU/nIMKVfAeyZXiSssFKll8r
 TFQ/bO1UPbEkPzscDHPDtmnZ5m21SO5QJelmpoTEV8uBLpOc5gjwA2UCcTsMk3ey+YbH
 83Wg==
X-Gm-Message-State: AOAM530CFQapKiXtxP2Ho1vINfKYATHUvLdjJ36Igftb15EiUtTtyW98
 smBFI4HidO5tashvv/HZY0g=
X-Google-Smtp-Source: ABdhPJzhPpBbGGdNyT0x4RlIw4eIAqM0zMbmAew4wvCnGbD4Fe9H5R+7gdYAv5/8yH6Mm/485GOVcw==
X-Received: by 2002:a17:902:b706:: with SMTP id
 d6mr3405237pls.244.1594724065125; 
 Tue, 14 Jul 2020 03:54:25 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id oc6sm2313921pjb.43.2020.07.14.03.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:54:24 -0700 (PDT)
Date: Tue, 14 Jul 2020 16:22:59 +0530
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200714105259.GA1792@gmail.com>
References: <c4a46846-208f-c834-56d7-02543c395795@xs4all.nl>
 <20200714003814.GA292013@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714003814.GA292013@bjorn-Precision-5520>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/6] [media] cx23885: use
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

On Mon, Jul 13, 2020 at 07:38:14PM -0500, Bjorn Helgaas wrote:
> On Mon, Jul 13, 2020 at 12:01:51PM +0200, Hans Verkuil wrote:
> > On 29/06/2020 09:36, Vaibhav Gupta wrote:
> > 
> > I don't entirely understand this. Wouldn't it be sufficient to just
> > drop the .suspend/.resume assignments here? It is now required for
> > driver.pm to be non-NULL?
> > 
> > I'm not up to speed on the changes, but normally you can leave things
> > NULL if you don't support a feature (PM in this case).
> 
> I think this patch will break things.  Previously, we had:
> 
>   cx23885_pci_driver.suspend == NULL
>   cx23885_pci_driver.resume == NULL
>   cx23885_pci_driver.driver.pm == NULL
> 
> pci_pm_suspend() looks like:
> 
>   if (pci_has_legacy_pm_support(pci_dev))
>     return pci_legacy_suspend(dev, PMSG_SUSPEND);
> 
>   if (!pm) {
>     pci_pm_default_suspend(pci_dev);
>     return 0;
>   }
> 
> pci_has_legacy_pm_support() was false since drv->suspend and
> drv->resume are both NULL, so we'd take the pci_pm_default_suspend()
> path.  After this patch, driver.pm would no longer be NULL, so we'd
> take a different path that is clearly not equivalent.
> 
> I think you should do this:
> 
>   - 	/* TODO */
>   -	.suspend  = NULL,
>   -	.resume   = NULL,
> 
> and leave .driver.pm NULL by not mentioning it at all.  That should be
> identical at the object code level since those are the defaults
> anyway.
> 
> That almost looks like useless churn, but the point of this patch is
> to remove use of PCI legacy PM (pci_driver.suspend and .resume) so we
> can completely remove that infrastructure from the PCI core, including
> the .suspend and .resume members of struct pci_driver, so we really do
> need to do it.
Okay!

Thanks!
-- Vaibhav Gupta
> 
> Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
