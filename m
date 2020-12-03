Return-Path: <SRS0=x+JC=FH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374E9C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 19:01:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98023208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 19:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98023208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3147087D77;
	Thu,  3 Dec 2020 19:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i331LdAxcrqr; Thu,  3 Dec 2020 19:01:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B5D987D67;
	Thu,  3 Dec 2020 19:01:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 079DFC0FA8;
	Thu,  3 Dec 2020 19:01:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA529C0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E67F387AF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmfT3m5hnFjF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:01:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E65787A58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:01:08 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id p5so2907324iln.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Dec 2020 11:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a4TzLhSlXQL4BX3NXjaBKeKvdDoyftB11mno/cFqqgc=;
 b=CtEs0+OV59yTqK3NKLK4J4vF//6Tx2WdMA0S3nICi8MiQUsQeGqd2GzSwH6jgVSQQz
 tP+QRdmQa3z9hoUDeXpKSfjbRy6TzGVuKkNY5LXkWL6sgU4Ixto9X0allkp27J5u2BmM
 mLbMlh+snF92AmqnQTR5GhxAGq/KX19jS8vnq3H+Ynhe9EnDyAeM9BS+PVR352zXgE7i
 qY4EKKXIoKrvCTmBnL/OfeMVl1q1StKDOb0SY1eebn69mDX8lq3Ytdrq7rTEuEWdqqV7
 8fQVUKulAXXOi+JzQ6/dGtq9DBP4dk2tZ2MXsmOwLjXPEBalbkTi1PoLrqYzE4zU+R12
 0RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a4TzLhSlXQL4BX3NXjaBKeKvdDoyftB11mno/cFqqgc=;
 b=fAZiQ7QSs4PxHnsgR/7jogwJzgZGYLjQ+lv99Gkx+A/JmEm2geiJakpLhqXOqWslNd
 pyn+EoaHXMkIzf9Em+DtcSn2Vw6gZlNEPk0ixFjTJEIUXr5RXHcU7QdGyODASlaEETLS
 jG7KcuEJWGqln/S2McMDVMS7M7PP9oe3XRkhP30l/85E8e1OYTpkMwmtWMQcx25lcuiS
 PvLCQhKhawjE6JyJjLSo7ltkbM1W8YRkliEWszsgx8omu9UIlg2xvFzLI5BJLDVjpEVr
 sQxGZW3y/VaFBPY/ll/hpRL/LJwlDhd9ZSUzxULgxIq8VjSfIIzIZwdd/hMTcHT1xqLq
 wD0w==
X-Gm-Message-State: AOAM531YljSh8NQI/3sJcmCMfslfAh7Sl1t8q9G5ii91YgLJODk65e4t
 kFa0/EqP+ENZalhkjvNvKhAGRuJ4bkmQiULuReY=
X-Google-Smtp-Source: ABdhPJyTIPxh2syZtAqKyljBRNEMpYCL7sobb1pR//WO+gVSqg/SnvI2ZHTbZiXgxHnOVVW+8VeaqKv7+GOU3CWFrDo=
X-Received: by 2002:a92:512:: with SMTP id q18mr646027ile.147.1607022067522;
 Thu, 03 Dec 2020 11:01:07 -0800 (PST)
MIME-Version: 1.0
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
 <20201202183045.9309-1-yashsri421@gmail.com>
 <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
 <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
 <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
 <X8k1CaSlaJpJdmcC@kroah.com>
In-Reply-To: <X8k1CaSlaJpJdmcC@kroah.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 3 Dec 2020 20:00:58 +0100
Message-ID: <CAKXUXMye+ppB1DhGu9xwqRa2BEuLKzsQVL3_RUNySy+zKXHoLg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
 non-standard signature - co-authored-by
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

On Thu, Dec 3, 2020 at 7:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 03, 2020 at 11:59:54AM +0100, Lukas Bulwahn wrote:
> > On Thu, Dec 3, 2020 at 10:59 AM Aditya <yashsri421@gmail.com> wrote:
> > >
> > > On 3/12/20 12:26 am, Joe Perches wrote:
> > > > On Thu, 2020-12-03 at 00:00 +0530, Aditya Srivastava wrote:
> > > >> Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
> > > >> non-standard signatures.
> > > >>
> > > >> An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
> > > >> non-standard signatures, 43 are due to the use of 'Co-authored-by'
> > > >> tag, which may seem correct, but is not standard.
> > > >>
> > > >> The standard signature equivalent for 'Co-authored-by' is
> > > >> 'Co-developed-by'.
> > > >
> > > > I'm not going to ack this as I don't mind non-standard signatures.
> > > >
> > >
> > > What do you suggest?
> > > Should I drop this patch and move on?
> > >
> >
> > Joe does not ack this, but he also does not nack it.
> >
> > You either move on (which is perfectly fine), or
> >
> > you either wait that Andrew Morton reviews it and accepts it because
> > he thinks it useful, or
> >
> > you reach out to the git committers that have been using
> > Co-authored-by in the past and ask them if this kind of feature would
> > have been helpful for them and you get an ack from them that convinces
> > Andrew Morton to pick this.
>
> co-developed-by is the correct tag for this.  It is documented exactly
> for this reason, please do not try to use something that is not already
> accepted by the kernel developers for this type of thing.
>

Well, Greg, so do we get your Acked-by on a feature that checkpatch
warns that Co-authored-by is non-standard and that then fixes up the
patch automatically to Co-developed-by with checkpatch --fix?

If so, please add your Acked-by on this patch here and let Andrew know
to pick it...

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
