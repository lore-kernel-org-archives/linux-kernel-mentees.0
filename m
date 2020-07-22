Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9846C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 10:21:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA6620729
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 10:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qigg42fP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CA6620729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36AD7886C0;
	Wed, 22 Jul 2020 10:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZIgnFJQH0QY; Wed, 22 Jul 2020 10:21:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4D0C886C6;
	Wed, 22 Jul 2020 10:21:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92AAEC004E;
	Wed, 22 Jul 2020 10:21:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E31AC004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3918088668
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjWY-xyCNeuw
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:21:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 50507886C0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 10:21:06 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id d18so1251654edv.6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kIC18AZSpAx8R7LInUe2mo7V6lp/fVDt7K+uu7leBDQ=;
 b=Qigg42fPHfOzRZ9/Gkf2Pteszo/NjsZRnp3raHt482rAn9uJhZ2jiVHvxamFZxNsqa
 Sd9tqNYrFSwEH8LOQn6SNBDJJHdCYEYgh0NuuZhL81nulyFwe/eZOS/wtxvdtJPZTuWc
 mw9AwXIZwGnrXCuuV8M9mBQ3A91PfU/5mudzOA/oMdfTLRqE3esiwumJ1fKyCOeBItvn
 fwEArNsG/rzcVu1nuxPODqJYTJkVLBE8bEueHyU6FBS+3kEG5u1ApWNH0DSRBq/Qdh09
 U9vDabtWdd9CkuM6wd5ZQfcoxNTsSXI7yCsCvOQbHcpLeBvLcA0wg7DR4hIyI2/vo1Ub
 Vqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kIC18AZSpAx8R7LInUe2mo7V6lp/fVDt7K+uu7leBDQ=;
 b=OMfdVvtr4mhjR2pLtuXPLHiMLcxlMX9kwUrCWzSCgUdfEDWOoqc+j018s45xdmgjUv
 PUBGMuSEphqbGwplwzrAujD2Jo0bgKRnYTTZnOf/CQOG5AOK4i6RzxrPmu+7qWYqLPrv
 U3lhOgvHyceUHKW0lCW3rE/N/kDWM95/nB2OzximI1ecyWLllIJsAs7rNpYw1RrPCLG0
 yCRUYqyCjubZvCtOWQad++WvhRan7iwnuFprFJ4ZncUE5L18iMziURSKYaLKTfzW2n3M
 DEj6mbranjr6I15S20SW7Ufe81RFBV++gjM7JNiQORlb8YwxImTSU+8nGJDOGP76rlsc
 60Uw==
X-Gm-Message-State: AOAM530vA6qWWgxlnXZ78ljx1koUcKmi2eI9odxtA1zYSprTKjJwzq/o
 CvRMbXb279AI0KnWUHlUhnQ=
X-Google-Smtp-Source: ABdhPJw6/FU6OhM0bdESUWXw6d6E+PfoaJ19AJuw99jTAu/yb8ajtMhxTC7cw7CyF/3ioLLULNzxFQ==
X-Received: by 2002:a50:fd84:: with SMTP id o4mr29729904edt.117.1595413264541; 
 Wed, 22 Jul 2020 03:21:04 -0700 (PDT)
Received: from felia ([2001:16b8:2d99:5b00:39e7:5cec:d6f4:a49a])
 by smtp.gmail.com with ESMTPSA id cw19sm18277123ejb.39.2020.07.22.03.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 03:21:03 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 22 Jul 2020 12:20:57 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200721054419.kab7i6l6zkioddh5@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007221207260.10005@felia>
References: <20200721054419.kab7i6l6zkioddh5@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
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



On Tue, 21 Jul 2020, Mrinal Pandey wrote:

> In all the scripts, the SPDX license should be on the second line,
> the first line being the shebang, but checkpatch issues a warning
> "Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
> scripts that have SPDX license in the second line.
>

That what you wrote is actually wrong. Checkpatch only wrongly warns if 
the first line is not included in the diff, right? Otherwise, it does not 
warn as intended.
 
> However, this warning is not issued when checkpatch is run on a file.
> The case for files has been handled gracefully by checking first line of
> the file to be a shebang and then setting `$checklicenseline` to `2`but
> this doesn't work when we don't have shebang in diff content of a patch
> and `$checklicenseline` continues to be `1` in such cases. Therefore,
> checkpatch expects the line `1` to contain the SPDX license when it
> should have been `2` instead.
>

It is described very complicated here. Maybe think about rephrasing it, so 
it becomes more clear.

> I noticed this false positive while running checkpatch on the set of
> commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
> a script file.
>

How about naming the commits and providing a statistics how often that 
happens?
 
> This false positive exists in checkpatch since commit a8da38a9cf0e
> ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> when the corresponding rule was first commited.
> 
> Fix this by setting `$checklicenseline` to `2` whenever the file or diff
> content we are checking comes from a script instead of checking first
> line to be a shebang, thus, informing checkpatch that the SPDX license
> should be expected on the second line.
>

Well, now the critical part:

It seems that this now makes the situation worse compared to before.

I quickly ran this evaluation:

$ cat first-line.sh 
#!/bin/bash

for file in $(git ls-files)
do
	firstline="$(head --silent -n 1 $file)"
	echo "$file: $firstline"
done

$ sh ./first-line.sh > first-lines

$ grep "#!" first-lines | wc -l
810

$ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | grep -v "\."

$ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | grep -v "\." | wc 
-l
120

$ grep "#!" first-lines | sed 's/^\(.*[^\]*\):.*$/\1/' | rev | cut -d"/" 
-f1 | rev | grep  "\." | cut -d"." -f2 | sort | uniq -c | sort -nr
    509 sh
     91 tc
     45 pl
     37 py
      6 awk
      1 config

So, in 120 cases you actually would now warn on line 1 where the should be
a shebang as intended.

Also, I cross-checked .yaml files:

$ grep "\.yaml:" first-lines | grep "SPDX-License-Identifier"  | wc -l
1035

$ grep "\.yaml:" first-lines | wc -l
1037


So, for yaml, SPDX is actually in line 1.


I guess you need to think about this a bit more.


> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..bdd2f9a80891 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3166,10 +3166,11 @@ sub process {
>  		}
>  
>  # check for using SPDX license tag at beginning of files
> +		if ($realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {
> +			$checklicenseline = 2;
> +		}
>  		if ($realline == $checklicenseline) {
> -			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> -				$checklicenseline = 2;
> -			} elsif ($rawline =~ /^\+/) {
> +			if ($rawline =~ /^\+/) {
>  				my $comment = "";
>  				if ($realfile =~ /\.(h|s|S)$/) {
>  					$comment = '/*';
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
