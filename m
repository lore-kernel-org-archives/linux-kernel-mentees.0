Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA9AC64E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:06:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5362151B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBIb09Uw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5362151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C657887495;
	Tue,  1 Dec 2020 18:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YU-UuuOKq7Rc; Tue,  1 Dec 2020 18:06:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33BC087477;
	Tue,  1 Dec 2020 18:06:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E394C1833;
	Tue,  1 Dec 2020 18:06:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD9CC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 733E92746F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmtbMUvKBggw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:06:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 16FA627266
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:06:33 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v14so6115233lfo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 10:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8KijNUyzqlhs3KlEE8P6Ax8t++Ov+4vsXcqVvjx/dg=;
 b=EBIb09UwQmlfW8bhSti00bqn5xksh96C4EFNGN3/0g/uov0JCRGalHjsFl7k8XZmdx
 RZqhoTiFgb1Nz5c3m76iGlpYtAGkyqtl384sIL3udvQtJykiyYW34j8CI8AyCh/6eqRL
 6+HYQNSiMZEFXWT6w6WF7C8GL46Ecn+917e5B7R32SpyH396EMrLFgG9T6nQyCTKrOb9
 2t90a2xWuT1c4eu9Cw5PtTo50oOJNT6hS+mPYNQy+SjBnI5psUHAHZ+L0mNFoFTL7ce4
 uE3OYOAvE3Otg4ylbI6ViOmuzTafmax+nO4nRPj+9bbgRKaAy4v3hdm0f1Haqy8MZKsB
 awUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8KijNUyzqlhs3KlEE8P6Ax8t++Ov+4vsXcqVvjx/dg=;
 b=m/R7ejmpqJjMLBKUWMzCbpw4zLCGAEV2we7BPm5bMCIaek2HriYNzqGf/z6Ocv7PiG
 PHBk8tN+t+ppiQosPAgKrzL4IUd9Ab1GABDe3H/h/+j3xsXpfmYBZ1dnnZT0JDxLhq1M
 uCcu2Q4WiLgM6xN9A1I4fdUzlk14g9mas0hngRiNP9SuhVa9NZJpoWujtf8ngGHO++Rs
 0NtcZmT8IViMP86QOfJEQmBepSIL4FP1PKquRikCN5nPgq9umlE5+zGiK9hFLzgJthCw
 qme91Jlambfy2BYrL1Sp5tt1D59nKw7X/dhtaT0La6CB/nEP7DxoqIrY68FtTf1sIEhM
 jSZA==
X-Gm-Message-State: AOAM533Inm1nI5DA8FzK18Zf90LwFQtTBRsDpPDqzUIymxOZh5bLBtT+
 UgXtHv9O0fLfL4TudBHfO7RbT4IwSdZcKhWq6fs=
X-Google-Smtp-Source: ABdhPJx/r4sXI6vsC7nuqixPRNZ9REIsipUp7zSS2qz8sN1DohylPFdWkq+T5fpqgdL6BD7yKE/ojrWMt5lT3X5gst0=
X-Received: by 2002:a19:8207:: with SMTP id e7mr1873744lfd.372.1606845989810; 
 Tue, 01 Dec 2020 10:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201155212.132233-1-dwaipayanray1@gmail.com>
 <20201201174943.GA32955@PWN>
In-Reply-To: <20201201174943.GA32955@PWN>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 1 Dec 2020 23:36:01 +0530
Message-ID: <CABJPP5AFjjh8iEJhMp=7GaXB8JDih=rqwJizkGRaAok7dvBsEA@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
 lines starting with a '#' in commit log
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

On Tue, Dec 1, 2020 at 11:19 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Tue, Dec 01, 2020 at 09:22:12PM +0530, Dwaipayan Ray wrote:
> > Commit log lines starting with a '#' can be ignored by git if the
> > corresponding commit message is reworded by a maintainer using
> > git commit --ammend. This minute error can be easily avoided if
>
> s/minute/minor/
>
> > checkpatch warns for the same.
> >
> > Add a new check which emits a warning on finding lines starting with
> > a '#'. Also add a quick fix by adding a tab infront of such lines.
>
> s/infront/in front/
>
> > Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index dabe39ca819e..10665b9a3d77 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2966,6 +2966,15 @@ sub process {
> >                       $commit_log_possible_stack_dump = 0;
> >               }
> >
> > +# Check for lines starting with an #
> > +             if ($in_commit_log && $line =~ /^#/) {
> > +                     if (WARN("POSSIBLE_IGNORED_LINE",
> > +                              "Commit log lines starting with a '#' might be ignored if the commit message is reworded using git commit --ammend.\n" . $herecurr)
>
> Also a nitpick, `commit --amend` isn't the only way to reword it, I did
> it using `rebase -i`.
>
> I think something like "Commit log lines starting with a '#' might be
> dropped by git.\n" is sufficient, without being overspecific?

I think that might be better. I would probably add `dropped by git when
the commit message is reworded`. I totally forgot that rebase could also
do it. Thanks.

>
> Otherwise,
>
> Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
>

Thanks for the feedback and the tag Peilin.
I will have these changes done.

If Lukas doesn't have any problem with this, I can send it to Joe then.

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
