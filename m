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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C90FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:56:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087912072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 08:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwubd3+w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087912072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDB8385DC1;
	Mon, 24 Aug 2020 08:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEuFn6MSrnSR; Mon, 24 Aug 2020 08:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 096EF85D8D;
	Mon, 24 Aug 2020 08:56:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC0D7C016F;
	Mon, 24 Aug 2020 08:56:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6B87C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D00F9204FA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k74lDOfVZImN
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:56:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C8C1204E8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 08:56:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i26so7327750edv.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mN70Wp1wB9dNDbC7M83J4Bo6vDzm3WArcXu1xrobu2o=;
 b=Fwubd3+w5h97QF8esGvgAXLhl5vRbHisK4OlqReIC5C4hgOKdBAQMO5TO0nphLB4vs
 nVAVDae5pDCx+iA3ZRAL3jBVBisTtV1ws+CnWkifr4O+8cSFB6JAjLYCS8k6yNXbVgj0
 blZkm+HCxThjaQPrWxfVhj63BwzaPbh8yBrpN9Pp4XKwFRlF9fZXcmNbxe57vMYyfv7Y
 azJGj5c/Bb1GkJv2Hs3SqXL+glJKQWXZOlgPEDMTsNbULB06MR72joJbD6aPoN8H7vui
 Q7MV5bikUHQXtYFvvfU+mN40sRD+hCOy2u2uWykO+uMtFRsYLo2kjvEj63AK406n0XjW
 6c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mN70Wp1wB9dNDbC7M83J4Bo6vDzm3WArcXu1xrobu2o=;
 b=WtQhqsX26oItiRLalGZ1CGduRNSoke9Ya9GHwn6y3baT3lVBeOIr+/1csY/m8uxuFl
 xvU7wAIksL7/ov9/NlKF0ZvjiOyWmggav4ptjUlGCTO8/Xn5qS0DlXx/XXFfBa6hDAuW
 HG7Z8uhp0WAwlXX3k2xybdAP6Fty1+ilFHpu648BKi4vxpot9xg6hYIWeJgEeuf3+BPE
 jhRvZ/NOiQwBIu9gISX0DKYT4tH4WpcOH4vgzJJTmT3cjbEcwo+nk16t7t4oqaqo0w+W
 5gNeSrXu1EVbZ8cqV8yOP27ZyWJBuCCEpCWVBg/BY0+e30hwbE80qU06krJSifssYmlv
 6Qcg==
X-Gm-Message-State: AOAM533G1lgEeQ7Z+DQ3phks2N3/ysjJG/0DLcIi+6jekQMotkWfXcPh
 2TN5nt1wMieFrx8hiqROq+w=
X-Google-Smtp-Source: ABdhPJxE7MwXJx02Cn6pFaNPseTIH0RxUhDtkmeVR5pMhEQbio5ZQI8hNA78IUUy64b0W0nCdglpjA==
X-Received: by 2002:a50:cd16:: with SMTP id z22mr4216743edi.155.1598259387797; 
 Mon, 24 Aug 2020 01:56:27 -0700 (PDT)
Received: from felia ([2001:16b8:2d4c:8a00:f0ec:b5d5:8c1c:a145])
 by smtp.gmail.com with ESMTPSA id v19sm5499577ejr.101.2020.08.24.01.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 01:56:27 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 24 Aug 2020 10:56:26 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200824083529.m7vqwgbr54lvmcwi@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2008241054470.2932@felia>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
 <alpine.DEB.2.21.2008031251410.8346@felia>
 <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <alpine.DEB.2.21.2008222117460.20211@felia>
 <20200824083529.m7vqwgbr54lvmcwi@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
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

