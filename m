Return-Path: <SRS0=yuUc=E7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A374C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 07:19:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6ABD208B8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 07:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpzNa0Yw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6ABD208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 72D5C86886;
	Wed, 25 Nov 2020 07:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hk69BxP1DILg; Wed, 25 Nov 2020 07:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E789F86521;
	Wed, 25 Nov 2020 07:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA0EFC0891;
	Wed, 25 Nov 2020 07:19:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51566C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4D0DC873C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76moJw4fASNl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:19:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 87E02873A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:19:46 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id r17so1184183ilo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 23:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVf+4xsu4SfQ4raIK6IPb0APW09faAANvTltROzkmZA=;
 b=CpzNa0Yw7i+DZCjnnCiwuHJS1vndK3jlcZWhLFoXYBAVgB3Ad8rLfiihHUu4DwyjS2
 l0teBGQG/je3oHeu066BkET7muBTeNDk6N58TnI3ljt7spzQGny4GlCX6XS5AKhhUYlz
 8PGq9fqFxKH8rR+pxXEV8ZywRE1hAirdHk1x9rtYjZWoPmjCrSsb65lF9bCJOD20d+kI
 yA7Y3unlArZbgyCAj3hkAibMOksBAZzAlOC1np2AXl4yAVcWotsQ9ij0zpcJo95tYzs6
 6/J22NtrTp/KshKpQqmxs+BJd43llfTdVoLdk4anYnSkyaMz3fIVNZ5CcE+xXXSj4Bmw
 ne1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVf+4xsu4SfQ4raIK6IPb0APW09faAANvTltROzkmZA=;
 b=swRQbT23LKtAhpuIU0IXI3iXPag1fXiMXIy+DBHueT+mFbl3lUdcDrWqzvWMKaGo82
 mhHjaJ5ATjlR1x65YnOnUsq2+6Q4iAKId9/KTJPhedv1n+tc0TdE0GmDw7zWxfH2ksqw
 o0sUER+dwUpaqLLfNuOFG4JsgEvDGKctfLQ8ceILP7sb/EZe5yyQekibGzaGqOA9pcV0
 I60IKvPwt+3SEyJTuuls8ALm5FJW18aHPom/1ALcrhvsF9KCwLCr3ZnPOiC4Q691Ae8q
 82SdQfqCHg2ee4eIC1n9tEeq1OFFcHAae80cQEP6Ob6x0/Ib51LWYUI1A0jCUIkJNqFT
 WJZA==
X-Gm-Message-State: AOAM533jWptD1V9Tkinmqex3GuyCkZV47Y3E6pPv5zqAeCN9HKyPMoMk
 MHVujAQ5b8ln2hekjEuxq10nM4BHMKuK06ajdo0=
X-Google-Smtp-Source: ABdhPJzyM/gGw4EJE/zOVrWmw+2AS+MrpscGlA4AguzlcVHApoyXzM8LBZTbNyHB/dCquyQxLB+Kw8frazAhb+vL41M=
X-Received: by 2002:a92:600e:: with SMTP id u14mr1769308ilb.221.1606288785745; 
 Tue, 24 Nov 2020 23:19:45 -0800 (PST)
MIME-Version: 1.0
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
 <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
 <CAKXUXMx9J4uJcjsUXQS0heV80qf6d0OgzJ-0kHtimW7nd3dXKw@mail.gmail.com>
 <b2d1808d-1657-67c8-507e-b317b1ad86e8@gmail.com>
In-Reply-To: <b2d1808d-1657-67c8-507e-b317b1ad86e8@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 25 Nov 2020 08:19:35 +0100
Message-ID: <CAKXUXMxA9jR00-qv7ng748hCx5GVN6zvR9uHfYQTdf0D35ju8Q@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for NETWORKING_BLOCK_COMMENT_STYLE
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

On Wed, Nov 25, 2020 at 8:02 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 22/11/20 12:22 pm, Lukas Bulwahn wrote:
> > On Thu, Nov 19, 2020 at 11:44 AM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 19/11/20 12:30 am, Lukas Bulwahn wrote:
> >>> On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
> >>> wrote:
> >>>
> >>>> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
> >>>> if we use an empty '/*' line for comment and contents of comments are
> >>>> in next line
> >>>>
> >>>> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
> >>>> the refs / unrefs from the transport") reports this warning:
> >>>>
> >>>> WARNING: networking block comments don't use an empty /* line, use /*
> >>>> Comment...
> >>>> +               /*
> >>>> +                * If the TXQ is active, then set the timer, if not,
> >>>>
> >>>> Provide a fix by appending the current line contents to previous line
> >>>> and removing the current line
> >>>>
> >>>
> >>> Patch generally looks good.
> >>>
> >>> Can you check how many comments in net actually follow that style and how
> >>> many follow another style?
> >>>
> >>>
> >>
> >> In drivers/net:
> >> Wrong style: 14695 lines
> >> Correct style: 147961 lines (ie around 10 times)
> >>
> >> In net/:
> >> Wrong style: 5090 lines
> >> Correct style: 30485 lines
> >>
> >
> > Can you find out where the wrong style is used?
> >
> > Maybe the documentation is a bit outdated.
> >
> > For example, some drivers and some subdirectories might have settled
> > for another commenting style.
> >
> > I guess you can submit the fix option, but it could be that the whole
> > rule/feature is broken anyway... so I do not know if that fix is of
> > any good...
> >
> > I think it is better to actually understand, document and encode the
> > current rule that applies.
> >
> > Can you provide an evaluation where the different styles for
> > commenting are aggregated in a good way?
> > E.g., consistently within a file with style XYZ; mixed style but
> > 80-90% are of style ABC; consistent within a directory.
> >
> > If you think some cases are in the wrong style for some specific
> > files, simply send a patch correcting the commenting style and see.
> >
> Hi Lukas
> I have generated the reports regarding the comments used in various
> files at net/ and drivers/net.
> Directory wise reports:
>
> net/:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative.txt
>
> drivers/net:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative.txt
>

Can you sort that by the overall number of comments per directory?

> File wise reports:
>
> net/:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative_file.txt
>
> drivers/net:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative_file.txt
>
> Some files in 'net/' follow the accepted syntax, such as:
> 'net/batman-adv => 985    0'.
>
> However, some completely not, such as:
> 'net/ax25 => 0    103'.
>
> Some even follow mixed syntax such as:
> 'net/netfilter => 87    125'.
>
> Similarly for drivers/net:
> drivers/net/ethernet/mellanox/mlxsw => 1071    0
> completely follow accepted syntax.
>
> drivers/net/wireless/ralink/rt2x00 => 98, 2082
> follow unaccepted syntax largely.
>
> whereas files such as drivers/net/wireless/ath/ath5k => 304, 486
> follow mixed syntax.
>
> It seems to me as the documentation might be outdated, as you had also
> suggested earlier, or maybe users are unaware of the documentation and
>  just use the syntax for conserving consistency of the code.
>
> What do you think?
>

I think it largely depends on the history of the code and developers
that take care...

We might just start to ask the larger areas to modify the rule for
their directory.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
