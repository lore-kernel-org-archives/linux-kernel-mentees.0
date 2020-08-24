Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA18FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:54:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C83204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWB5Fly9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C83204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A5C785D4B;
	Mon, 24 Aug 2020 08:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkybWGIeb5QS; Mon, 24 Aug 2020 08:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 38CFE85D54;
	Mon, 24 Aug 2020 08:54:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20580C016F;
	Mon, 24 Aug 2020 08:54:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD4D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3EED87DAA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElmH6G1wGbCM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:54:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3706187D9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:54:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o21so7411541wmc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=pxhlg57M8iaFVNab814mqpwjZNXkkioJZcopKhuOpSM=;
 b=LWB5Fly9uNN3nzsE1G4Zu1BWtF3e1q0pNl2o3oY4plCvx4fow/q76QPsWgoCNO7H1L
 WCnKeIZvZWK+VWwaXaUJ3f6IAo0RNszalArwjbdRUkDAzskNfG5RHKxtZMkUK0qHQiqT
 qSJgtoA/pADtelUB4Ri6nrrux/YDxG4wxkIMyVEiLccK6BMSidOObYymo/yfhhtaXuQp
 rlQO0WWPTKJiRBlgSdA11Qc9Dq+iVbn8js6U5RC0VM1gZFh1WYafEyHr5DVUE6PaurGJ
 IaLOIJ0U0AwuZm5Ft1qOtrBav9hUNCCg2ipUel1XlHxWq4fKtTJO41k1oLIIElK2+V4G
 zVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=pxhlg57M8iaFVNab814mqpwjZNXkkioJZcopKhuOpSM=;
 b=m22YK5Hcibi0uQKe/elc9e6y/Kd+17bGNSsOgMsA0siK5cbBqKr0C+xBhrGKm2y/ua
 hZXpx5h5VO/ZSGNnYy/p/djkD+4fyUmsajJCHGi4vuZebBsetQAJVFDJOrTka+p1HTwE
 dLKW1myvf3UE/QslQTn7yUT9nm3Uhx54IfAgt/IZUHiaCXp761KVlP/gYPkoD8412/Bw
 y/DIOQLRf+OHeqDDiA0U7bV055y/QIoOCHs/TQaogqF8YkX0tSAyyoDpkhF/rgs4R4HO
 IhrXBSZ/kE1MGnffW73imAYNc2YQ3V6elbOEXH+r8p1UxagFW7ntApBrYKI7uXL4haLQ
 jl2A==
X-Gm-Message-State: AOAM5327/0jFuOOuxtQTXtIipM71jZhIey/GJuIsgKulKB2MwElycRzV
 Uo0vDR/QUXZUqYiMQg8xX0g=
X-Google-Smtp-Source: ABdhPJxn/fHdSizOPeD40Fp4ApFefk7MP1Y45Gy+qZNx78MXd30tr+8si4lf2ITB11Tp+Hoi45mE8Q==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr4680894wmc.150.1598259277465; 
 Mon, 24 Aug 2020 01:54:37 -0700 (PDT)
Received: from felia ([2001:16b8:2d4c:8a00:f0ec:b5d5:8c1c:a145])
 by smtp.gmail.com with ESMTPSA id g9sm2971848wrw.63.2020.08.24.01.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 01:54:36 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 24 Aug 2020 10:54:29 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2008241052310.2932@felia>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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



On Mon, 24 Aug 2020, Mrinal Pandey wrote:

