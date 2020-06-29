Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819D5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:15:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C8723123
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToSqHyMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C8723123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F2E78859C;
	Mon, 29 Jun 2020 07:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STx8h+lrsyvT; Mon, 29 Jun 2020 07:15:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D16D88558;
	Mon, 29 Jun 2020 07:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 743BBC07FF;
	Mon, 29 Jun 2020 07:15:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DBCDC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 79CA087567
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svAF0Y1mKveU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:15:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E947887566
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:15:19 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id a12so16048784ion.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=adzyPkXTkp0sO71SdlU/u3i679+c3g+8gNM14op6Zh4=;
 b=ToSqHyMjXzY8sb/AduIlKKW2aCikkJnwsQnLXnOzOgUpsPkSmLq4YRImXGoTxRdOMb
 nJYIHujt1SoSirmLtO7VhNw1RwSkOCG4N+r3A5WQOSndtHbdHFjtJ6vfJuRLPl9sSEVV
 apqg2X1P+XkenHfT02bJGZgydkN000VqHIGuhOTeOaLU4aHSJzQnbUSfHKdJU6lx3jTu
 Ul17wnlM+sui0bqxR/iazioQTndlpoh88ptx8EVQJRz/PMBaq5uavlyne8EwM8dErhe0
 qt4D601OmS8z0+CrKMH+qxRfwM1z+TpbGak8y3WjIPrW2KgjFyA5uXHXfrprA9H4ZQHF
 94TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=adzyPkXTkp0sO71SdlU/u3i679+c3g+8gNM14op6Zh4=;
 b=EbZU2hjmotUmFlBVtOzIdMS05kjrtOzYuz5x2H7wacwSEybWq2gjhhyc+kss5jureh
 FCkTAAmjvBc9Jt+x52cxFcqRUb2GNzIEObxOO+9GLkv8vpiosbMxRLIiAlC36tjZpgya
 Irkv8p9r1faTWnLAW6LDuQYiLouMlHT1xJAcKW4/HfHkYTaNf0S/x+xTuOJAGyCzuuxL
 SrgrW2HN/IttEM/W6UM2XB+LZPZeZ6DCa7B8OGXHbksRV2+QETlVTD4EOh5yanmrWozj
 yFURAkbSwFN5Tl4ePAQh7rr5tM++J9367FmopLMf/05ozHWawayqBWLyfJq0xFm/Mfr+
 o0CQ==
X-Gm-Message-State: AOAM533SfVQclLoalrv8Bt3wGv+PBoMtit3fL2+4RD/X7ZH8wT3wfztL
 M0wCnhtCLhuYOC5o3kF0+ZW+3ELB+3YnfYOysMY=
X-Google-Smtp-Source: ABdhPJwhWFrCSpeie7O8ZZc6ylWvzGqcD+nXDxE+VaCR9WC377uXctoAAbiNoe4UHdQG0mW0kIrxFXHMeyLKGcLDF/Q=
X-Received: by 2002:a6b:bc07:: with SMTP id m7mr15180805iof.107.1593414919316; 
 Mon, 29 Jun 2020 00:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200629033226.160936-1-vaibhavgupta40@gmail.com>
 <87y2o6xvx5.fsf@codeaurora.org>
In-Reply-To: <87y2o6xvx5.fsf@codeaurora.org>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 29 Jun 2020 12:43:43 +0530
Message-ID: <CAPBsFfBW7B9+ef+RwBd6SsHokWc9DxCGz6hMczpO7Y6y=q1EyQ@mail.gmail.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/2] ipw2x00: use generic
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

On Mon, 29 Jun 2020 at 11:20, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Vaibhav Gupta <vaibhavgupta40@gmail.com> writes:
>
> > Linux Kernel Mentee: Remove Legacy Power Management.
> >
> > The purpose of this patch series is to remove legacy power management callbacks
> > from amd ethernet drivers.
> >
> > The callbacks performing suspend() and resume() operations are still calling
> > pci_save_state(), pci_set_power_state(), etc. and handling the power management
> > themselves, which is not recommended.
> >
> > The conversion requires the removal of the those function calls and change the
> > callback definition accordingly and make use of dev_pm_ops structure.
> >
> > All patches are compile-tested only.
> >
> > Vaibhav Gupta (2):
> >   ipw2100: use generic power management
> >   ipw2200: use generic power management
> >
> >  drivers/net/wireless/intel/ipw2x00/ipw2100.c | 31 +++++---------------
> >  drivers/net/wireless/intel/ipw2x00/ipw2200.c | 30 +++++--------------
> >  2 files changed, 14 insertions(+), 47 deletions(-)
>
> For wireless patches you should CC linux-wireless, otherwise they will
> not be in radar.
Oh yes, sorry! My mistake, I missed CCing them. Sending it again!
> See more from link below.
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
