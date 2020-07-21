Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7C4C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 17:45:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1248D2065D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 17:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5r6rqWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1248D2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E068588661;
	Tue, 21 Jul 2020 17:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRIqP5ACWvOF; Tue, 21 Jul 2020 17:45:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4401A884B5;
	Tue, 21 Jul 2020 17:45:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 267E3C088E;
	Tue, 21 Jul 2020 17:45:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 054CBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E5B17220DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln0RZtMvIDhb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 2E7D222091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:45:43 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x72so11082855pfc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kMWXOlhE34MA+0PIvAVKS1uhdD3FiDsb7PHPebuEoZY=;
 b=e5r6rqWhkz1D+xEyJQ+A/wRC9svCFYIA/poy4ke6itdgG7CpS0i+mv2bzRmmpcwrKn
 nt/o9IDu1lmc6TLvfdcgza3WVESfyQUimp6ZF/cND1ap8+9U7GNORYDzKz8aRCUatR17
 mg/Q7qLa9lBeRaFlWykxJztwMpt2vbuWfT71ct9zgWfAUaHgsw7ySyZ0Kgn6R4yhfLCv
 0GTg6QEjekW3YoD9W701yGgD9OQNwd+DRASQWzJKF1LODJ/KDMkplElD5z3SLm5ulEtg
 Ey4Z8PvxOHZyyOIXLm5iZi2zVIKj2pCfMIoKiq6lXRKL3goC1d8wD1S5oT6SL8UnyHiL
 O5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kMWXOlhE34MA+0PIvAVKS1uhdD3FiDsb7PHPebuEoZY=;
 b=uYSeDDZAFkE+Z7+lS2Gy0DErFRvrfZDVcUvK6oqF7LRYHnj2NXx3viGvDb8nXAyhvD
 z8kZOvEboX/qCl26+9XYkguPby4hhwBP8sb6qx+K1tXn/eLVmebHrbPsMoOaQ+WpGW8S
 r3w5J3XXtLI5CmywoDKD02JE4aW3PnTwDWtsJ7Oac0QdwLF9nQXW7ff2VrSgp8vDMOUK
 N4+UnWmweakwiRDaqq/q9K8MUqDlBjRcpHls0zDTpOg+SBBq8Qru9dGdVNWZKeL1TXBM
 zMaFVGM5idnMvr8QDZ77TfwkrvAHodImq7Uwsdbs3uS6uDjBtJTqXvHL6/3peu4eXhc/
 /GCA==
X-Gm-Message-State: AOAM532Zwfn49TS46fSCIHuscF2hlVZ4zUBxrzmu87BvwifKqdS9nHP4
 boFDK+k28VHmKBBrr8c11e4=
X-Google-Smtp-Source: ABdhPJwz2bMFIRQptPzYyQJia13UKDt6ya0pa9DA7+/aArwfYhQqDG6+ZoqEvGe/O/cJZRst6Gm8Fw==
X-Received: by 2002:a63:504a:: with SMTP id q10mr22964237pgl.377.1595353542619; 
 Tue, 21 Jul 2020 10:45:42 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id t188sm21859891pfc.198.2020.07.21.10.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:45:41 -0700 (PDT)
Date: Tue, 21 Jul 2020 23:13:53 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <20200721174353.GA398461@gmail.com>
References: <20200721123146.81710-1-vaibhavgupta40@gmail.com>
 <7100976b-cf7c-c304-e2a6-660876e310af@amd.com>
 <20200721163056.GA396078@gmail.com>
 <95db9ba2-ffbb-ca92-6a70-1ee401920eed@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95db9ba2-ffbb-ca92-6a70-1ee401920eed@amd.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, linux-crypto@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] crypto: ccp: sp-pci: use
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

On Tue, Jul 21, 2020 at 12:15:13PM -0500, Tom Lendacky wrote:
> On 7/21/20 11:30 AM, Vaibhav Gupta wrote:
> > On Tue, Jul 21, 2020 at 10:19:33AM -0500, Tom Lendacky wrote:
> >> On 7/21/20 7:31 AM, Vaibhav Gupta wrote:
> >>> +bool __maybe_unused ccp_queues_suspended(struct ccp_device *ccp)
> >>
> >> These aren't static functions, so is the __maybe_unused necessary?
> >>
> >> (Same comment on the other non-static functions changed below)
> >>
> >>>  {
> >>> +	.driver.pm = &sp_pci_pm_ops,
> >>>  };
> >>>  
> >>>  int sp_pci_init(void)
> >>> diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
> >>> index 831aac1393a2..9dba52fbee99 100644
> >>> --- a/drivers/crypto/ccp/sp-platform.c
> >>> +++ b/drivers/crypto/ccp/sp-platform.c
> >>
> >> This file use the same "#ifdef CONFIG_PM" to define the suspend and resume
> >> functions (see sp_platform_driver variable). Doesn't that need to be
> >> updated similar to sp-pci.c? Not sure how this compile tested successfully
> >> unless your kernel config didn't have CONFIG_PM defined?
> > I am not sure but my .config file has "CONFIG_PM=y"
> 
> Ok, my miss on that, you didn't update the sp_platform_suspend signature,
> so no issue there.
> 
> > 
> > The motive is update PM of sp-pci. Months ago, we decided to remove
> > "#ifdef CONFIG_PM" container and mark the callbacks as __maybe_unused.
> 
> Is this being done only for struct pci_driver structures then? Or will
> there be a follow on effort for struct platform_driver structures?
>
For now, I am updating all the PCI drivers supporting legacy callbacks for
power management. It is part of my Linux Kernel Mentorsship Program project.
I will talk to Bjorn about this for sure.
> I can see the need for the __maybe_unused on the sp_pci_suspend() and
> sp_pci_resume() functions since those are static functions that may cause
> warnings depending on whether CONFIG_PM_SLEEP is defined or not.
> 
> The ccp_dev_suspend() and ccp_dev_resume() functions, though, are external
> functions that I would think shouldn't require the __may_unused attribute
> because the compiler wouldn't know if they are invoked or not within that
> file (similar to how the sp_suspend() and sp_resume() weren't modified to
> include the __maybe_unused attribute).
Yes you are right. External functions should not require __maybe_unused. I got
confused by the kbuild error in one of my previous patches.
But those functions must have been static. I will have to dig out the mail to
check it.
> Can you try a compile test without
> changing those functions and without CONFIG_PM=y and see if you run into
> issues?
Sure, I will run this and check if it throws any warning/error.

Thanks a lot!
--Vaibhav Gupta
> 
> Thanks,
> Tom
> 
> > Hence, I did similar changes to all files on which sp-pci is dependent.
> > 
> > This caused change in function defintion and declaration of sp_suspend().
> > 
> > sp-pci is not depended upon sp-platform. sp-platform was modified only because
> > it also invoked sp_suspend() which got modified.
> > 
> > Thus, I didn't made any other changes to sp-platofrm.
> > 
> > Thanks
> > Vaibhav Gupta
> >>
> >> Thanks,
> >> Tom
> >>
> >>> @@ -207,7 +207,7 @@ static int sp_platform_suspend(struct platform_device *pdev,
> >>>  	struct device *dev = &pdev->dev;
> >>>  	struct sp_device *sp = dev_get_drvdata(dev);
> >>>  
> >>> -	return sp_suspend(sp, state);
> >>> +	return sp_suspend(sp);
> >>>  }
> >>>  
> >>>  static int sp_platform_resume(struct platform_device *pdev)
> >>>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