> On 20/08/22 09:25PM, Lukas Bulwahn wrote:
> > 
> > 
> > On Sat, 22 Aug 2020, Lukas Bulwahn wrote:
> > 
> > > 
> > > 
> > > On Thu, 20 Aug 2020, Mrinal Pandey wrote:
> > > 
> > > > On 20/08/09 12:52PM, Mrinal Pandey wrote:
> > > > > On 20/08/04 09:37PM, Lukas Bulwahn wrote:
> > > > > > 
> > > > > > 
> > > > > > On Tue, 4 Aug 2020, Mrinal Pandey wrote:
> > > > > > 
> > > > > > > On 20/08/03 12:59PM, Lukas Bulwahn wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On Mon, 3 Aug 2020, Mrinal Pandey wrote:
> > > > > > > > 
> > > > > > > > > The diff content includes the SPDX licensing information but excludes the
> > > > > > > > > shebang when a change is made to a script file in commit 37f8173dd849
> > > > > > > > > ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> > > > > > > > > 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> > > > > > > > > test"). In these cases checkpatch issues a false positive warning:
> > > > > > > > > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> > > > > > > > > 
> > > > > > > > > Currently, if checkpatch finds a shebang in line 1, it expects the
> > > > > > > > > license identifier in line 2. However, this doesn't work when a shebang
> > > > > > > > > isn't found on the line 1.
> > > > > > > > 
> > > > > > > > It does not work when the diff does not contain line 1, but only line 2,
> > > > > > > > because then the shebang check for line 1 cannot work.
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > I noticed this false positive, while running checkpatch on the set of
> > > > > > > > > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > > > > > > > > This false positive exists in checkpatch since commit a8da38a9cf0e
> > > > > > > > > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > > > > > > > > when the corresponding rule was first added.
> > > > > > > > > 
> > > > > > > > > The alternatives considered to improve this check were looking the file
> > > > > > > > > to be a script by either examining the file extension or file permissions.
> > > > > > > > >
> > > > > > > > 
> > > > > > > > Make this sentence shorter. Try.
> > > > > > > >  
> > > > > > > > > The evaluation on former option resulted in 120 files which had a shebang
> > > > > > > > > in the first line but no file extension. This didn't look like a promising
> > > > > > > > > result and hence I dropped the idea of using this approach.
> > > > > > > > > 
> > > > > > > > > The evaluation on the latter approach shows that there are 53 files in the
> > > > > > > > > kernel which have an executable bit set but don't have a shebang in the
> > > > > > > > > first line.
> > > > > > > > > 
> > > > > > > > > At the first sight on these 53 files, it seems that they either have a
> > > > > > > > > wrong file permission set or could be reasonably extended with a shebang
> > > > > > > > > and SPDX license information. Thus, further cleanup in the repository
> > > > > > > > > would make the latter approach to work even more precisely.
> > > > > > > > > 
> > > > > > > > > Hence, I chose to check the file permissions to determine if the file is a
> > > > > > > > > script and notify checkpatch to expect SPDX on second line for such files.
> > > > > > > > >
> > > > > > > > 
> > > > > > > > There is no notification here. Think about better wording.
> > > > > > > >  
> > > > > > > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  scripts/checkpatch.pl | 3 +++
> > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > > > > > index 4c820607540b..bae1dd824518 100755
> > > > > > > > > --- a/scripts/checkpatch.pl
> > > > > > > > > +++ b/scripts/checkpatch.pl
> > > > > > > > > @@ -3166,6 +3166,9 @@ sub process {
> > > > > > > > >  		}
> > > > > > > > >  
> > > > > > > > >  # check for using SPDX license tag at beginning of files
> > > > > > > > > +		if ($line =~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> > > > > > > > > +			$checklicenseline = 2;
> > > > > > > > > +		}
> > > > > > > > 
> > > > > > > > That check looks good now.
> > > > > > > > 
> > > > > > > > >  		if ($realline == $checklicenseline) {
> > > > > > > > >  			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > > > > > > > >  				$checklicenseline = 2;
> > > > > > > > 
> > > > > > > > This is probably broken now. It should check for shebang in line 1 and 
> > > > > > > > then set checklicenseline to line 2, right?
> > > > > > > 
> > > > > > > Sir,
> > > > > > > 
> > > > > > > Should we remove this check? Earlier when I checked for file extension
> > > > > > > we had 120 cases where this check was also needed but now we have a
> > > > > > > better heuristic which is going to work for all cases where license
> > > > > > > should be on line 2 irrespective of the fact that we know the first line
> > > > > > > or not.
> > > > > > >
> > > > > > 
> > > > > > Are you sure about that? Where is the evaluation that proves your point?
> > > > > > 
> > > > > > E.g., are all files that contain a shebang really with an executable flag?
> > > > > > 
> > > > > > Which commands did you run to check this?
> > > > > >  
> > > > > > > If I am missing out on something and we should not be removing this check,
> > > > > > > then I suggest placing the new heuristics below this block so that it doesn't
> > > > > > > interfere with the existing logic.
> > > > > > > 
> > > > > > > Please let me know which path should I go about and then I shall resend
> > > > > > > the patch with the modified commit message.
> > > > > > > 
> > > > > > 
> > > > > > Think about the strengths and weaknesses of the potential solutions, then 
> > > > > > show with some commands (as I did for example, for finding the first 
> > > > > > lines previously) that you can show that it practically makes a 
> > > > > > difference and you can numbers on those differences.
> > > > > > 
> > > > > > When you did that, send a new patch.
> > > > > > 
> > > > > > Lukas
> > > > > > 
> > > > > Sir,
> > > > > 
> > > > > I ran the evaluation as:
> > > > > 
> > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> > > > > #!/bin/bash
> > > > > 
> > > > > for file in $(git ls-files)
> > > > > do
> > > > >         permissions="$(stat -c "%a %n" $file)"
> > > > >         echo "$permissions"
> > > > > done
> > > > > 
> > > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^[7531] > temp
> > > > > 
> > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executables
> > > > > 
> > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> > > > > #!/bin/bash
> > > > > file="executables"
> > > > > while IFS= read -r line
> > > > > do
> > > > >         firstline=`head -n 1 $line`
> > > > >         printf '%s:%s\n' "$firstline" "$line"
> > > > > done <"$file"
> > > > > 
> > > > > mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> > > > > 611
> > > > > 
> > > > > mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | wc -l
> > > > > head: error reading 'scripts/dtc/include-prefixes/arc': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/arm': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/arm64': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/c6x': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/dt-bindings': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/h8300': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/microblaze': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/mips': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/nios2': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/openrisc': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/powerpc': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/sh': Is a directory
> > > > > head: error reading 'scripts/dtc/include-prefixes/xtensa': Is a directory
> > > > > 540
> > > > > 
> > > > > We can see that there are 71 files where the executable bit is set but
> > > > > the first line is not a shebang. These include 13 directories which
> > > > > throw the error above. Remaining 58 files(earlier the number was 53)
> > > > > could be cleaned so that this heuristic works better as we saw. So, by
> > > > > checking only for the executable bit we can say that license should be
> > > > > on second line, we probably don't need to check for the shebang on line
> > > > > 1.
> > > > > Please let me know if the evaluation makes sense.
> > > > >
> > > 
> > > This evaluation makes sense to find the cases that should be cleaned up.
> > > 
> > > Either the executable flag is simply set wrongly and should be dropped or 
> > > it is actually a script and should get a shebang in the beginning.
> > > 
> > > I actually already started cleaning up. See:
> > > 
> > > https://lore.kernel.org/lkml/20200819081808.26796-1-lukas.bulwahn@gmail.com/
> > > 
> > > We can discuss how to continue this cleanup.
> > >
> > 
> > I had another look at the results of your script.
> > 
> > Just a minor improvement to that resulting list:
> > 
> > I think symbolic links in the repository are always of permission 777, and 
> > I think that is reasonable.
> > 
> > So maybe you can filter out the symbolic links in your get_permissions.sh?
> > 
> > Then, the list is probably down to a few 20 to 30 cases that should 
> > probably really be cleaned up.
> > 
> > Can you share that script and the results? Then, let us start cleaning 
> > up.
> 
> Sir,
> 
> Here is what I ran:
> 
> mrinalpandey@mrinalpandey:~/linux/linux$ cat get_permissions.sh
> #!/bin/bash
> 
> for file in $(git ls-files)
> do
> 	permissions="$(stat -c '%a %n' $file)"
> 	details="$(ls -l $file)"
> 	echo "$permissions $details"
> done
> mrinalpandey@mrinalpandey:~/linux/linux$ sh get_permissions.sh | grep ^[7531] | grep -v "\->" > temp
> mrinalpandey@mrinalpandey:~/linux/linux$ cut -d ' ' -f 2 temp > executables
> mrinalpandey@mrinalpandey:~/linux/linux$ cat executables | wc -l
> 574
> mrinalpandey@mrinalpandey:~/linux/linux$ cat first_line.sh
> #!/bin/bash
> file="executables"
> while IFS= read -r line
> do
> 	firstline=`head -n 1 $line`
> 	printf '%s:%s\n' "$firstline" "$line"
> done <"$file"
> mrinalpandey@mrinalpandey:~/linux/linux$ sh first_line.sh | grep ^#! | wc -l
> 539
> 
> Hence, there are only 35 cases to be cleaned up.
>

Can you share those 35 cases you identified?

Then, we can discuss the individual changes for those 35 cases.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
