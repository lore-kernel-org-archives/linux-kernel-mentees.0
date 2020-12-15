Return-Path: <SRS0=4rFl=FT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377FEC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Dec 2020 06:47:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B069C22285
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Dec 2020 06:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B069C22285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 59BE22034C;
	Tue, 15 Dec 2020 06:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkfdFKB+L4sy; Tue, 15 Dec 2020 06:47:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F187D2013C;
	Tue, 15 Dec 2020 06:46:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D636FC0893;
	Tue, 15 Dec 2020 06:46:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AABB3C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 06:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 99A8786FFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 06:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNplQlUNrNNO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 06:46:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 638C586FFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Dec 2020 06:46:57 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id u12so18145394ilv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 22:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJmGX8DUjsyDkS4IIQzNIpjdN3cF+uUcULONbP0J9i8=;
 b=QgbANH7usQxqfh71A5PcsJTXSP5ll0BlJ/6I9ZwHNVHp+ECykcgiJq+oAjbAecGlDz
 3fU7IrrBHCyD3ow0AjjQe/kRIcuUmBC9IzXvtbgzdBPa49iZcW7OHlh0UsRJ9Nz3vLX5
 2PqzyTyAw0uO8igRPwz4LnqOmeXLwoFzzSjGznHqhXDM4BREqRlBxKKgvdexnKwQjiUv
 FoA7AJZLJlDNtklOu808h5rBRHJiy/o3UuYZLbceG029hrFVgiBxSRu+FmBwnDAotQho
 1jjNEcK7Zou0OuUJlQn3Pp6YbKCRBDq7tVYv2uYSMGiusY3vtvXniYWP6LnbZdJSeOer
 zNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJmGX8DUjsyDkS4IIQzNIpjdN3cF+uUcULONbP0J9i8=;
 b=mN/fxXI5ndHsnSOv/1lP2tE5CQfIkq68Mk8WnTKT5BFcKps0iMWceqIdAa42G33fN5
 2g2cMwodSVw98eDiA2DoW33C1+cZqzTaBXpLfVdSMtSWyZzNcMZ0320wjBloVxgE7ZT0
 hfBMTOwj/rESBbzUbSh54RTWiFIqkVvX1WYSO7rDYMH58xldIB6ckYDekW2h4lN/JR1k
 xWQgoXg/Dnz9WSqFrFoersEqLrbLQl4x6iXsnbv+DJu25XPpckcOkQcyNcmttvCeuN0z
 WgPvQszcb2wMTUwzW6YTlgbGo9nEfI4uj/qBrVBTaSdHOmsoDeSY7o7yQY+fS9ecxd5H
 hhOQ==
X-Gm-Message-State: AOAM531ua6A12TmD3R2m6ip2Zj9zWiMEMGHfhHSOUqDKkLKGfuvHV0e1
 iixDqOTQ8U62kd1Rpe6rcNl9aAIlpKqJdBuXlaw=
X-Google-Smtp-Source: ABdhPJzSPGJgXv64/TNeKBh6gGXaY26ACCNoHowg7oJJ/KLF+VmNLHEYxvduaG3HzFvhlO11LGZsxFkyZmR3q/vFJuc=
X-Received: by 2002:a92:d8cc:: with SMTP id l12mr39405799ilo.64.1608014816562; 
 Mon, 14 Dec 2020 22:46:56 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
 <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
 <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
 <660a4bb0-1ba4-acd4-e8bc-a53cccfbf10a@gmail.com>
In-Reply-To: <660a4bb0-1ba4-acd4-e8bc-a53cccfbf10a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 15 Dec 2020 07:46:45 +0100
Message-ID: <CAKXUXMy7XbmWmj5HOrAJ-fYAdZmK0kd9NnP_i4cpOaS7eqCnrw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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

On Fri, Dec 11, 2020 at 10:16 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 11/12/20 11:57 am, Lukas Bulwahn wrote:
> > On Fri, Dec 11, 2020 at 7:24 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >>
> >>>
> >>> Aditya, Dwaipayan, can you set up a git repository that you use
> >>> together to work on this script?
> >>>
> >>> And provide a short description of how to use the script with an
> >>> example in that repository?
> >>>
> >>> Then, I am happy to try it out... and provide you more feedback.
> >>>
> >>> Lukas
> >>
> >> Hi Lukas,
> >> Sure enough, if Aditya doesn't mind, I will put up a repo for the same.
> >>
> >
> > Dwaipayan, just set up a repository with your latest state that you
> > are currently happy with, then Aditya can fork that and put changes on
> > top as he might see fit and open a pull request, so you integrate them
> > back.
> >
>
> Hi
> I have added my changes in the repo and also provided steps to run the
> script in readme.
>
> Repo Link: https://github.com/raydwaipayan/apply-patch
>
> You can use this patch for testing. It applies on next-20201204.
>

Okay, I downloaded and tried it:

perl ./scripts/applypatch.pl --clang-format test.patch
--branch=test-clang-format-bfq-cgroup

but it failed:

git checkout test-clang-format-bfq-cgroup
Already on 'test-clang-format-bfq-cgroup'
git am $patchtest.patch
fatal: could not open '.patch' for reading: No such file or directory
Clang formatted patchfile generated at:
test.patch.EXPERIMENTAL-clang_format-fixes
git checkout test-clang-format-bfq-cgroup
Already on 'test-clang-format-bfq-cgroup'

How about setting up a minimal travis.ci check that runs this command
on a small git repository with one file and one patch on top for
testing purposes?

The script does not have error handling yet, so the next steps are
just executed blindly even if the one before failed and is really
required for the next one to do the right thing.

I generally like the script, let us work a bit on tuning it for proper
error handling, add some basic tests and then discuss it with Miguel.

Lukas

> From c631c1b9c4c7e3cdbf0e41b21b8fa1d34ba20aef Mon Sep 17 00:00:00 2001
> From: Aditya Srivastava <yashsri421@gmail.com>
> Date: Fri, 11 Dec 2020 14:19:52 +0530
> Subject: [PATCH] patch for testing
>
> This patch has been created for testing clang-format on c-file.
> ---
>  block/bfq-cgroup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/block/bfq-cgroup.c b/block/bfq-cgroup.c
> index b791e2041e49..8409ee064204 100644
> --- a/block/bfq-cgroup.c
> +++ b/block/bfq-cgroup.c
> @@ -184,7 +184,8 @@ void bfqg_stats_set_start_empty_time(struct
> bfq_group *bfqg)
>                 return;
>
>         stats->start_empty_time = ktime_get_ns();
> -       bfqg_stats_mark_empty(stats);
> +
> +bfqg_stats_mark_empty(stats);
>  }
>
>  void bfqg_stats_update_idle_time(struct bfq_group *bfqg)
> --
> 2.17.1
>
>
> Thanks
> Aditya
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
