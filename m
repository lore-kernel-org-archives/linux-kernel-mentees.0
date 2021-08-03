Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B8FC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED8660F94
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ED8660F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DFB40550;
	Tue,  3 Aug 2021 18:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbOprsmwZrOx; Tue,  3 Aug 2021 18:07:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4D7E0404A2;
	Tue,  3 Aug 2021 18:07:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32048C001A;
	Tue,  3 Aug 2021 18:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27AD5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17639404A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdeUPSTHOcYe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:07:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50FD6404A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:07:55 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id s48so64293ybi.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YOVFg0JSHQCZrP1KVZdJOI98H+feH4GRqVjNNz+i5Q=;
 b=gFPtHL80tqy/7gKo7z/13/qfNChVLAxSsIC6fZdUVCu6NpQMPca9ChTHVvfCfgDf7W
 tzZ8vAbAT/iVJn/8kOzymp3uoXdbtmYJzyFJCob64XxVTHjo73PkvcMPGobLCq9aUNdB
 PRppuCe34MAHeBjf3AWBBUf2g0XOdFH8wuI2/yyTkmm7nxAWn6n9kY3pXF725FHmg6WF
 3JUn5DAldZaloIQuYRPQcQETE89kNyJkc1YVuFxqNzDZsZW7/ZXP+UNJPb5XeVO9/kem
 pPJTRrWXhLbJJ3jXL2iclMiaXriTgPz6uEHXqTVtRZGJc0zNMWrNLe4SuzbflXlax5XA
 jtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YOVFg0JSHQCZrP1KVZdJOI98H+feH4GRqVjNNz+i5Q=;
 b=hfbtxT2wrMPalsM8Tkuj4BVYR0cRMELzi+iqdJq0XLrh1sSSXKkS0XUrrvs7R5EFre
 RqZqHXZabhECFtfZ0TSJQ5wHAvEyLXPGez4Xu+xMyW5gez/donNbyXMeZAP7ugn0ouxt
 xOa8DFWrJZMIv3OVWCF0rrifXMIvFDqsT2aGywAcd9SjQjt50Kb7Ixv7TPk1m8BcQfE+
 ikFNuu94uJOWNT3w8oIrDoyEXCB8LcESnF7vRU8dX2+R/mKWqu0iEzaaJjGg5EhwWlXN
 /yPp2ziXkVpYVWZas4igufjQbgxXAEtM4nmgfr5onFZF7bVkGtcTz18SfhqVFt6yjSR0
 CbyA==
X-Gm-Message-State: AOAM533aJFKwwaiXbn4k8jlfSW/Tb9KlJ80RbFfih5luEDDBdr1vcRB4
 qLnMe8VS7CeC18iVHlLfSN6NVvvY7hBIKN/wr3U=
X-Google-Smtp-Source: ABdhPJyWQTlzda4jbHgrciHWkOqf5WkfcIISg8eFD+E5pJwUC1hy/FMzxK3lDbuvpCzE6dKpTs4XD3NECy4mfUW3IBM=
X-Received: by 2002:a25:f310:: with SMTP id c16mr22273857ybs.464.1628014072827; 
 Tue, 03 Aug 2021 11:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210717064653.GA4873@uver-laptop>
 <CAKXUXMwTs=JoMUFaigLsUmnG3XTs3B1NF+VTsYcQYgTSygWXVA@mail.gmail.com>
 <20210724220630.GA11748@uver-laptop>
 <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803163602.GA3469@uver-laptop>
In-Reply-To: <20210803163602.GA3469@uver-laptop>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Aug 2021 20:07:41 +0200
Message-ID: <CAKXUXMy2V9GJM+h1cEeHSTUsKQ3b=MfXY_jba3FRDNKKo12iRA@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation Mentorship Tasks
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Aug 3, 2021 at 6:36 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> On Mon, Jul 26, 2021 at 12:40:48PM +0200, Lukas Bulwahn wrote:
> >
> > On Sun, Jul 25, 2021 at 12:06 AM Utkarsh Verma
> > <utkarshverma294@gmail.com> wrote:
> > >
> > > On Sat, Jul 17, 2021 at 09:23:19AM +0200, Lukas Bulwahn wrote:
> > > > Get a clone of the Linux kernel repository. The script checkpatch.pl
> > > > is under the scripts directory.
> > > >
>
> (snip)
>
> > >
> > > drivers/usb/serial/iuu_phoenix.c:1191: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > > drivers/usb/serial/iuu_phoenix.c:1194: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > > drivers/usb/serial/iuu_phoenix.c:1197: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > > drivers/usb/serial/iuu_phoenix.c:1201: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > > drivers/usb/serial/iuu_phoenix.c:1205: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > >
> > > The file permission macros used in the kernel code are defined in
> > > <linux/stat.h> like S_IRUGO and friends. But it is better to use their
> > > octal equivalent instead, because it easier for Linux users to
> > > understand 0444 instead of S_IRUGO.
> > >
> > > There is no checkpatch documentation for this warning message, but the
> > > message is self explanatory.
> > >
> >
> > Please provide a patch for the checkpatch documentation here. Do you
> > find a reference to some coding style guide in the kernel or some
> > discussion on the mailing list that stated the preference you wrote
> > here?
> >
>
> Yes, Linus suggested the tree-wide conversions for using octal permission.
> https://lwn.net/Articles/696229/
>

Well, then add that reference to your patch on checkpatch
documentation. Waiting for your v2.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
