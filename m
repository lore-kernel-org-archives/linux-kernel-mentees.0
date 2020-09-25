Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548E3C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 11:24:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D99DE20936
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 11:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwusCQb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D99DE20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 84E3720379;
	Fri, 25 Sep 2020 11:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjUF+TmAH0a1; Fri, 25 Sep 2020 11:24:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C7DFF20387;
	Fri, 25 Sep 2020 11:24:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B03CFC0859;
	Fri, 25 Sep 2020 11:24:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69EEEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 11:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5896586C73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 11:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiHnfGc1iW7M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 11:24:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0022586B5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 11:24:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j2so3181225wrx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFWcfeS5wxuI7eAUUDEBe0a+as5YNy5FGHPEInpElA8=;
 b=YwusCQb4BNAs2qNa8S3uQAN1XOHgiKuS/bWyodzx+julOIpF8cMM+ULqoTh70csgmu
 Tg7LuB4jVQLF7thah9OEj3nFW152KXkekpYFu35kCOSdxD+ycnC44LKNN3PIqZLfOl12
 aW3JvhopCsNsu/CIHKE65qLtfjGq90wIacSzLzBjKAV0wAJC9AhL8sWSXQNlOJPH7J9j
 lfRJJFWnMLq13GfmwodEF09YeJRX0pOsxDuzkN5zxlbQ1ebIFdWAhShHm6aJt+HZyykP
 nJju+fVztQNgTUUzR07a17dNJyr8qTR0WIYQYGRBiNjxDWq7CL02l6imoZj4NOGBeysf
 Wmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFWcfeS5wxuI7eAUUDEBe0a+as5YNy5FGHPEInpElA8=;
 b=aN33Li8V1+J0nMLIrwYW4MwlXD9qjzrK7GN9sSlpvKPeXHy5f/iqcDqXZi67xlfaZj
 iBVim15W7TvgVKZDd43Vpqn/YDRdO+6fANlIGJu07/MckSiVAfZH8WBZ/4FIjz6zGP8K
 XW9sVIQzlUTEUOtqpxTAYN1CWSiRraYgh7lnaC4EEopYb0xm7dx8ImPh3uSub++E9m0Z
 I934A3XDJtGedqI7XTnRrRdBGjfu287t+DmwifZdihpqUsTmOUBau3XLx9FX2kLpTsYX
 E9MN8zVtFJ4ZLVAFQNwZzppZWYvlCZk8NktnR81bJW78J4JFKiYOjxINrnu9wx3l27sn
 CI9g==
X-Gm-Message-State: AOAM533ZwgqOUFSekcDRGzOG8pL1nwsgqiX8sh5oVw/PflCtwCKpgq/W
 mBI/4nLUnYMa12yOhtXmCHc8M21i6tgjytmT4AE=
X-Google-Smtp-Source: ABdhPJzm9ewJSK7s1bAh20TjRk7fbdnLc3xpXegODgfo/yRdDK42Rrpg+9Cj7gBDCvmWeHhsbWumnOO3fGV9uaN0Ffk=
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr4036971wrm.203.1601033040375; 
 Fri, 25 Sep 2020 04:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com>
 <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
 <1600870858.25088.1.camel@suse.com>
 <CAOY-YVkciMUgtS7USbBh_Uy_=fVWwMMDeHv=Ub_H3GaY0FKZyQ@mail.gmail.com>
 <7f9e20b2eab783303c4e5f5c3244366fa88a6567.camel@suse.com>
In-Reply-To: <7f9e20b2eab783303c4e5f5c3244366fa88a6567.camel@suse.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Fri, 25 Sep 2020 16:53:48 +0530
Message-ID: <CAOY-YVmBW52bXF95pTM3fNVUyRt=PNXZ5iGyq6mYsW2_iopnoQ@mail.gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: petkan@nucleusys.com, pankaj.laxminarayan.bharadiya@intel.com,
 USB list <linux-usb@vger.kernel.org>, yuehaibing@huawei.com,
 LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
	usb_control_msg_recv() and usb_control_msg_send()
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

On Thu, Sep 24, 2020 at 5:06 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 23.09.2020, 20:02 +0530 schrieb Himadri Pandya:
>
> > I meant that it was stupid to change it without properly understanding
> > the significance of GFP_NOIO in this context.
> >
> > So now, do we re-write the wrapper functions with flag passed as a parameter?
>
> Hi,
>
> I hope I set you in CC for a patch set doing exactly that.
>

Yes.

> Do not let me or other maintainers discourage you from writing patches.
> Look at it this way. Had you not written this patch, I would not have
> looked into the matter. Patches are supposed to be reviewed.
> If you want additional information, just ask. We do not want
> people discouraged from writing substantial patches.
>

Understood :).

I'll send v2 after the update in API is merged.

Thanks,
Himadri

>         Regards
>                 Oliver
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
