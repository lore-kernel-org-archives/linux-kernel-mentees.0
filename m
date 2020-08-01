Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEB1C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 06:04:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F3220723
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 06:04:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSakfaz8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F3220723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8353B2033E;
	Sat,  1 Aug 2020 06:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhzviRDB0fXP; Sat,  1 Aug 2020 06:04:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 22F3E20133;
	Sat,  1 Aug 2020 06:04:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B779C004F;
	Sat,  1 Aug 2020 06:04:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 916D2C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 06:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7996F886A4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 06:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAwBmbtYn3ze
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 06:04:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 516D9886A0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 06:04:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v22so12984174edy.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=5OQzTjVUccvdD/yUAvk5OGbaYqa4+jirqSkgo+1+qE4=;
 b=OSakfaz8RJYKWXn1B8FL4PRFQR6Z//3EpS6ci4mSGR29gUvxxgqf1+OgDg6Y8ZQvhQ
 0Md/AwJ6JTlPXHZiRJ8I878nUWHh8P95t7dDkBw6gCLev+vVxhJnuFeQD2cDDKU88Jqo
 wzHbCAUt8APr4FEz8tnc/3qA/h4DAhU0tnisCE8xEMz3Xf9OLJpG5iMijfJ1Iv/3oFHu
 wvGa7Dmu7s/osffxuqkJlFjagP1JChaTZ3kyAnLUv/UEgiCqver0mqBmKkPpvlf6FMye
 jPwFthHQogNA7LAbrkNvdJGL3gXkl+jDHh8rJdolCrrGpPukIylg/787S1yi3UL9LjNW
 o60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=5OQzTjVUccvdD/yUAvk5OGbaYqa4+jirqSkgo+1+qE4=;
 b=dtEi6JGLoTkYtia4kOH2lF2jw13UU6bCW8Fi8H5fimEhMvzaSRQt9K+edXPpkyQoFe
 Dohi/M5Nsdccalm8WADM5g6DidRrkygAT8fOKbQ2lAlyKG2LOfMWFUNE3B9YuoMZrp2I
 Mo06a6rX7IWAR3rINy42f3Ey+6t0Vik8yFe4MZ0Vl6w3+yLL5GBkAUNoDtxw9df96e76
 VzIFGLKnaThoIuJSW3jeYxTxJe0untve1xIluvdEYsThZXwtAVLZ9RfXZ7Td9dRdkzsS
 Ww4vg2CEmwexipZ1uOO6ui6jkCSSLVasjs198IdilYykH+4uyWIwO6lCGmSmSbdjkfOt
 nDqQ==
X-Gm-Message-State: AOAM532ESLb0euBvpqpBkPQg7ZTJHUST17JGmLR24kZxz1MqJRnhcRbc
 JbWlJkPN/9ldHr8buWS1DGs=
X-Google-Smtp-Source: ABdhPJwY4qdS8KRNYP3WNa5yUn7NbIm2kcLmSebDLEWyMrgvenxJ2kWLNlKwPslIolG3zBob1UvwQg==
X-Received: by 2002:a05:6402:3135:: with SMTP id
 dd21mr7351040edb.123.1596261864554; 
 Fri, 31 Jul 2020 23:04:24 -0700 (PDT)
Received: from felia ([2001:16b8:2de0:f200:fc5f:beaa:3a90:ee66])
 by smtp.gmail.com with ESMTPSA id z9sm9683063ejj.51.2020.07.31.23.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 23:04:23 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 1 Aug 2020 08:04:17 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200730073351.xw42cgj7v6g7nxbf@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2008010740100.18967@felia>
References: <20200730073351.xw42cgj7v6g7nxbf@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Thu, 30 Jul 2020, Mrinal Pandey wrote:

> In all the script files, SPDX license identifier is expected on the second
> line, the first line being the shebang.
> 
> The diff content includes the SPDX licensing information but excludes the
> shebang when a change is made to a script file in commit 37f8173dd849
> ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> test"). In these cases checkpatch issues a false positive warning:
> "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> 
> I noticed this false positive, while running checkpatch on the set of
> commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> This false positive exists in checkpatch since commit a8da38a9cf0e
> ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> when the corresponding rule was first added.
> 
> Currently, if checkpatch finds a shebang in line 1, it expects the
> license identifier in line 2. However, this doesn't work when a shebang
> isn't found on the line 1.
>
----
> Improve this by ensuring the patch to have originated from a script by
> checking the extension. However, there are 120 files in the kernel source
> that do not have an extension but have a shebang in line 1.
>

Well, you are not doing that anymore. So the commit message is wrong.

Maybe, you simply say:

  - what is the problem?
  - what are the alternatives considered?
  - what did you evaluate on these two alternatives?
  - why did you decide the one you chose?

If you structure it that way, it is easier to follow your thoughts.

> An alternate approach is to check for permissions of the file. There are
> 53 files in kernel source that have executable flag set but don't have a
> shebang in the first line. These files could be patched suitably so that
> they don't issue false warnings. Hence, choose this approach.
>

I would not mention the potential follow-up work in this commit.
You can say that:

At first sight on these 53 files, it seems that these files have a wrong 
file permission set or could be reasonably extended with a shebang and 
license information.
Hence, further clean-up in the repository would make this heuristics work 
even more precisely.

> Reduce SPDX license false warnings on patches by checking the permissions
> on the file.
> 
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..c55595113499 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2368,6 +2368,7 @@ sub process {
>  
>  	# Trace the real file/line as we go.
>  	my $realfile = '';
> +	my $realfile_perms = '';
>  	my $realline = 0;
>  	my $realcnt = 0;
>  	my $here = '';
> @@ -2555,11 +2556,13 @@ sub process {
>  		if ($line =~ /^diff --git.*?(\S+)$/) {
>  			$realfile = $1;
>  			$realfile =~ s@^([^/]*)/@@ if (!$file);
> +			$realfile_perms = `stat -c "%a" $realfile`;

Again, this is totally wrong!

We already noted that you can only use the information provided in the 
patch file.

Is that information on file permissions provided with a patch?
Where is it provided? Find out and then parse that information.

>  			$in_commit_log = 0;
>  			$found_file = 1;
>  		} elsif ($line =~ /^\+\+\+\s+(\S+)/) {
>  			$realfile = $1;
>  			$realfile =~ s@^([^/]*)/@@ if (!$file);
> +			$realfile_perms = `stat -c "%a" $realfile`;
>  			$in_commit_log = 0;
>  
>  			$p1_prefix = $1;
> @@ -3166,6 +3169,9 @@ sub process {
>  		}
>  
>  # check for using SPDX license tag at beginning of files
> +		if ($realfile_perms =~ /[7531]\d{0,2}/) {
> +			$checklicenseline = 2;
> +		}

That check looks good. I assume you copied this expression from another 
place in checkpatch.pl.


>  		if ($realline == $checklicenseline) {
>  			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
>  				$checklicenseline = 2;
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
