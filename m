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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1DDC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 06:13:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 443D520578
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 06:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKR0dZtN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 443D520578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A0F6878A1;
	Sun, 26 Jul 2020 06:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hcgmh6E-q-E; Sun, 26 Jul 2020 06:13:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 449668764A;
	Sun, 26 Jul 2020 06:13:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E220C004D;
	Sun, 26 Jul 2020 06:13:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3D64C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBCDF860F0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slW3JETCeSHC
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:13:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7059860EA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 06:13:07 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id l4so13813370ejd.13
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=WrmnnzzFUCwKysOojQ6Fae6qpdeMsU7kE0jqllLhniE=;
 b=CKR0dZtNUTfHN2CamY7Jt/xxIxChepnQ5eobwpE+8gLAfgF18UQCjAk99BSty5e4AU
 uS/m/Vgj1otO1Em/Q6ofTrmp2nvD8lwAxKwC9M/LPaFJQOqVwC0eH+fM5JPoCr2mvKlV
 zZX+ZArRgX+SXhr2f/t0HPvIZ3x/82YncWYw1raUZDZEiPjniidZbZFvNlDea3me8NPA
 XcAL42AOwr4xbSyldnmkpKueLTyE0DKU7Ve/IykgZET0RkqwoRakcdqiXecmbmIQamBv
 Y4lPaFz6JCrUkr73/TgEWTJiOlA9Vl847/fHbb6MyONXgjZKxvUdqdr+9trJbSIFoE8B
 zu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=WrmnnzzFUCwKysOojQ6Fae6qpdeMsU7kE0jqllLhniE=;
 b=VaeWeG18Qz8lUXXMemTs0RazOzL+CEObAodFTbv8trCvFqdyh+nfjLoJgXkwVn6fmM
 PazmAR3+CUAPEDtMbgTB8KcpFdC9hTHdGYOHOUMi+IBPMOZ9G1Zp8O2D3WPPN29q9Coj
 Bq3VttkLnT1sSWseLZN9SGFLH8Ez12GzF02VVr3okWnuNjKL8NcOxXXXwDXU6LzTRvIi
 pRH1ZYypePe6kgXQJPxHr+0LO0EiN/8zcVi/Jg4Owo1Eq5+Q+9VdT537jTPnuR6bRHWH
 vtlkgXtcu9BwZuw5PjKoOnD1ylkoHoMdJRaKjULI7Au3L3VDQBV2Eo4z+oDQzhqiZmWT
 gUhg==
X-Gm-Message-State: AOAM530NMtmyNpaM2mhsmQ3OF7SlUncD7YIFjBnGIY0UFBHWpyqlC209
 6OoHWIIt+wnIHBEzI7SmuQM=
X-Google-Smtp-Source: ABdhPJyS56z22XBNrsxDYzJe6ZFTk9zujoCKC9whmeZGrhXc0rG9yobsR9GaKgutxrGuUwuhJ1A7XQ==
X-Received: by 2002:a17:906:841:: with SMTP id
 f1mr14356752ejd.158.1595743986208; 
 Sat, 25 Jul 2020 23:13:06 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:7800:e9bf:bff0:c68e:55b7])
 by smtp.gmail.com with ESMTPSA id b24sm4806438edn.33.2020.07.25.23.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 23:13:05 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 26 Jul 2020 08:12:57 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007260759440.7525@felia>
References: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Sat, 25 Jul 2020, Mrinal Pandey wrote:

> In all the script files(except yaml), SPDX license identifier is expected

Why do believe a yaml file is a script file? Where did you read that?

To me, this reads like:

All fish(except zebras) live in water...

I think you can just drop that note on yaml.

> on the second line, the first line being the shebang. Sometimes, the
> diff content includes the SPDX licensing information but excludes the
> shebang when a commit is made to a script file.
> 

You can be more explicit here. Sometimes? You can exactly say when and how 
that happens.

> This can be seen in the commits like commit 37f8173dd849 ("locking/atomics:
> Flip fallbacks and instrumentation") and commit 075c8aa79d54 ("selftests:
> forwarding: tc_actions.sh: add matchall mirror test"). In these cases
> checkpatch issues a false positive warning:
> "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> 
> I noticed this false positive, while running checkpatch on the set of
> commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> This false positive exists in checkpatch since commit a8da38a9cf0e
> ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> when the corresponding rule was first added.
> 
> The existing logic looks for a shebang in the patch/file being checked
> and if a shebang is encountered it directs checkpatch to expect
> license on the second line by setting `$checklicenseline` to `2`.
>

You can drop those `quotes` around variable names and numbers.

This can be written shorter:
Currently, if checkpatch find a shebang in line 1, it expects the 
license identifier in line 2 instead of line 1.
 
> However, this approach doesn't work when we don't have a shebang in the
> patch and `$checklicensline` continues to be `1` in this case leading to
> the unnecessary warning.
> 

However, this only works when both line 1 and 2 are part of the patch.
 
> Fix this by setting `$checklicenseline` to `2` by checking if the patch
> comes from a script for the cases when the shebang doesn't appear in the
> patch.
>

You are not really fixing it. You are improving the heuristics.

So:

Reduce the false warnings for such patches on scripts, by checking file 
extension.

Alternatively, you could actually also check the file permissions of the 
file.



Improve the patch; if it looks good then, it could be suitable for the 
larger discussion on lkml.

Lukas

> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..80dfa83ed0fb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3167,7 +3167,7 @@ sub process {
>  
>  # check for using SPDX license tag at beginning of files
>  		if ($realline == $checklicenseline) {
> -			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> +			if ($rawline =~ /^[ \+]\s*\#\!\s*\// || $realfile =~ /.*\.\(py\|sh\|pl\|awk\|tc\)/) {
>  				$checklicenseline = 2;
>  			} elsif ($rawline =~ /^\+/) {
>  				my $comment = "";
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
