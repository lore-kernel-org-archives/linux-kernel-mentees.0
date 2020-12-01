Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51283C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 09:01:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DE921D7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 09:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUAsJLvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DE921D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5846874EA;
	Tue,  1 Dec 2020 09:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6BGtsATpmva; Tue,  1 Dec 2020 09:01:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F100A87491;
	Tue,  1 Dec 2020 09:01:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D335BC1833;
	Tue,  1 Dec 2020 09:01:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABFF0C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 09:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9590986B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 09:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gY8LHujGItog
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 09:00:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA93F86AFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 09:00:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w6so698802pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dtttE07kNWaAOBgcwpwZ7/6/q0Zz9I8UpIk1LsMYL/w=;
 b=hUAsJLvJw027+KhveP7eNb8OO14trIyoxMVXIgF2IkzuzmLFjJy7V8y3gXLbNSWfbO
 YjBlMDw8fGPk4gBBPw5+DLemDIk0kHeLO0ShBu6QfOhBHruP50wmteQggh5Gg8BdKGwv
 7530EcN8bvXdKqTq+cS/eYwKaQ6Cie8POfx+YPf2NfPfSmJG+/BK5TofR+difRJn0/gw
 tP919ubYV6ltmP1nbOHZ6kWqt3XayNkS0VBCZyayiEiqPkwBkFLgf2977oCNlFVmMScc
 tadA+pZdz0sKcOmundjWoCRxRpuEFXvxeQ7V5BFqPQFo9ivhOjEQNMfAF9xJUuFxwA9U
 rqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dtttE07kNWaAOBgcwpwZ7/6/q0Zz9I8UpIk1LsMYL/w=;
 b=jydeDhc21VTOddCzjhEIGM07oBca+v/X4okDU1HXY9Mr/i9ntft6zapfHFWwUt310q
 tN7cLlYihB6pVvU19GQ/rwl+YoNqNHTpQ2ew6FNsh1n9/f/85hYvcoZNvzrZHmsX4zwc
 mAsMIfxwCRTcywWgyhogDTXEjIWuKDQAKSn04C2mvNk4tAHiZGwnj7bnVm9izsGa4wIG
 8ekA6SKdllizNHvtqMPg3e/myupTa21uuYPjBt0HQSfqTciB6t1zWKoW5sD3Tm+v9AYb
 MasdxiE2K/nWsv4Uccr6eKomSpaZh2DoN2fNh6q0YAG/Mmka39ZVcr6CWjLxXYFSE6jP
 ZU5A==
X-Gm-Message-State: AOAM532xUj1nZu38RIBetJHSU4pfLx9XFLK+07aM6NH9qdru6sVvqBYJ
 AOnM2nKv898tqJN69uhizzFlC19++bxAGg==
X-Google-Smtp-Source: ABdhPJz93qcyxz5mz9XzJXbyEi7i6JmzpDPUo7Ypd5IUmgnfcBcyalCk9f8IS1qAgVmQkzSr23NNEw==
X-Received: by 2002:aa7:9e90:0:b029:18b:a94:3498 with SMTP id
 p16-20020aa79e900000b029018b0a943498mr1628553pfq.54.1606813257874; 
 Tue, 01 Dec 2020 01:00:57 -0800 (PST)
Received: from ?IPv6:2402:3a80:42a:f496:5078:6ca4:d183:62ef?
 ([2402:3a80:42a:f496:5078:6ca4:d183:62ef])
 by smtp.gmail.com with ESMTPSA id x4sm1586663pgg.94.2020.12.01.01.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 01:00:57 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201129081447.15041-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <50d28187-d6ea-2f82-29fb-1f0027d0bf72@gmail.com>
