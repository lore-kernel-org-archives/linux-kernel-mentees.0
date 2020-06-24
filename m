Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755F6C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 16:32:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA2720823
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 16:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTHZP8c7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA2720823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC5D385A7D;
	Wed, 24 Jun 2020 16:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDpmXDhOTx2a; Wed, 24 Jun 2020 16:32:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6800185A72;
	Wed, 24 Jun 2020 16:32:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EB9CC0888;
	Wed, 24 Jun 2020 16:32:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67B9EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5D19085A72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38X0gnM3SrLB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:32:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3424B859E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:32:41 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id w9so2599588ilk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 09:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUIZQhqDp4lzMh1CnS2pEovhw0eG8uBYHqVBDBe2+2A=;
 b=BTHZP8c7EWgHrJF0/6w1zOJdvOS+S0FTXntU472Hy58QRKcqMUTCvjAtw1dT0WOWVn
 vVd53nd8ZLAPUC2e7wWcprGNNlzzxswaEfNR5ZVYFjN4i73A8HWgpeUJ/kBOfyMF5azF
 EvoO8Ig9sR2ugXlan5QPb11NFgivc/vgaNISZ5j8mrH6x5zEs4VEpisgER5cCv19WoJY
 yrqVbVdW/0wZQrqjYQEIa/J6lhfvq0er9dIOHFnJms/RuNXO4eM6VB5A31IJuxLZ5BFc
 gf1sQSBkkDaXm8myp9Tm9rrelCkHEvqoyevE8z04DHMYO3V1aZeBZFZ46lklqWJDHWXR
 Ni5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUIZQhqDp4lzMh1CnS2pEovhw0eG8uBYHqVBDBe2+2A=;
 b=NYCsrW3fTwsRlJO8xpN+O4ztV9SAu27VMBXNDdWtfETPsklNxkuGRC7Xa3x69sDvaZ
 rY1SFKu50DNCSHji5gJOvR+JCjZPVYaeQyNVyaFnCs0bCoTz69T++/6KNU11t3dhy/YI
 t5VZji5bQ9N9lnUlUltYZUAlScmRvtfIIfUBo5JXkDqyWIeq5AkOYP37lyPMKRre5H2c
 fPxv4opTxDcp2YPCo4CqxEzCzp3TQ3qXr1pwb8fSoUURJIrE9f5xllFLi5fbLfX0d3lN
 DQJ9zMJR5oRMAh4xp9Qx8PQpBqwqiijrcj0YCZxXDoYVlRmhIZdqf+swAmlBVA3/+BzB
 66BQ==
X-Gm-Message-State: AOAM530ZrCqwjM9YtdTAjBGqwiJcsxgKlwUtYFBAy1DuE8y0Zk0bsK7x
 wk15cjBen0Ts84F0/uGe9/ak09IBl89e9WuAYA0=
X-Google-Smtp-Source: ABdhPJwEwuCaeT0KQT8T6bGY+TLDIqijMwDykgVQEODBnMvMPlvN+4M2jDSUIKwguCt1ADHbR3aP4faN01hP5+mg4XE=
X-Received: by 2002:a05:6e02:48e:: with SMTP id
 b14mr9395963ils.143.1593016360414; 
 Wed, 24 Jun 2020 09:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200518150214.100491-1-vaibhavgupta40@gmail.com>
 <20200519.153239.1577517664546707472.davem@davemloft.net>
In-Reply-To: <20200519.153239.1577517664546707472.davem@davemloft.net>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 24 Jun 2020 22:01:06 +0530
Message-ID: <CAPBsFfBhWAYCuxWxP=DnD1Ja5cQ44i5guRC+49gAHsTxJV25qw@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net-next v3 0/2] realtek ethernet
	: use generic power management.
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

On Wed, 20 May 2020 at 04:02, David Miller <davem@davemloft.net> wrote:
>
> From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Date: Mon, 18 May 2020 20:32:12 +0530
>
> > The purpose of this patch series is to remove legacy power management callbacks
> > from realtek ethernet drivers.
> >
> > The callbacks performing suspend() and resume() operations are still calling
> > pci_save_state(), pci_set_power_state(), etc. and handling the powermanagement
> > themselves, which is not recommended.
> >
> > The conversion requires the removal of the those function calls and change the
> > callback definition accordingly.
> >
> > All Changes are compile-tested only.
>
> Series applied
Thanks !
-- Vaibhav Gupta
> , thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
