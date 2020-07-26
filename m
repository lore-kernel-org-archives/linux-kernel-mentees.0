Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46F9C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 17:10:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924082065F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 17:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URWIezjX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924082065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F59985F9B;
	Sun, 26 Jul 2020 17:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtptKVpeNUmh; Sun, 26 Jul 2020 17:10:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCB7B85742;
	Sun, 26 Jul 2020 17:10:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB2A8C0050;
	Sun, 26 Jul 2020 17:10:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E458C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DC3D85742
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6NYbRVWtngI
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:10:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 054B285402
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 17:10:07 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a21so14700099ejj.10
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 10:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=/AHyo1DDir1ARRDGLEhAWpnSQOxJeJCcUdevGx8s0Hw=;
 b=URWIezjXFtvFykTEaKftIDOKzaue2SAm4xou6fOwzPjRLgYdUOqB296x+YdHpdqDgk
 bJLAK60Y1C7THiO0IdqJqvIczVG4NVNLQKl67Gni2c+Yxcu+vfZxybo+MTDa7pQ0haRQ
 vjXCajA+j5j/PVYOVEQqJfxw3PbISGKOj4yyg94pkfr3XVgmpoycCI+Rr1AlKAt9zXH2
 ABjbBZeG7jn38P24OGY/d2kinKJTE4k/wPvKvygeUSg1E8ZF8WPfw+/96scW7DUtk3M5
 ZkWVD7DOQvdku5+/GIA6nvhd67Zr3s4N6GLsgT2J3vz2NMNwXpwQTrIOSxRH0YtQjFxc
 jp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=/AHyo1DDir1ARRDGLEhAWpnSQOxJeJCcUdevGx8s0Hw=;
 b=pKjp5Fio6QwCXFC6QzpA1jIzeYLDRnjvfnLwjG2EBQcQ5AJJi2QBV+2E2i2WoWgaQS
 UiCZUghP9vashKIHbTGsjE68NpjkfUvGvhq706ZY2AxtnYNd4Pkx2PLed6gDG6g46hEQ
 LjXHO6jYoaPnrtkHScAwt+cMZoMeidgrM3i4Ps6kC3YAvy/1j/bBma0iOtwNFCLd8qyj
 nzwASPIOalmFqXCKZDZuFkY8IDh2q77GoVkk1TIsH2qSTQ0FB35puQcu8eAoN7qEzqF/
 aa2ClS18kCfcZF9AGWoJlEQ2Sbjkmn2jpTNCdqyJ2E6b7pD38Sh0dxMM3BChyEZba7f2
 7HlQ==
X-Gm-Message-State: AOAM531R7FeVsrh7lgAk63K21h2KkJRYsSnNiAa4/fWldFGOHM5e/xLw
 oAydV5YJlNbWTOVwsrfmNAM=
X-Google-Smtp-Source: ABdhPJyMNafs/dVzN6KXU9Z2zSXdwtKlb1p9vWiejs8Am4HfKjyxA04a7O1wwJrV+33sVImTLO0jVA==
X-Received: by 2002:a17:906:a24a:: with SMTP id
 bi10mr17500312ejb.227.1595783405158; 
 Sun, 26 Jul 2020 10:10:05 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:7800:396d:7798:779b:80f5])
 by smtp.gmail.com with ESMTPSA id b17sm5272649ejc.82.2020.07.26.10.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 10:10:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 26 Jul 2020 19:09:55 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200726140412.u5uyd73kwtxebs2y@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007261907140.3702@felia>
References: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
 <alpine.DEB.2.21.2007260759440.7525@felia>
 <CAD1=X6kUzJNwdkRoZi01yYVAw7SskgALpTkRGmNLLxWxxjMzFQ@mail.gmail.com>
 <alpine.DEB.2.21.2007261302320.6195@felia>
 <20200726140412.u5uyd73kwtxebs2y@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1974577973-1595783404=:3702"
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for script files
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1974577973-1595783404=:3702
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



On Sun, 26 Jul 2020, Mrinal Pandey wrote:

