Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4DFC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 19:14:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A49206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 19:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYxAWmcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84A49206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DE0D121FA9;
	Mon, 12 Oct 2020 19:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrs1vLl40iD0; Mon, 12 Oct 2020 19:14:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A8392011A;
	Mon, 12 Oct 2020 19:14:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDFB2C07FF;
	Mon, 12 Oct 2020 19:14:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A435C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DA11D20384
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlRMecvJCAIK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:13:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 1FCC12011A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:13:59 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id m22so5406048ots.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i2j6Si15bQOwVE/lJKd6+asIR5qXBaC5cNrHj4YNxbM=;
 b=DYxAWmcRmxUCWcnDajOO1Erd9TjoR8JgW6HfidG3sss1SX73WBtegctIEdxjJeB0sF
 Z9Bwfmj6Mvt+EJfGCDOPgmhE4PEgZrA+uTNQu78JLqNhX9PaghcFEkkdYWZBieIp1spc
 9owNXhJEoPZjo8Dcun4C6LtgJEVt9THzCGWrm7N+2F0vVYKPAwLlE71RnFJvuMK+mbmg
 PIlFhEzSywSPDVzshf9EPP1cGJkhlKJ77EX5/lGPJI/1ruqVAv0lSV7U72HghhrhwnlL
 hsBWGxRnEwiz9Fkq6mAfka6m80Gf3I3CbO7GCcg4eEX2hK/RcjfdGz8CAhetZ69d/Gjj
 3+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2j6Si15bQOwVE/lJKd6+asIR5qXBaC5cNrHj4YNxbM=;
 b=BdMbpBgnEh/pULSbB6rXqiZalmc3PdN42gc2axik/NRx3QSqX+iVnt9u6wOZ30jkzI
 MFlAyEGc4myrFsWusN31BXQhuXWWiNEOTnuoX/yZM1GfSc6A2v1/LZQewklZ5QORhWso
 cfU0WoXnnjnPVpCY+JS/F2voa8PryeKZSreFfEELNxrymHpnqFvu/GL1+hcoUiAvvWX3
 jSYaqBKbnYZ1xHd/9hFNEc9jjVYfRSKBkqux3LHsYf1IZJjVbI9/uCBoFCGL2aTTngw8
 vJ3WLVtwvEX7eWeOPAVXIYLzSKAkiH9i54rcu0HlvFcUih2cRNOdGL9BRxyJTziD9IIF
 xLFA==
X-Gm-Message-State: AOAM530l07ZgE/xJQwW2FlRvCMAlS3SuSE1CXsvqkt8gEcwLfjJCszX7
 2tNN7B+ww1XYa1JC5A0gRf7+j283XIBx4TLJZQk=
X-Google-Smtp-Source: ABdhPJy8w2fRW4dZI9DTrmrOhoWiWSqSZampqzdk2YGImiw4iAHU4JyHkA2fn5g58M+A3140s/CiqVccrocxZOYphLM=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr18624843oth.215.1602530038167; 
 Mon, 12 Oct 2020 12:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
 <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
 <alpine.DEB.2.21.2010111937100.5535@felia>
 <CABJPP5BvD-6QZ_tbFcTyRmBq_w8NES9v528Q3PeA9w8y0-nznQ@mail.gmail.com>
 <CABJPP5BHR8+bE14dM3EZ4Z5jSujz12jxQCFTku_4rV6n2b_kDA@mail.gmail.com>
 <alpine.DEB.2.21.2010122053210.17866@felia>
In-Reply-To: <alpine.DEB.2.21.2010122053210.17866@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 13 Oct 2020 00:43:33 +0530
Message-ID: <CABJPP5BrrqFh=e6Qiy8=PLB+26uenBkyTgShcD9qeHaLVZiqFw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new
	exceptions to repeated word check
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

> > I did run an evaulation for the single letter case
> > and though it caught one of the lurking 'a's, like in:
> >
> > commit 8d90822643ad ("crypto: engine - support for batch requests")
> >
> > WARNING:REPEATED_WORD: Possible repeated word: 'a'
> > #53: FILE: crypto/crypto_engine.c:472:
> > + * @cbk_do_batch: pointer to a callback function to be invoked when executing a
> > + *                a batch of requests.
> >
> >
> > But yikes, it introduced new false positive:
> >
> > commit 6514b25d3fba ("lpfc: Refactor Send LS Request support")
> >
> > WARNING:REPEATED_WORD: Possible repeated word: 'x'
> > #156: FILE: drivers/scsi/lpfc/lpfc_nvme.c:614:
> > + "Data: x%x x%x  rc x%x\n",
> >
> > It's probably a bad idea to allow single lettered checking. :-[
> >
>
> Yeah, I feared that...
>
> I agree single letter checking is probably not a good idea if we do not
> refine that even more.
>
> Maybe, we put that aside for now and look at other potential improvements.
>
>
> Lukas

Yeah sure, so just quickly sending out the small patch for git modification.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
