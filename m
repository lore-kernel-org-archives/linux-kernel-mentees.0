Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86680C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 20:03:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF71D2225B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 20:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yj50SRXw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF71D2225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 32C352E13B;
	Fri, 20 Nov 2020 20:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWbnLsu6RagR; Fri, 20 Nov 2020 20:03:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 680D42E139;
	Fri, 20 Nov 2020 20:03:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49C61C1825;
	Fri, 20 Nov 2020 20:03:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A4B1C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6F66B87363
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vg8zhOy2wXgA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:03:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC58E8735E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:03:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 131so8901217pfb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 12:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YS1pZhVi5iRr93DiECbuE2Xjt9oAMZU8Ruzyj/rUbyo=;
 b=Yj50SRXwheVDsTMgDoUwQk/pCZWQKKBuI3fy4WusBN+EHtpEtxikWkmXgLnrbuoj9A
 WCYWGli7nWCbftade63RQxrACJ0Td3199JO5JwKrN9wMBSksK3Ck8T60KgHfEFiQg4GK
 8na9xVn5RRRApoKnc6OnRjE2rlDQyYMt7faeDfyK2KpHHLz2k9MOHBmAkHRa6SkZFj/Z
 5EsN0uUzp9zJ9IBgUiX30v5QkuzYjXeCnSmywGUT5noB0XROojt6ZkbGZvWOHxheXFEj
 5aGS0vPlcQ06nPahuJkbao4TqRMKWFn2WMlONzyhvIUYjMPpaOEPCN2XupLxC4z3Kv7c
 r/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YS1pZhVi5iRr93DiECbuE2Xjt9oAMZU8Ruzyj/rUbyo=;
 b=Hm+DGK3vjNK/EX6/fGbjVZjC6wBk70OzDC6A+QnjdPpGEjrrnfb0ml9zGp9wq5yaUi
 rk7mddiLSH97sni+J0KEY9f6kMAieVXiNZIeybtAY7bmtT7wo7a2KIL25kaDjTAMG0IF
 YOuguYiE+F+fgaF0EQWA7W5Dl07W/ru6J68NHz3fep1p3Ed9lHFBdB4DeUIeRDkjZoaT
 SJHHlucHJVby0hs3ldWva64GacKEBF2LshtNcCQyv6zZHrXG4XV4etWaiWAWQctQSN3r
 K/mwtMVYS+fnjPlz5KgV9W/nVoI2W/fgpTW/4RHV8EYJBi9tNPsqEV3effujvwLY3RmQ
 AzSw==
X-Gm-Message-State: AOAM5316Jsx4+ORTSiJCyEmh1jFXBDNV/GRlpt4h1xmvnDpzDjLL8Fdn
 e4QJLlB9I4BeTgdhu/ZfiV3bd+B5jkkEYw==
X-Google-Smtp-Source: ABdhPJxGBE27gck3NiqIxHwWpfGqIKbXbYPgvHxLMPapRloY8Tl3YZbdvKXo+aD1TKlCP7oqD/zRYw==
X-Received: by 2002:a62:7596:0:b029:197:de7a:b7a7 with SMTP id
 q144-20020a6275960000b0290197de7ab7a7mr2606431pfc.74.1605902589992; 
 Fri, 20 Nov 2020 12:03:09 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:f607:e09e:f6d6:daa6:f3cd?
 ([2402:3a80:415:f607:e09e:f6d6:daa6:f3cd])
 by smtp.gmail.com with ESMTPSA id w131sm4454669pfd.14.2020.11.20.12.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 12:03:08 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <da375716-721c-e4d8-27a9-f8d576741d65@gmail.com>
 <20201120195851.23679-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <3fbf54ea-20f4-8e80-2bfd-363e9cec6619@gmail.com>
Date: Sat, 21 Nov 2020 01:33:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120195851.23679-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix and improve
 warning msg for Non-standard signature
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

On 21/11/20 1:28 am, Aditya Srivastava wrote:
> Checkpatch.pl warns on non-standard signature styles.
> 
> E.g., running checkpatch on commit 513f7f747e1c ("parisc: Fix vmap
> memory leak in ioremap()/iounmap()") reports this warning:
> 
> WARNING: Non-standard signature: Noticed-by:
> Noticed-by: Sven Schnelle <svens@stackframe.org>
> 
> Provide a fix by:
> 1) replacing the non-standard signature with its standard equivalent
> 2) removing the signature if it is not required
> 
> Also, improve warning messages correspondingly, providing users
> suggestions to either replace or remove the signature
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 45 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fdfd5ec09be6..23a21dc2c29a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -506,6 +506,27 @@ our $signature_tags = qr{(?xi:
>  	Cc:
>  )};
>  
> +our %standard_signature_fix = (
> +	"Requested-by:" => "Suggested-by:",
> +	"Co-authored-by:" => "Co-developed-by:",
> +	"Analyzed-by:" => "Co-developed-by:",
> +	"Analysed-by:" => "Co-developed-by:",
> +	"Improvements-by:" => "Co-developed-by:",
> +	"Noticed-by:" => "Reported-by:",
> +	"Inspired-by:" => "Suggested-by:",
> +	"Verified-by:" => "Tested-by:",
> +	"Okay-ished-by:" => "Acked-by:",
> +	"Acked-for-MFD-by:" => "Acked-by:",
> +	"Reviewed-off-by:" => "Reviewed-by:",
> +	"Proposed-by:" => "Suggested-by:",
> +	"Fixed-by:" => "Co-developed-by:",
> +	"Pointed-out-by:" => "Suggested-by:",
> +	"Pointed-at-by:" => "Suggested-by:",
> +	"Suggestions-by:" => "Suggested-by:",
> +	"Generated-by:" => "remove",
> +	"Celebrated-by:" => "remove",
> +);
> +
>  our @typeListMisordered = (
>  	qr{char\s+(?:un)?signed},
>  	qr{int\s+(?:(?:un)?signed\s+)?short\s},
> @@ -2773,8 +2794,28 @@ sub process {
>  			my $ucfirst_sign_off = ucfirst(lc($sign_off));
>  
>  			if ($sign_off !~ /$signature_tags/) {
> -				WARN("BAD_SIGN_OFF",
> -				     "Non-standard signature: $sign_off\n" . $herecurr);
> +				my $suggested_signature = "";
> +				if (exists($standard_signature_fix{$sign_off})) {
> +					$suggested_signature = $standard_signature_fix{$sign_off};
> +				}
> +				if ($suggested_signature eq "") {
> +					WARN("BAD_SIGN_OFF",
> +					     "Non-standard signature: $sign_off\n" . $herecurr);
> +				}
> +				elsif ($suggested_signature eq "remove") {
> +					if (WARN("BAD_SIGN_OFF",
> +						"Non-standard signature: $sign_off. Please consider removing this signature tag.\n" . $herecurr) &&
> +					$fix) {
> +						fix_delete_line($fixlinenr, $rawline);
> +					}
> +				}
> +				else {
> +					if (WARN("BAD_SIGN_OFF",
> +						"Non-standard signature: $sign_off. Please use '$suggested_signature' instead.\n" . $herecurr) &&
> +					$fix) {
> +						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
> +					}
> +				}
>  			}
>  			if (defined $space_before && $space_before ne "") {
>  				if (WARN("BAD_SIGN_OFF",
> 

Initial tests performed on patches found this fix to be working as
expected.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