> On 20/07/26 01:09PM, Lukas Bulwahn wrote:
> > 
> > 
> > On Sun, 26 Jul 2020, Mrinal Pandey wrote:
> > 
> > > 
> > > 
> > > On Sun, Jul 26, 2020 at 11:43 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > > 
> > > 
> > >       On Sat, 25 Jul 2020, Mrinal Pandey wrote:
> > > 
> > >       > In all the script files(except yaml), SPDX license identifier is expected
> > > 
> > >       Why do believe a yaml file is a script file? Where did you read that?
> > > 
> > >       To me, this reads like:
> > > 
> > >       All fish(except zebras) live in water...
> > > 
> > >       I think you can just drop that note on yaml.
> > > 
> > >       > on the second line, the first line being the shebang. Sometimes, the
> > >       > diff content includes the SPDX licensing information but excludes the
> > >       > shebang when a commit is made to a script file.
> > >       >
> > > 
> > >       You can be more explicit here. Sometimes? You can exactly say when and how
> > >       that happens.
> > > 
> > >       > This can be seen in the commits like commit 37f8173dd849 ("locking/atomics:
> > >       > Flip fallbacks and instrumentation") and commit 075c8aa79d54 ("selftests:
> > >       > forwarding: tc_actions.sh: add matchall mirror test"). In these cases
> > >       > checkpatch issues a false positive warning:
> > >       > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > >       >
> > >       > I noticed this false positive, while running checkpatch on the set of
> > >       > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > >       > This false positive exists in checkpatch since commit a8da38a9cf0e
> > >       > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > >       > when the corresponding rule was first added.
> > >       >
> > >       > The existing logic looks for a shebang in the patch/file being checked
> > >       > and if a shebang is encountered it directs checkpatch to expect
> > >       > license on the second line by setting `$checklicenseline` to `2`.
> > >       >
> > > 
> > >       You can drop those `quotes` around variable names and numbers.
> > > 
> > >       This can be written shorter:
> > >       Currently, if checkpatch find a shebang in line 1, it expects the
> > >       license identifier in line 2 instead of line 1.
> > > 
> > >       > However, this approach doesn't work when we don't have a shebang in the
> > >       > patch and `$checklicensline` continues to be `1` in this case leading to
> > >       > the unnecessary warning.
> > >       >
> > > 
> > >       However, this only works when both line 1 and 2 are part of the patch.
> > > 
> > >       > Fix this by setting `$checklicenseline` to `2` by checking if the patch
> > >       > comes from a script for the cases when the shebang doesn't appear in the
> > >       > patch.
> > >       >
> > > 
> > >       You are not really fixing it. You are improving the heuristics.
> > > 
> > >       So:
> > > 
> > >       Reduce the false warnings for such patches on scripts, by checking file
> > >       extension.
> > > 
> > >       Alternatively, you could actually also check the file permissions of the
> > >       file.
> > > 
> > 
> > First, please fix your email client. It is broken. If you want to work in 
> > the kernel community, your email client needs to work as defined in the 
> > kernel documentation.
> > 
> > Read the kernel documentation on email clients and fix your client.
> 
> Sir,
> 
> I apologize if this has been causing trouble lately.
> I have been using neomutt for sending patches and Gmail for conversation.
> Could you please let me know once the issues you have seen with my mailing
> client so that I can address them?

It seems that Gmail does not work... look at the raw emails in email 
archives.

> > 
> > > 
> > > There are 577 executable files in the kernel, out of which 53 don't have a shebang in the first line.
> > > 
> > > Moreover, in these 53 files, 8 should have definitely had it as they are .py or .sh files.
> > 
> > How about fixing those eight?
> 
> Okay, I would send patches to fix this.
> 
> > 
> > > The other files are .dts, .dtsi, .S, .h, .c files, scripts/atomic/atomics.tbl file, Documentation/Changes file
> > 
> > It seems wrong that those have an executable flag in the first place.
> > 
> > That could be fixed as well.
> 
> Is there anything I can do to fix this?

Send patches for those changes.

> > 
> > > and all the files
> > > inside scripts/atomic/fallbacks that are without extension.
> > > If I am correct none of these should have a shebang but I am not very sure about files inside scripts/atomic/fallbacks.
> > > 
> > 
> > Probably that whole atomics stuff needs some documentation and cleanup.
> 
> It would be great if we could do this.
> 
> Thank you.
> > 
> > > If we check for file extension we warn wrongly for 120 files iff shebang doesn't appear in the patch but if we check for
> > > permissions we would warn wrongly for 53 files. I think this is better than checking for extension.
> > > Should we use this heuristic in the new patch I send?
> > >
> > 
> > Yes, go ahead a rework your patch.
> > 
> > 
> > Lukas
> >  
> > > Thank you.
> > > 
> > > 
> > >       Improve the patch; if it looks good then, it could be suitable for the
> > >       larger discussion on lkml.
> > > 
> > > 
> > >       Lukas
> > > 
> > >       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > >       > ---
> > >       >  scripts/checkpatch.pl | 2 +-
> > >       >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >       >
> > >       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > >       > index 4c820607540b..80dfa83ed0fb 100755
> > >       > --- a/scripts/checkpatch.pl
> > >       > +++ b/scripts/checkpatch.pl
> > >       > @@ -3167,7 +3167,7 @@ sub process {
> > >       > 
> > >       >  # check for using SPDX license tag at beginning of files
> > >       >               if ($realline == $checklicenseline) {
> > >       > -                     if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > >       > +                     if ($rawline =~ /^[ \+]\s*\#\!\s*\// || $realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\)/) {
> > >       >                               $checklicenseline = 2;
> > >       >                       } elsif ($rawline =~ /^\+/) {
> > >       >                               my $comment = "";
> > >       > --
> > >       > 2.25.1
> > >       >
> > >       >
> > > 
> > > 
> > > 
> 
> 
--8323329-1974577973-1595783404=:3702
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1974577973-1595783404=:3702--
