Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3F9CE79D7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Sep 2023 14:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BDF80F6C;
	Wed, 20 Sep 2023 14:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98BDF80F6C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lRepN4p7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aat8Ag2RgkG7; Wed, 20 Sep 2023 14:29:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 74C5880E39;
	Wed, 20 Sep 2023 14:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C5880E39
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 451F1C0039;
	Wed, 20 Sep 2023 14:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 552A3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 14:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 223E780EAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 14:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 223E780EAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBjc1J7k8NFP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 14:29:52 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B4480E39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 14:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23B4480E39
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50317080342so5715851e87.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695220190; x=1695824990;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ysWSXqnK8OeEpLhbUCktYsznOSRQAjBgSh+YG4ngKDI=;
 b=lRepN4p773vvU4cDP+4+Knkjc9MVQAxTU3JsqQBeaiYrBAMNPmhWa9bZDqa6odTIm6
 aDtTb9GF0NJbjtuImsfShshVtvJy6COHl3YeKhDDDYpuaB1hCh2maiLfTSz12AkikfUL
 t0AaK2dUwKX5kRrzo6Pl5f7ZcmeVFcvAF+O11pL4haENa4binZtt+oc/BNOiN+XjuJT6
 atRgdyj3XZDK8mdzPBGJ/KlVcKf+VbrQ6WM/1EBcJVLh6U0bbAcFCVpXDq7IJo80fEMm
 3wln6bdR+nRqxxRBIc29iFcYtuFxZ0lNeuEWdqePHc8Vn75d5Cvt/llRvfc+G9iY8Fnc
 UmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695220190; x=1695824990;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ysWSXqnK8OeEpLhbUCktYsznOSRQAjBgSh+YG4ngKDI=;
 b=TSgj/TfCyEm+dYluO35GiMSO6v3z63IFbecUFUsCBuh6trONm9T7OlpAR23e4HaaEv
 WgjnqhO7qbwsIcmuARVJEy7Gr6iDY9wKfoUwz746HYbiBptFYfbzg0Pf4bQXaiv26gfI
 lkFIHd4/HkaHpEN7N6OPPqE5PZkHDzuPNcFd6U/wXtrRinKkyf81UP/q+aV1tdh0g5QI
 /oVAOidwof2b7C9+Bw8nKhnJbwqeNFbjJhL0DyborIqk+b6s9yGCz1tkGCcLeMxtDhMC
 OjIc0yV2tn5dtcMaSiY6IePgxfYuQaFawc9JuOLkGnPm2WG3w6XtBSY2PNdky/Pwe1Cq
 JNnQ==
X-Gm-Message-State: AOJu0Yyc9NRVG+tjXy5n7I3pblB+soT7ywjL7sDekri5BUQaal8ojHQK
 jjKz/pekyMmy6lGKcrg9NJM=
X-Google-Smtp-Source: AGHT+IF4292rSmWZUTEL97qdL/H5LRRTmvg/tMETf2isHSAXVL8Pq0PSKunSu55P6aWx1bPL8l1Jzg==
X-Received: by 2002:a05:6512:445:b0:503:3707:66ed with SMTP id
 y5-20020a056512044500b00503370766edmr2230433lfk.34.1695220189426; 
 Wed, 20 Sep 2023 07:29:49 -0700 (PDT)
Received: from akanner-r14. ([91.245.138.112])
 by smtp.gmail.com with ESMTPSA id
 j14-20020ac2550e000000b004fe2de20d88sm2670935lfk.232.2023.09.20.07.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:29:48 -0700 (PDT)
Message-ID: <650b01dc.c20a0220.51a00.8920@mx.google.com>
X-Google-Original-Message-ID: <ZQsB2U4QnumsxlIY@akanner-r14.>
Date: Wed, 20 Sep 2023 17:29:45 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com
Subject: Re: [PATCH] checkpatch: stop complaining about tags suggested/tested
 by syzkaller
References: <20230829123446.3455193-1-andrew.kanner@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829123446.3455193-1-andrew.kanner@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

On Tue, Aug 29, 2023 at 02:34:47PM +0200, Andrew Kanner wrote:
> If you submit a testing request to syzkaller it may reply with:
> 
>  syzbot has tested the proposed patch and the reproducer did not \
>  trigger any issue:
> 
>  Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com
> 
> Checkpatch is ok with Reported-by tags, but complains about
> Reported-and-tested-by tags:
> 
>  WARNING: Possible unwrapped commit description (prefer a maximum 75 \
>  chars per line)
>  #48:
>  Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com
> 
> Adding the new tag to signature_tags removes this warning.
> 
> Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
> ---
>  scripts/checkpatch.pl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index a9841148cde2..f85dcfb098e0 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -615,6 +615,7 @@ our $signature_tags = qr{(?xi:
>  	Tested-by:|
>  	Reviewed-by:|
>  	Reported-by:|
> +	Reported-and-tested-by:|
>  	Suggested-by:|
>  	To:|
>  	Cc:
> @@ -709,7 +710,7 @@ sub find_standard_signature {
>  	my ($sign_off) = @_;
>  	my @standard_signature_tags = (
>  		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
> -		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
> +		'Reviewed-by:', 'Reported-by:', 'Reported-and-tested-by:', 'Suggested-by:'
>  	);
>  	foreach my $signature (@standard_signature_tags) {
>  		return $signature if (get_edit_distance($sign_off, $signature) <= 2);
> -- 
> 2.39.3
> 

Kindly reminder.
Please let me know if there're any objections.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
