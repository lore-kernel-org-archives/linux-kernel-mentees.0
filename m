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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91338C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:08:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDC520870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/4alrMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFDC520870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 48D7C27266;
	Tue,  1 Dec 2020 18:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUrzQK76AKdN; Tue,  1 Dec 2020 18:08:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 68B152746F;
	Tue,  1 Dec 2020 18:08:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60749C1833;
	Tue,  1 Dec 2020 18:08:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29A9BC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 182718764A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uytg9zQodXcN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5AAA48763A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:08:30 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id o8so2584644ioh.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8N9oxOTYAhQ/IGsxLRgmT89iuOoQEFXC+2OLuLief+8=;
 b=S/4alrMcJ/ZUt5BNZhbD/em47vcEPq8B945YraNsrgNqohSBtSWP/n8dabZmfwmO+A
 hZ5Vd8MvJRVHZI+d7tpQN+8GQf4R8DmW+bMQbb5/T4lNJ9M0DqoQF5pqBL3zZ05+9iZ6
 FVkaiHdsKRrqxHOda7nM2rNYHoiTPVNcpyBw6+OChvj8dD3yqPtk3gEIbN1v366kCupC
 ju1J6Cbp1oC7UJCI9EY3CWL8NEHGZ817m/ZjfKF9+lM2t2VZi412SN/9q+f+8O2W9+TW
 AIDYrf4PfQ4EgwvRbBmMxQPhmK709oTT1wX55C+9c+M2CkY7pCLUaqbRlxDBvmHmqTcX
 o2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8N9oxOTYAhQ/IGsxLRgmT89iuOoQEFXC+2OLuLief+8=;
 b=W6Pj4jBayEO6v44oqTrfmrPbBqzd6KB4MlL+h8wPk6xgXm4Kc+/YEbShTag3dGT2EY
 T1OgBrMMuYJNP2YEcKKUR6B5NHVUZoS4U4JFoc6qFc1yk0CQvXKlPbZSbCpCsmKkaleY
 nzw9K9pP1sm2zYgmeTKbOGQiLImtZ602R43yAEZQvBkHNUEscKUZUCtcTOl99wbSKSzA
 ftA+rALYFVr5da2i+nYewwdlIL+p6PvpGN/rIFXanLs0kmI9BD9I+x6Mtzk+QXJ2iVNT
 8Da+PgpY8Cluj62cbGg9O9VTs8cwHYWtC7q4nbh5Gi4JpBzxqH+NIKAePjsUZkk0fzE+
 +Tfw==
X-Gm-Message-State: AOAM5316gsU9EW3ytjWEtnTXd/2nkr3GgJkNWz4XZ6uDzzo50uw86hoS
 0LJoE6U2DQRkHPIPr/YvlexZ5es9l2IA3dQo4a4=
X-Google-Smtp-Source: ABdhPJzWVawCxLwboM7qOzfN7mbtQbCk0Jwkl93sWNQRXI1RjopVBdgmMEuZc8d1KkOhLMaShd8j9PKKcGpkCY3TZis=
X-Received: by 2002:a5d:990e:: with SMTP id x14mr3301055iol.158.1606846109518; 
 Tue, 01 Dec 2020 10:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201155212.132233-1-dwaipayanray1@gmail.com>
 <20201201174943.GA32955@PWN>
 <CABJPP5AFjjh8iEJhMp=7GaXB8JDih=rqwJizkGRaAok7dvBsEA@mail.gmail.com>
In-Reply-To: <CABJPP5AFjjh8iEJhMp=7GaXB8JDih=rqwJizkGRaAok7dvBsEA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 1 Dec 2020 19:08:18 +0100
Message-ID: <CAKXUXMyHUTQk=sMC_o7X3CDfnwFYDSsaE=psv0p-EX=30jhnKA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
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

On Tue, Dec 1, 2020 at 7:06 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Tue, Dec 1, 2020 at 11:19 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > On Tue, Dec 01, 2020 at 09:22:12PM +0530, Dwaipayan Ray wrote:
> > > Commit log lines starting with a '#' can be ignored by git if the
> > > corresponding commit message is reworded by a maintainer using
> > > git commit --ammend. This minute error can be easily avoided if
> >
> > s/minute/minor/
> >
> > > checkpatch warns for the same.
> > >
> > > Add a new check which emits a warning on finding lines starting with
> > > a '#'. Also add a quick fix by adding a tab infront of such lines.
> >
> > s/infront/in front/
> >
> > > Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > ---
> > >  scripts/checkpatch.pl | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index dabe39ca819e..10665b9a3d77 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -2966,6 +2966,15 @@ sub process {
> > >                       $commit_log_possible_stack_dump = 0;
> > >               }
> > >
> > > +# Check for lines starting with an #
> > > +             if ($in_commit_log && $line =~ /^#/) {
> > > +                     if (WARN("POSSIBLE_IGNORED_LINE",
> > > +                              "Commit log lines starting with a '#' might be ignored if the commit message is reworded using git commit --ammend.\n" . $herecurr)
> >
> > Also a nitpick, `commit --amend` isn't the only way to reword it, I did
> > it using `rebase -i`.
> >
> > I think something like "Commit log lines starting with a '#' might be
> > dropped by git.\n" is sufficient, without being overspecific?
>
> I think that might be better. I would probably add `dropped by git when
> the commit message is reworded`. I totally forgot that rebase could also
> do it. Thanks.
>
> >
> > Otherwise,
> >
> > Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
> >
>
> Thanks for the feedback and the tag Peilin.
> I will have these changes done.
>
> If Lukas doesn't have any problem with this, I can send it to Joe then.
>

Looks good to me.

Lukas

> Thanks & Regards,
> Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
