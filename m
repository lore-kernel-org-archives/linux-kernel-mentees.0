Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB126C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 07:06:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A1821702
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 07:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1nHLbny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91A1821702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4565D245E3;
	Tue, 21 Jul 2020 07:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOESVTMsFhwN; Tue, 21 Jul 2020 07:06:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C560D2582D;
	Tue, 21 Jul 2020 07:06:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A876BC089F;
	Tue, 21 Jul 2020 07:06:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00826C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E97FF2582B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QUwFzZDBPZS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:06:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 3CD01245E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:06:07 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id md7so1201391pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 00:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hQAVZqdCDGXaSgKJO4tHAULnO6o8IgHcxHvcFrASXJM=;
 b=o1nHLbnyC76cTBkZ8o02WGza5nv95DmFPmE6Kv/2qtedmnUgrkutnnB7W5dDKaHXn7
 gsbzIzAVg2SXSaHepfx67ZVvQCbn75pEENAb5buco7ZGoXgEH5L+uaTMq8p9PIntP5/9
 Pg6P/Hiz4k3Qe/JUKHeOwPly1AeyA2gPYhUbcMPcW5NNyVVLVCDhq3oomjJkRrujZLKp
 mh2Gj1QxVxhYq9UCMU6FxXhwixv6ANQQ9a+Gqio4OhFPKQesVf1ybjnN32OPj2409y29
 J4TVfgKPj+wYb6uGzT0lf5Mzm8JBN2G0rMVLHhWBAy+UMJem0dyM2AFBb7Hw6qIgVeQF
 FT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQAVZqdCDGXaSgKJO4tHAULnO6o8IgHcxHvcFrASXJM=;
 b=DV28fniZm2ubnIs8rOYS6grOB2CgDi2IGz3Nc0isvJA0qf42qfvWH/+tf4+tRYulu+
 cNed710suQodOPfaDuJolw+rLlKEqYL/SZ3DLnAI0N4Ys9Tf+j51xeO/aygkNUYCbKNa
 gvtD4Lwgc1VhKSYgSHgpgA5goRbcNYqCzwFbQmvc2pjHlfhE15590wbijCe9cKdB7d3x
 rf56JxmwDlZpmKg0oHFJsoEfWjs0hT9CRvN0Qo1XAtRITgSrnIrt156+ZrXwlysauX8J
 pFLJfYVcdW7Qye7nyvA/cU/r8K385usOBmrLtwRkzqQRP/+Zskg2jXJiwnwMyYsF5YP/
 aKsA==
X-Gm-Message-State: AOAM533d+6iTgeJqvM3NY4Q0fHPBxTLfu6LQV+FPzfsYV5eHakPlt+Oa
 CbgqqNtBaRMTsR7X+kZ7wcQ=
X-Google-Smtp-Source: ABdhPJzf3truDWDxS9RbTZomnBgsQrj7q4dk+RFuooF81G1rrHqrSeIGTHAI2483Gk4mGi0I+frPZA==
X-Received: by 2002:a17:90b:3683:: with SMTP id
 mj3mr3303694pjb.91.1595315166748; 
 Tue, 21 Jul 2020 00:06:06 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id h2sm16144431pfk.93.2020.07.21.00.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:06:05 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:34:40 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200721070440.GA51743@gmail.com>
References: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
 <20200717080910.342741-4-vaibhavgupta40@gmail.com>
 <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200720131627.GA447599@gmail.com>
 <CY4PR04MB3751EB3DA357A6856B3337D0E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR04MB3751EB3DA357A6856B3337D0E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 3/3] skd: use generic power
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

On Tue, Jul 21, 2020 at 02:49:06AM +0000, Damien Le Moal wrote:
> On 2020/07/20 22:18, Vaibhav Gupta wrote:
> > On Mon, Jul 20, 2020 at 12:52:14PM +0000, Damien Le Moal wrote:
> >> On 2020/07/17 17:10, Vaibhav Gupta wrote:
> >>> Change function parameter in both .suspend() and .resume() to
> >>> "struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.
> >>>
> >>> Compile-tested only.
> >>
> >> I do not think this belongs into the commit message. This was mentioned in the
> >> cover letter.
> >>
> > The messages in cover letter and commit message are bit similar. But the commit
> > message has patch specific changes mentioned in it.
> 
> My point was about the "compile-tested only" mention in the commit message. That
> should be mentioned in the cover letter only. The goal of the patch review
> process is also to get these patches tested by others if you do not have access
> to the hardware. That is fine, and I can test for the skd driver. But a patch
> mentioning that it is untested cannot be applied, for obvious reasons :)
> 
> So I only requested that you remove the "compiled tested only" note. The commit
> message could be simpler too, see followup comment.
>
Oh okay. Thanks for clarification and pointing this out :) . From now on, I
will put "Compile-tested only." message only in cover letters.

Thanks.
--Vaibhav Gupta
> 
> 
> -- 
> Damien Le Moal
> Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
