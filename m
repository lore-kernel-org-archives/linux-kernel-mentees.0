Return-Path: <SRS0=KfMm=IK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E6DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Mar 2021 07:00:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE8E64F29
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Mar 2021 07:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE8E64F29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C52842D1B;
	Fri, 12 Mar 2021 07:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJEWFjoqiznX; Fri, 12 Mar 2021 07:00:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93C8142C27;
	Fri, 12 Mar 2021 07:00:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7415CC0013;
	Fri, 12 Mar 2021 07:00:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADD69C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 07:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6BA984504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 07:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VGSDw4vbqLP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 07:00:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60BE4844F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Mar 2021 07:00:52 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id r7so1709543ilb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Mar 2021 23:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E99Zfd2Mf/hwCot5q1fILbMB3CtDrbC/Ip5gYh/Z/0=;
 b=TGKYTHizKqsGrQpO/TU9IX/03j7/ZLBzRS1n5Lh2M0F0Yb0Pu8IrWr28jlPSnFzqNb
 BitZowvws3i6Vcq7GaLHVAKv8FiKEsDrmdQkQrL+8kbxqz4QKmhfPbfinF5TOb1ns3bH
 imvDx+8nqOyvLou9YSPCGFm+gyjUXNNB7udxWwNYhNDmxXMWLE/pxvsrPZQBz8g9SZg/
 csMH09562v+RRpvrj9PCYHddVzl2nZzscQbYTz7lRAA7WeB5xbFmMIiLJ0wlxVQLdyxS
 p1KB+c7XfAq/HvWm3nj6R4hdCUgQGCHlM+u5N8BCYe0FHsui56fbPaivnio/dQI/L0M9
 +xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E99Zfd2Mf/hwCot5q1fILbMB3CtDrbC/Ip5gYh/Z/0=;
 b=HRBblsrUzHW8/XYm3n6GGBjw/BRiaVJZ31Ms89QviYmHCnUCtIsR9qaEa/KYydnXnQ
 1OB7V07FL5fnWvcC2x8kc0CveM5AhP8WjZOxdpvFe5F9jp/mqoXxdicPCMdkrBYIZYHX
 zfJ37bHCe5Tbht/D4isV+qe5wgdTDJMLmvvloOCOKHNK/CN4WQZytQhqIOMl53ZptbxK
 eRanB1hlTFLwilfT0kHNvB/rEXsCbAxr765eN2n6VGDqGRhHR3gxjj5Qo166Cwrps5c4
 RZmvl9pmcey+yTlwva/+RBmC5TpCsaa3E61Dv4MGrSR1g9Tmdiwyptut2NQajHYZRmuP
 lgLw==
X-Gm-Message-State: AOAM533a6dyV0AWHDvbWiGKdQjMw2ySHxUsdjaFgJy+9278xgMZuVZWK
 Cq89Au3WbPkUEYWM+pwU9eLX84Qr0U8bdJr+pAc=
X-Google-Smtp-Source: ABdhPJwLExrMo8wDJt1HPXiyvI5heC6Dp8wP9tSCOIe+64pzlnT1e3vU7Ga8S/OE3Y+PxWhoWtJ1dTkJAa1XZnR+wH0=
X-Received: by 2002:a05:6e02:1049:: with SMTP id
 p9mr1772509ilj.125.1615532451415; 
 Thu, 11 Mar 2021 23:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
 <CAKXUXMwg7Vs5hm_X3ZHJj9309w5VYbnNeqXaajHBHS1oAKQydw@mail.gmail.com>
 <838a823b-f3fd-ed1b-70d1-82611f9f4ada@gmail.com>
In-Reply-To: <838a823b-f3fd-ed1b-70d1-82611f9f4ada@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 12 Mar 2021 08:00:40 +0100
Message-ID: <CAKXUXMyJKU2ayx6KPFU50JA+t+X6-hhQwo0woNC18T6FTK60rw@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Aditya <yashsri421@gmail.com>
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On Thu, Mar 11, 2021 at 10:04 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 10/3/21 11:49 am, Lukas Bulwahn wrote:
> > On Tue, Mar 9, 2021 at 10:24 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 9/3/21 7:00 pm, Markus Heiser wrote:
> >>>
> >>> Am 09.03.21 um 13:53 schrieb Aditya Srivastava:
> >>>> Starting commented lines in a file mostly contains comments describing
> >>>> license, copyright or general information about the file.
> >>>>
> >>>> E.g., in sound/pci/ctxfi/ctresource.c, initial comment lines describe
> >>>> its copyright and other related file informations.
> >>>
> >>> The opening comment mark /** is used for kernel-doc comments [1]
> >>>
> >>> [1]
> >>> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments
> >>>
> >>
> >> Hi Markus!
> >> That's true. But the content inside the comment does not follow
> >> kernel-doc format.
> >> For e.g., try running kernel-doc -none/man/rst on the above file in
> >> the example("sound/pci/ctxfi/ctresource.c").
> >> The starting 2-3 lines in files generally do not contain any
> >> struct/enum/function, etc. declaration.
> >>
> >
> > Aditya, can you provide a diff of the warnings over the whole kernel tree?
> >
> > At the moment, your patch just implements ignoring the initial
> > comment, which probably is good for experimentation.
> >
> > Alternatively, we could simply have a dedicated warning and then
> > ignore it or even warn and then parse it as-if.
> >
> > In the "long run", we would probably want to fix all current files in
> > the repository by just replacing '/**' by '/*' and have kernel-doc
> > warn about this suspicious pattern, when new files appear (maybe even
> > configurable, but that is another feature to enable or disable certain
> > kernel-doc checks and warnings). I would certainly assist and
> > contribute to such a clean-up task.
> >
> > I think the first step is to look at the diff, and see how many cases
> > really appear in the tree... then check how many patches throughout
> > the whole tree are required and if they are generally accepted.
> >
>
> Hi Lukas!
> This is the diff of the warnings over kernel tree before and after
> applying these changes.
> There are 2 sections in this report:
> 1) for the warnings present before, but not after, and;
> 2) after but not before
>
> The part (2) contains, for some cases, where the warning for "warning:
> Incorrect use of kernel-doc format:" type has changed to "warning:
> wrong kernel-doc identifier on line:" type.
>
> The diff file can be found at:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/avoid_init_line_diff.txt
>

Thanks, let us check if we can use this diff to create a patch set
that cleans up those header comments for those files.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