> On 20/08/22 10:24AM, Lukas Bulwahn wrote:
> > 
> > 
> > On Thu, 20 Aug 2020, Mrinal Pandey wrote:
> > 
> > > On 20/08/09 12:52PM, Mrinal Pandey wrote:
> > > > On 20/08/04 09:37PM, Lukas Bulwahn wrote:
> > > > > 
> > > > > 
> > > > > On Tue, 4 Aug 2020, Mrinal Pandey wrote:
> > > > > 
> > > > > > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > > > > > > 
> > > > > > > > The diff content includes the SPDX licensing information but excludes the
> > > > > > > > shebang when a change is made to a script file in commit 37f8173dd849
> > > > > > > > ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> > > > > > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> > > > > > > > test"). In these cases checkpatch issues a false positive warning:
> > > > > > > > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > > > > > > > 
> > > > > > > > Currently, if checkpatch finds a shebang in line 1, it expects the
> > > > > > > > license identifier in line 2. However, this doesn't work when a shebang
> > > > > > > > isn't found on the line 1.
> > > > > > > 
> > > > > > > It does not work when the diff does not contain line 1, but only line 2,
> > > > > > > because then the shebang check for line 1 cannot work.
> > > > > > > 
> > > > > > > > 
> > > > > > > > I noticed this false positive, while running checkpatch on the set of
> > > > > > > > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > > > > > > > This false positive exists in checkpatch since commit a8da38a9cf0e
> > > > > > > > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > > > > > > > when the corresponding rule was first added.
> > > > > > > > 
> > > > > > > > The alternatives considered to improve this check were looking the file
> > > > > > > > to be a script by either examining the file extension or file permissions.
> > > > > > > >
> > > > > > > 
> > > > > > > Make this sentence shorter. Try.
> > > > > > >  
> > > > > > > > The evaluation on former option resulted in 120 files which had a shebang
> > > > > > > > in the first line but no file extension. This didn't look like a promising
> > > > > > > > result and hence I dropped the idea of using this approach.
> > > > > > > > 
> > > > > > > > The evaluation on the latter approach shows that there are 53 files in the
> > > > > > > > kernel which have an executable bit set but don't have a shebang in the
> > > > > > > > first line.
> > > > > > > > 
> > > > > > > > At the first sight on these 53 files, it seems that they either have a
> > > > > > > > wrong file permission set or could be reasonably extended with a shebang
> > > > > > > > and SPDX license information. Thus, further cleanup in the repository
> > > > > > > > would make the latter approach to work even more precisely.
> > > > > > > > 
> > > > > > > > Hence, I chose to check the file permissions to determine if the file is a
> > > > > > > > script and notify checkpatch to expect SPDX on second line for such files.
> > > > > > > >
> > > > > > > 
> > > > > > > There is no notification here. Think about better wording.
> > > > > > >  
> > > > > > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > > > > > ---
> > > > > > > >  scripts/checkpatch.pl | 3 +++
> > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > > > > index 4c820607540b..bae1dd824518 100755
> > > > > > > > --- a/scripts/checkpatch.pl
> > > > > > > > +++ b/scripts/checkpatch.pl
> > > > > > > > @@ -3166,6 +3166,9 @@ sub process {
> > > > > > > >  		}
> > > > > > > >  
> > > > > > > >  # check for using SPDX license tag at beginning of files
> > > > > > > > +		if ($line =~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > > > > > > +			$checklicenseline = 2;
> > > > > > > > +		}
> > > > > > > 
> > > > > > > That check looks good now.
> > > > > > > 
> > > > > > > >  		if ($realline == $checklicenseline) {
> > > > > > > >  			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > > > > > > >  				$checklicenseline = 2;
> > > > > > > 
> > > > > > > This is probably broken now. It should check for shebang in line 1 and 
> > > > > > > then set checklicenseline to line 2, right?
> > > > > > 
> > > > > > Sir,
> > > > > > 
> > > > > > Should we remove this check? Earlier when I checked for file extension
> > > > > > we had 120 cases where this check was also needed but now we have a
> > > > > > better heuristic which is going to work for all cases where license
> > > > > > should be on line 2 irrespective of the fact that we know the first line
> > > > > > or not.
> > > > > >
> > > > > 
> > > > > Are you sure about that? Where is the evaluation that proves your point?
> > > > > 
> > > > > E.g., are all files that contain a shebang really with an executable flag?
> > > > > 
> > > > > Which commands did you run to check this?
> > > > >  
> > > > > > If I am missing out on something and we should not be removing this check,
> > > > > > then I suggest placing the new heuristics below this block so that it doesn't
> > > > > > interfere with the existing logic.
> > > > > > 
> > > > > > Please let me know which path should I go about and then I shall resend
> > > > > > the patch with the modified commit message.
> > > > > > 
> > > > > 
> > > > > Think about the strengths and weaknesses of the potential solutions, then 
> > > > > show with some commands (as I did for example, for finding the first 
> > > > > lines previously) that you can show that it practically makes a 
> > > > > difference and you can numbers on those differences.
> > > > > 
> > > > > When you did that, send a new patch.
> > > > > 
> > > > > Lukas
> > > > > 
> > > > Sir,
> > > > 
> > > > I ran the evaluation as:
> > > > 
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> > > > #!/bin/bash
> > > > 
> > > > for file in $(git ls-files)
> > > > do
> > > >         permissions="$(stat -c "%a %n" $file)"
> > > >         echo "$permissions"
> > > > done
> > > > 
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^[7531] > temp
> > > > 
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executables
> > > > 
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> > > > #!/bin/bash
> > > > file="executables"
> > > > while IFS= read -r line
> > > > do
> > > >         firstline=`head -n 1 $line`
> > > >         printf '%s:%s\n' "$firstline" "$line"
> > > > done <"$file"
> > > > 
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> > > > 611
> > > > 
> > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | wc -l
> > > > head: error reading 'scripts/dtc/include-prefixes/arc': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/arm': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/arm64': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/c6x': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/h8300': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/mips': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/nios2': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/sh': Is a directory
> > > > head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a directory
> > > > 540
> > > > 
> > > > We can see that there are 71 files where the executable bit is set but
> > > > the first line is not a shebang. These include 13 directories which
> > > > throw the error above. Remaining 58 files(earlier the number was 53)
> > > > could be cleaned so that this heuristic works better as we saw. So, by
> > > > checking only for the executable bit we can say that license should be
> > > > on second line, we probably don't need to check for the shebang on line
> > > > 1.
> > > > Please let me know if the evaluation makes sense.
> > > >
> > 
> > This evaluation makes sense to find the cases that should be cleaned up.
> > 
> > Either the executable flag is simply set wrongly and should be dropped or 
> > it is actually a script and should get a shebang in the beginning.
> > 
> > I actually already started cleaning up. See:
> > 
> > https://lore.kernel.org/lkml/20200819081808.26796-1-lukas.bulwahn@gmail.com/
> > 
> > We can discuss how to continue this cleanup.
> >
> 
> Sir,
> 
> Sure. I would love to discuss that.
> Should I send cleanup related patches directly to lkml or do they need to
> go through you, Shuah ma'am and mentee list first?
> 
> > However, you cannot use this evaluation to say the checking the executable 
> > bit is enough, simply as from this evaluation, you do not know how many 
> > files have a shebang in the first line and are not set with executable 
> > flag. For those files, we expect the SPDX identifier in the second line 
> > but your suggested approach would expect it in the first line.
> > 
> > So we need an evaluation to find out how many cases of that situation 
> > exist?
> > 
> > Then, can we easily fix those as well?
> 
> Here is the evaluation I ran to find such cases:
> 
> mrinalpandey@mrinalpandey:~/linux/linux$ cat first_lines.sh
> #!/bin/bash
> 
> for file in $(git ls-files)
> do
> 	permissions="$(stat -c '%a %n' $file)"
> 	firstline="$(head -n 1 $file)"
> 	echo "$permissions : $firstline"
> done
> mrinalpandey@mrinalpandey:~/linux/linux$ sh first_lines.sh | grep ^[642].*#! | wc -l
> head: error reading 'scripts/dtc/include-prefixes/arc': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/arm': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/arm64': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/c6x': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/h8300': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/mips': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/nios2': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/sh': Is a directory
> head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a directory
> 82
> 
> The last line in these 82 lines is "Binary file (standard input) matches" so we have 81 instances
> where we have shebang in the first line but the file is non-executable.
>

How about removing the symbolic link files and then sharing that list?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
