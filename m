Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979A2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 10:59:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA742064B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 10:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbpTYvVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA742064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EDBC2862A0;
	Mon,  3 Aug 2020 10:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZgh4hDhrWGa; Mon,  3 Aug 2020 10:59:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6FCE786816;
	Mon,  3 Aug 2020 10:59:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A114C0050;
	Mon,  3 Aug 2020 10:59:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA6FFC004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 10:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B6AED87A2E
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 10:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjsmKLUONRDy
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 10:59:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D9301875C2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 10:59:37 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id qc22so23352425ejb.4
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 03 Aug 2020 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=JuHSfFEy2D5hpg7dkiQdIY+1pWr35ytSHUqvj3WVil0=;
 b=MbpTYvVjx6GiG75buQIS9eQIECfNGhQB8gBuObhw5F49Gccvpqo8udNay2tdnci3tn
 QhY9Hj35sqjDAidO21TPmIjB4/RWT38rnD/5z3DI0n5XlzIlo1WJLxfHZVB3PLWiWWev
 uf8pAF37ewJbSAt7jQOl+lMyQKTl65EKohqVE0BRBWXYrSvrXtQW35RV0pyyeeMmoYzO
 A/9eLO8edCbuuFAR9rYgi6V+5iqOuYYv5sx34SnPOJ5Iq8S4KMpC0l80u5uIYTdyT2Qf
 CTrrjziJcy92kwcManknI1jHeD486F9DdwH7vuPLtbGWOIByTdIGXrzPGGeuKSLT5B5i
 kjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=JuHSfFEy2D5hpg7dkiQdIY+1pWr35ytSHUqvj3WVil0=;
 b=Wzbq1Yk36IqsTnWPeZOTQumRuYoEIO+D9iyymoH6Qfm6JO+NAAH4N41l+iZ14KTG1R
 BQAN4GUJ5byAanbLJqiNoqoNjPLe5PhgWUuorQF0Dxkef70DiigzXbJMA4GPSORVkf9S
 ioBgdaqPe20FgVVTviCtPY7lRMxgEzx4/dkvLI4aq4aux2eYCizZTlsQxgSB5FmwAjxE
 gzMr5F1QwWJ0LVx/sEv7M3dGASQUo6wZNNL+CccileU6R5q+3bOMejtcpkFWa4HsSaA4
 V/B0iqGIbzMZbKIfXfnrQ+RrapjmXGRKhgVSh+8my2HDCmPgYFXd9GHFy1ym5+8AVICE
 ItqA==
X-Gm-Message-State: AOAM532n322ic+JltcRn5H0IfaerTFF7QCJwKwtWcrIw6POQgkWs2PBi
 HXKa7Cw46SsNfyVDqes1Qwk=
X-Google-Smtp-Source: ABdhPJxEtjZ6hPFajIPtHFD2BkQjFZrJzkXoIgsh+Kcx+PX0Qyvw2AzZ0wALkdDPUMed9hJhxUugMg==
X-Received: by 2002:a17:907:20f5:: with SMTP id
 rh21mr15775026ejb.194.1596452376276; 
 Mon, 03 Aug 2020 03:59:36 -0700 (PDT)
Received: from felia ([2001:16b8:2dc4:9300:b9a0:3f92:5ce1:e11f])
 by smtp.gmail.com with ESMTPSA id g21sm9074119edm.65.2020.08.03.03.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 03:59:35 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 3 Aug 2020 12:59:33 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2008031251410.8346@felia>
References: <20200803075841.6bp4pcx3av2ow72s@mrinalpandey>
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



On Mon, 3 Aug 2020, Mrinal Pandey wrote:

> The diff content includes the SPDX licensing information but excludes the
> shebang when a change is made to a script file in commit 37f8173dd849
> ("locking/atomics: Flip fallbacks and  instrumentation") and commit
> 075c8aa79d54 ("selftests: forwarding: tc_actions.sh: add matchall mirror
> test"). In these cases checkpatch issues a false positive warning:
> "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> 
> Currently, if checkpatch finds a shebang in line 1, it expects the
> license identifier in line 2. However, this doesn't work when a shebang
> isn't found on the line 1.

It does not work when the diff does not contain line 1, but only line 2,
because then the shebang check for line 1 cannot work.

> 
> I noticed this false positive, while running checkpatch on the set of
> commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> This false positive exists in checkpatch since commit a8da38a9cf0e
> ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> when the corresponding rule was first added.
> 
> The alternatives considered to improve this check were looking the file
> to be a script by either examining the file extension or file permissions.
>

Make this sentence shorter. Try.
 
> The evaluation on former option resulted in 120 files which had a shebang
> in the first line but no file extension. This didn't look like a promising
> result and hence I dropped the idea of using this approach.
> 
> The evaluation on the latter approach shows that there are 53 files in the
> kernel which have an executable bit set but don't have a shebang in the
> first line.
> 
> At the first sight on these 53 files, it seems that they either have a
> wrong file permission set or could be reasonably extended with a shebang
> and SPDX license information. Thus, further cleanup in the repository
> would make the latter approach to work even more precisely.
> 
> Hence, I chose to check the file permissions to determine if the file is a
> script and notify checkpatch to expect SPDX on second line for such files.
>

There is no notification here. Think about better wording.
 
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
>  scripts/checkpatch.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..bae1dd824518 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3166,6 +3166,9 @@ sub process {
>  		}
>  
>  # check for using SPDX license tag at beginning of files
> +		if ($line =~ /^index\ .*\.\..*\ .*[7531]\d{0,2}$/) {
> +			$checklicenseline = 2;
> +		}

That check looks good now.

>  		if ($realline == $checklicenseline) {
>  			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
>  				$checklicenseline = 2;

This is probably broken now. It should check for shebang in line 1 and 
then set checklicenseline to line 2, right?

> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
