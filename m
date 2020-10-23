Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EAFC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 19:06:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFBC920BED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 19:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKjrg/BT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFBC920BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5619387214;
	Fri, 23 Oct 2020 19:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74pqJQxAKpMP; Fri, 23 Oct 2020 19:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF17287210;
	Fri, 23 Oct 2020 19:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC671C088B;
	Fri, 23 Oct 2020 19:06:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44D0FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 40C0987210
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0sONLrcRf9G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:06:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29B078720E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 19:06:52 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id h24so3784903ejg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4lS64+CIkEXj0LI534exHK/L2eCN1aE6oeDWK6Q60TI=;
 b=bKjrg/BTwofBH/U3Uv+J7Fsgz6uorca/VrAa5Mmdp2kymvGZfjwOi5DsGKDPyXGK2R
 mXJJTX8sY19YgaUZ1mXyQSyKZY2F7+SrzKuJQ1IFBMHRg/gnMf0k48m+V/NKlneH82jP
 Y8y9R+sACYF/624oYn7ImAMQGzUhyh0QT2MMzCYG4MyEd3TZPyTY9RDY8QSKJ3sfCw0Y
 JzuTxBEdpku8AKFAUk7dd495kwl2vpCg6+ondDuiBUkb50MkaqrP6lSjoODyllfovro7
 gNOwaDbJNYfpmbU464Wf5R7K/jKvG4oIVbvP6og3HXgMHBAP46hSe+6BTcB14xIeiwUd
 WX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4lS64+CIkEXj0LI534exHK/L2eCN1aE6oeDWK6Q60TI=;
 b=Q8a+loHkrisDNIKB8PRD5A2ZSiqcZfXD61U7OL1baiE0C1RIrmeRsGhnjlY2VtUlBY
 bo3/bIacNDeR6hmaxEakXxeAs8sBgKaC4eQBdsn4gc/DqCkyAjwR+EzKEiFabTOmgmYR
 2rmYboQF1JGKO74BTcO1Ae/lcYJflHd86ByKLvOhVdnP0wp275V6TdcU6N1dKt5wHJf2
 pUM5oHG9epRMd65vTggbOr0ECbPMn7rL/23MuXzy6saGpbU/jqoZVVfWFx6ApBMpepCC
 DV/6A8DX6/CqlnJqm0gKCLsOLRcTMnU4TxdKUUmov6vaCTrpXKWGmB60HA+nz5l2Aud4
 seww==
X-Gm-Message-State: AOAM530Z/BoQlYtoMFDouHKFxNylRyWzW0oNbbjihVIyHtaSGkYcLML8
 LXDpW5yPZyvcX7p4W/lVyAQ=
X-Google-Smtp-Source: ABdhPJyH46ldAtfaD69Y5dJ+HhF0gNO8fnQ+urFkvH2ShhjpNuCPcbDEiydLlTxNe5I6XxbLFob0xA==
X-Received: by 2002:a17:906:1bea:: with SMTP id
 t10mr3345016ejg.305.1603480010286; 
 Fri, 23 Oct 2020 12:06:50 -0700 (PDT)
Received: from felia ([2001:16b8:2d20:a600:91f0:3b46:85c0:ebc7])
 by smtp.gmail.com with ESMTPSA id q3sm1176478edv.17.2020.10.23.12.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 12:06:49 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 23 Oct 2020 21:06:42 +0200 (CEST)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201023133828.19609-1-yashsri421@gmail.com>
Message-ID: <alpine.DEB.2.21.2010232104150.11676@felia>
References: <20201023133828.19609-1-yashsri421@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false
 positives in REPEATED_WORD warning
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



On Fri, 23 Oct 2020, Aditya Srivastava wrote:

> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> 
> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> 
> Similarly, the presence of list command output in commit results in
> an unnecessary warning.
> 
> For example, running checkpatch on commit 899e5ffbf246 ("perf record:
> Introduce --switch-output-event") gives:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'root'
>   dr-xr-x---. 12 root root    4096 Apr 27 17:46 ..
> 
> Here, it reports 'ff' and 'root to be repeated, but it is in fact part
> of some address or code, where it has to be repeated.
> 
> In these cases, the intent of the warning to find stylistic issues in
> commit messages is not met and the warning is just completely wrong in
> this case.
> 
> To avoid these warnings, add additional regex check for the
> directory permission pattern and avoid checking the line for this
> class of warning. Similarly, to avoid hex pattern, check if the word
> consists of hex symbols and skip this warning if it is not among the
> common english words formed using hex letters.
> 
> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 907.
> 
> A quick manual check found all cases are related to hex output or
> list command outputs in commit messages.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

I think this strategy now makes sense and has the right complexity for a 
good heuristics in this case.

Nice job, Aditya.

Are you ready for a next challenge of this kind? Would you like to work on 
further rules that can be improved with your evaluation approach?

Lukas

> ---
>  scripts/checkpatch.pl | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9b9ffd876e8a..3bd8205c48d8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3051,7 +3051,9 @@ sub process {
>  		}
>  
>  # check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +				$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
>  			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>  
>  				my $first = $1;
> @@ -3065,6 +3067,17 @@ sub process {
>  				next if ($first ne $second);
>  				next if ($first eq 'long');
>  
> +				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +				my @non_hex_words = (
> +					"add", "added", "ace", "aced", "bad", "be", "bed", "bead",
> +					"beaded", "bedded", "cab", "cabbed", "cede", "ceded",
> +					"dead", "deaf", "deb", "decade", "deed", "deface", "defaced", "efface",
> +					"effaced", "face", "faced", "fade", "faded", "fed", "fee", "feed"
> +				);
> +				if ($first =~ /\b[0-9a-f]{2,}\b/) {
> +					next if (!grep(/^$first$/, @non_hex_words));
> +				}
> +
>  				if (WARN("REPEATED_WORD",
>  					 "Possible repeated word: '$first'\n" . $herecurr) &&
>  				    $fix) {
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
