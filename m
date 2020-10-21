Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB049C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:29:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F82D2225F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7YKaLps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F82D2225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B58F31FF11;
	Wed, 21 Oct 2020 15:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0BvZIyWNcOa; Wed, 21 Oct 2020 15:29:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 32F782E5B0;
	Wed, 21 Oct 2020 14:50:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 168BAC0052;
	Wed, 21 Oct 2020 14:50:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBDC0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B405E8641E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9I3ZKi4BxQd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:50:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A7AA86407
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:50:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so3368641wrp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QWXQLAbwDbPK7euoH/YoiGirni6rAZ7OzUiiheZdS5Q=;
 b=a7YKaLps4fMtmicyagqY2WdLTn7GR3VWnfXCGEzlojaScvWTvmZf3molWTfR3zTVWq
 HqJXQTSMiNSOutENEFW8xJOEVea1Ab5bGWIWAplz+0jo7QdLPTYF8ip9/E0VOB9EPI5N
 wxGMteY0i+9RHR64jlxsWLrjD+GEe4VF58557bAU+tlJOO7mDBxzXDbg85eQD+4vVJ6B
 b9DnPQXdOyYzsb1CfO2rJ1DpFpCeVZXbDMD1QMXw8iZETrAVLfQY+iYym5QjHaJ2myDK
 0D8aZjq711/JyD+1r+k0OUc2miItQbwy27PYJrKClwE5JCEbGnwGG3W6IC/sqbrqaQco
 7cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QWXQLAbwDbPK7euoH/YoiGirni6rAZ7OzUiiheZdS5Q=;
 b=NFT4vLF+B+ii/Zv+v18CiKUi9l0aoI1WR6AH6wiNoXNBggFtIWABzZdr/Vie2mPyOz
 8XtCNrWhebHIRuCqaQNXgkN2RkkqjV+85IV7Ko6g6ktedUJnwx9xLM95JB1nR05c5V5x
 EnftToYrdtexnkHiMWQ5xNjLurvtnfBpaBvtFB9hGVtRwNpteXNex7pH51b30VsiHn9p
 2ZU0ubp2Kk9yDaauaGh1MrKIKn73m3+uwozZsDAC7Cd+s8OXIky5LVSZd/2Tn2BL1Iaj
 1NIan4JbW5NZyFBtNXxmlJPElY+cDCSukc2K/nOR+3XLqt/wKx4r9ZO0gu9nG/aporVK
 s4fA==
X-Gm-Message-State: AOAM533yQOuC0uZ4jV/J6H4fslntAMTedvoUaESGTvLNXD/vBsBbJnoA
 CchTcyaOaa2Tr0VOO3/qV+Y=
X-Google-Smtp-Source: ABdhPJxASkPVgrBx20hx6++ieu28qbgHkKcTx48051NdS1ZHx6RG2n7v3w63aZfIEDB2L+K5GtFFgg==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr5538600wrn.117.1603291825871; 
 Wed, 21 Oct 2020 07:50:25 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:c428:3741:a9e9:6e3d])
 by smtp.gmail.com with ESMTPSA id c130sm8245662wma.1.2020.10.21.07.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 07:50:25 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 16:50:24 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201021144458.29614-1-yashsri421@gmail.com>
Message-ID: <alpine.DEB.2.21.2010211647500.5382@felia>
References: <20201021144458.29614-1-yashsri421@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for REPEATED_WORD warning
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



On Wed, 21 Oct 2020, Aditya Srivastava wrote:

> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> 
> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> 
> Here, it reports 'ff' to be repeated, but it is in fact part of some
> address or code, where it has to be repeated.
> In this case, the intent of the warning to find stylistic issues in
> commit messages is not met and the warning is just completely wrong in
> this case.
> 
> To avoid all such reports, add an additional regex check for a repeating
> pattern of 4 or more 2-lettered words separated by space in a line.
> 
> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 1043.
> 
> A quick manual check found all cases are related to hex output in
> commit messages.
>

Looks good to me. Send it to the general mailing list and Joe Perches to 
get more feedback and finally an Acked-by.

Merge window is currently ongoing; so, Joe probably has time, but Andrew 
Morton who picks up the patch will probably need a week or two.

Please also CC this mailing list, Dwaipayan and me.

Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9b9ffd876e8a..78aeb7a3ca3d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3050,8 +3050,10 @@ sub process {
>  			}
>  		}
>  
> -# check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# check for repeated words separated by a single space and
> +# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +		$rawline !~ /(\b[0-9a-f]{2}( )+){4,}/) {
>  			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>  
>  				my $first = $1;
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