Date: Tue, 1 Dec 2020 14:30:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201129081447.15041-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On 29/11/20 1:44 pm, Aditya Srivastava wrote:
> Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> styles.
> 
> This warning occurs because of incorrect use of signature tags,
> e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> signature tags, which may seem correct, but are not standard:
> 
> 1) Requested-by (count: 48) => Suggested-by
> Rationale: In an open-source project, there are no 'requests', just
> 'suggestions' to convince a maintainer to accept your patch
> 
> 2) Co-authored-by (count: 43) => Co-developed-by
> Rationale: Co-developed-by and Co-authored-by are synonyms
> 
> 3) Analyzed-by (count: 22) / Analysed-by (count: 5) => Co-developed-by
> Rationale: Analyzing is a part of Software Development, so
> 'Co-developed-by' is perfectly fine, even if contributor did not create
> code
> 
> 4) Improvements-by (count: 19) => Co-developed-by
> 
> 5) Noticed-by (count: 11) => Reported-by
> 
> 6) Inspired-by (count: 11) => Suggested-by
> 
> 7) Verified-by (count: 8) => Tested-by
> Rationale: Used by a single user. On reading mailing list, it seems
> Tested-by might be a suitable alternative
> 
> 8) Okay-ished-by (count: 8) => Acked-by
> Rationale: Used by a single user. On reading mailing list, it seems
> Acked-by must be suitable alternative
> 
> 9) Acked-for-MFD-by (count: 6) => Acked-by
> 
> 10) Reviewed-off-by (count: 5) => Reviewed-by
> 
> 11) Proposed-by (count: 5) => Suggested-by
> Rationale: On observing the mailing list, this tag is always used for a
> maintainer. It seems that the changes might have been suggested by them
> and the tag is used as acknowledgment for the same
> 
> 12) Fixed-by (count: 3) => Co-developed-by
> Rationale: Fixing bug is a part of Software Development, so
> 'Co-developed-by' is perfectly fine, even if contributor did not create
> code
> 
> 13) Pointed-out-by (count: 3) / Pointed-at-by (count: 2) => Suggested-by
> Rationale: The tags are used for maintainers. It seems that the changes
> might have been suggested by them and the tag is used as acknowledgment
> for the same
> E.g., Pointed-at-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> 14) Suggestions-by (count: 3) => Suggested-by
> 
> Provide a fix by replacing the non-standard signature with its standard
> equivalent.
> 
> Also, improve warning messages correspondingly, providing suitable
> rationale to the user for the suggestion made.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> applies on next-20201120 and my last patch at Link: https://lore.kernel.org/linux-kernel-mentees/db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com/T/#u
> 
> changes in v2: replace commit specific example with brief evaluation
> 
> changes in v3: provide rationale to users for every signature tag suggestion;
> modify commit message describing arrival to conclusion in a structured way
> 
> changes in v4: modify rationale for certain suggestions
> 
> changes in v5: remove the tag deletion suggestions, ie "Generated-by" and "Celebrated-by"; rebase on last accepted changes; modify commit message
> 
>  scripts/checkpatch.pl | 73 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4a026926139f..d0c2f189272f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -563,6 +563,72 @@ sub find_standard_signature {
>  
>  	return "";
>  }
> +our %standard_signature_fix = (
> +	"Requested-by:" => {
> +		suggestion => "Suggested-by:",
> +		rationale => "In an open-source project, there are no 'requests', just 'suggestions' to convince a maintainer to accept your patch",
> +	},
> +	"Co-authored-by:" => {
> +		suggestion => "Co-developed-by:",
> +		rationale => "Co-developed-by is the standard signature tag to attribute multiple authors for a patch",
> +	},
> +	"Analyzed-by:" => {
> +		suggestion => "Co-developed-by:",
> +		rationale => "Analyzing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +	},
> +	"Analysed-by:" => {
> +		suggestion => "Co-developed-by:",
> +		rationale => "Analysing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +	},
> +	"Improvements-by:" => {
> +		suggestion => "Co-developed-by:",
> +		rationale => "Performing improvements are a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +	},
> +	"Noticed-by:" => {
> +		suggestion => "Reported-by:",
> +		rationale => "Reported-by is the standard signature tag for acknowledging user who noticed or reported any bug(s)",
> +	},
> +	"Inspired-by:" => {
> +		suggestion => "Suggested-by:",
> +		rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> +	},
> +	"Verified-by:" => {
> +		suggestion => "Tested-by:",
> +		rationale => "Tested-by is the standard signature tag to attribute user for verifying/testing the patch",
> +	},
> +	"Okay-ished-by:" => {
> +		suggestion => "Acked-by:",
> +		rationale => "Acked-by is the standard signature tag for recording one's approval",
> +	},
> +	"Acked-for-MFD-by:" => {
> +		suggestion => "Acked-by:",
> +		rationale => "Acked-by is the standard signature tag for recording one's approval",
> +	},
> +	"Reviewed-off-by:" => {
> +		suggestion => "Reviewed-by:",
> +		rationale => "Reviewed-by is the standard signature tag to indicate that the patch has been reviewed",
> +	},
> +	"Proposed-by:" => {
> +		suggestion => "Suggested-by:",
> +		rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> +	},
> +	"Fixed-by:" => {
> +		suggestion => "Co-developed-by:",
> +		rationale => "Fixing bug is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
> +	},
> +	"Pointed-out-by:" => {
> +		suggestion => "Suggested-by:",
> +		rationale => "Pointing out certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> +	},
> +	"Pointed-at-by:" => {
> +		suggestion => "Suggested-by:",
> +		rationale => "Pointing at certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
> +	},
> +	"Suggestions-by:" => {
> +		suggestion => "Suggested-by:",
> +		rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
> +	},
> +);
>  
>  our @typeListMisordered = (
>  	qr{char\s+(?:un)?signed},
> @@ -2832,12 +2898,17 @@ sub process {
>  
>  			if ($sign_off !~ /$signature_tags/) {
>  				my $suggested_signature = find_standard_signature($sign_off);
> +				my $rationale = "";
> +				if (exists($standard_signature_fix{$sign_off})) {
> +					$suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
> +					$rationale = $standard_signature_fix{$sign_off}{'rationale'};
> +				}
>  				if ($suggested_signature eq "") {
>  					WARN("BAD_SIGN_OFF",
>  					     "Non-standard signature: $sign_off\n" . $herecurr);
>  				} else {
>  					if (WARN("BAD_SIGN_OFF",
> -						 "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'?\n" . $herecurr) &&
> +						 "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'? $rationale\n" . $herecurr) &&
>  					    $fix) {
>  						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
>  					}
> 

Hi Lukas
You probably missed this patch. Actually I wanted to get a quick
feedback from you before sending it to Joe again.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
