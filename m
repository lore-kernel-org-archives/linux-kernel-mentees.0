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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444F7C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 11:09:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D3D2065C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 11:09:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpWERbA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D3D2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D394985F9D;
	Sun, 26 Jul 2020 11:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oeijtd9sRivf; Sun, 26 Jul 2020 11:09:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B3F0857B0;
	Sun, 26 Jul 2020 11:09:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D1D6C0050;
	Sun, 26 Jul 2020 11:09:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFCCFC004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9AFEA878F7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXaziGL6+0zo
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BA9D5878F1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:09:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 3so5077624wmi.1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lwpo9mJiqQEPN9szuzy4NcCnx27DvVZ7Q0FfO9CotxQ=;
 b=RpWERbA1rY4bbBNqma94uxyExLK1gC+tBeaxQgM/6kJP+9D1Vf44MNPrxgWplQ7uj8
 14Up3aAr0uCob7ixvFrPPJmH85W/ogyb+mCCZZCJQiScDBKjY3oy5tw7xyZPfrpD2C1l
 SUA+3EyuJzOm3rRe9lWXdQEcHmeT6JiA6A1VFNrdKBtPZ0JugyEXBFAT0LF1QWXbZ27z
 vScTKnwBLsRjkThshmjAVK2kSf1FKb7zYUNFjO0DzQCSI6g2z5xVjXZJiWmLAFC6syVA
 vgQWlwy6lxdVEhpegK1tMcq78HCeR7BxAB7zliUZl0L5Pouaql/wCu2txXwRSWAkZ615
 UDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lwpo9mJiqQEPN9szuzy4NcCnx27DvVZ7Q0FfO9CotxQ=;
 b=kcdgU36ZZ4h4BRtwyw2ZdgUZRDP5HfFDgVCz/yDvLBXqdVMGCe0NoTcrknCSWW1QZk
 sd5+OOlRgfGB9X362J65Ke4G7ssFVBKT8ahnnmSV5kvi/v8mqAqlRrT+r0Jzf4NHSQW8
 0EuLuYi4lqjgeJI9W7bRhIUimmiYkdfGU+ABBHUSaFqetye1hup0xH0dEUNiKuHMMa/c
 2ivThhn/MLL42i+wgNkFcRKQB7J81/SROXf008g4I4b4iw3ZCDndquGhFoRLl2dRdm8+
 nZ/9oI9iDLo0jFALbD4VM4ObGPoP7Oe5xvp5QSW5DiMG+Z6mmzHv1TphCNeLArgUzfu3
 cbJg==
X-Gm-Message-State: AOAM5333QYCOYR4/yd9JBCsa0C6/5TUQOjNo8MzaJZyKvRQx+NvS8kQg
 WmrqSLeBTrWXS/02JLCW/9o=
X-Google-Smtp-Source: ABdhPJzXDLwz21hux1x33Tlitjq/6LBcD7XwVghvS1zNdHhvuLOxBV7Qf55b/Vypw1SMxTAmVhAa2w==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr16348452wmc.188.1595761777091; 
 Sun, 26 Jul 2020 04:09:37 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:7800:6093:3c0b:c57d:3d50])
 by smtp.gmail.com with ESMTPSA id b8sm7981637wrv.4.2020.07.26.04.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:09:36 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 26 Jul 2020 13:09:24 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <CAD1=X6kUzJNwdkRoZi01yYVAw7SskgALpTkRGmNLLxWxxjMzFQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2007261302320.6195@felia>
References: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
 <alpine.DEB.2.21.2007260759440.7525@felia>
 <CAD1=X6kUzJNwdkRoZi01yYVAw7SskgALpTkRGmNLLxWxxjMzFQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1127221859-1595761776=:6195"
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

--8323329-1127221859-1595761776=:6195
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 26 Jul 2020, Mrinal Pandey wrote:

> 
> 
> On Sun, Jul 26, 2020 at 11:43 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> 
>       On Sat, 25 Jul 2020, Mrinal Pandey wrote:
> 
>       > In all the script files(except yaml), SPDX license identifier is expected
> 
>       Why do believe a yaml file is a script file? Where did you read that?
> 
>       To me, this reads like:
> 
>       All fish(except zebras) live in water...
> 
>       I think you can just drop that note on yaml.
> 
>       > on the second line, the first line being the shebang. Sometimes, the
>       > diff content includes the SPDX licensing information but excludes the
>       > shebang when a commit is made to a script file.
>       >
> 
>       You can be more explicit here. Sometimes? You can exactly say when and how
>       that happens.
> 
>       > This can be seen in the commits like commit 37f8173dd849 ("locking/atomics:
>       > Flip fallbacks and instrumentation") and commit 075c8aa79d54 ("selftests:
>       > forwarding: tc_actions.sh: add matchall mirror test"). In these cases
>       > checkpatch issues a false positive warning:
>       > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
>       >
>       > I noticed this false positive, while running checkpatch on the set of
>       > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
>       > This false positive exists in checkpatch since commit a8da38a9cf0e
>       > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
>       > when the corresponding rule was first added.
>       >
>       > The existing logic looks for a shebang in the patch/file being checked
>       > and if a shebang is encountered it directs checkpatch to expect
>       > license on the second line by setting `$checklicenseline` to `2`.
>       >
> 
>       You can drop those `quotes` around variable names and numbers.
> 
>       This can be written shorter:
>       Currently, if checkpatch find a shebang in line 1, it expects the
>       license identifier in line 2 instead of line 1.
> 
>       > However, this approach doesn't work when we don't have a shebang in the
>       > patch and `$checklicensline` continues to be `1` in this case leading to
>       > the unnecessary warning.
>       >
> 
>       However, this only works when both line 1 and 2 are part of the patch.
> 
>       > Fix this by setting `$checklicenseline` to `2` by checking if the patch
>       > comes from a script for the cases when the shebang doesn't appear in the
>       > patch.
>       >
> 
>       You are not really fixing it. You are improving the heuristics.
> 
>       So:
> 
>       Reduce the false warnings for such patches on scripts, by checking file
>       extension.
> 
>       Alternatively, you could actually also check the file permissions of the
>       file.
> 

First, please fix your email client. It is broken. If you want to work in 
the kernel community, your email client needs to work as defined in the 
kernel documentation.

Read the kernel documentation on email clients and fix your client.

> 
> There are 577 executable files in the kernel, out of which 53 don't have a shebang in the first line.
> 
> Moreover, in these 53 files, 8 should have definitely had it as they are .py or .sh files.

How about fixing those eight?

> The other files are .dts, .dtsi, .S, .h, .c files, scripts/atomic/atomics.tbl file, Documentation/Changes file

It seems wrong that those have an executable flag in the first place.

That could be fixed as well.

> and all the files
> inside scripts/atomic/fallbacks that are without extension.
> If I am correct none of these should have a shebang but I am not very sure about files inside scripts/atomic/fallbacks.
> 

Probably that whole atomics stuff needs some documentation and cleanup.

> If we check for file extension we warn wrongly for 120 files iff shebang doesn't appear in the patch but if we check for
> permissions we would warn wrongly for 53 files. I think this is better than checking for extension.
> Should we use this heuristic in the new patch I send?
>

Yes, go ahead a rework your patch.


Lukas
 
> Thank you.
> 
> 
>       Improve the patch; if it looks good then, it could be suitable for the
>       larger discussion on lkml.
> 
> 
>       Lukas
> 
>       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
>       > ---
>       >  scripts/checkpatch.pl | 2 +-
>       >  1 file changed, 1 insertion(+), 1 deletion(-)
>       >
>       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>       > index 4c820607540b..80dfa83ed0fb 100755
>       > --- a/scripts/checkpatch.pl
>       > +++ b/scripts/checkpatch.pl
>       > @@ -3167,7 +3167,7 @@ sub process {
>       > 
>       >  # check for using SPDX license tag at beginning of files
>       >               if ($realline == $checklicenseline) {
>       > -                     if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
>       > +                     if ($rawline =~ /^[ \+]\s*\#\!\s*\// || $realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\)/) {
>       >                               $checklicenseline = 2;
>       >                       } elsif ($rawline =~ /^\+/) {
>       >                               my $comment = "";
>       > --
>       > 2.25.1
>       >
>       >
> 
> 
> 
--8323329-1127221859-1595761776=:6195
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1127221859-1595761776=:6195--
