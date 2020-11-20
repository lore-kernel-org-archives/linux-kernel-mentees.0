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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A23C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 10:16:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31573222BA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 10:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8JuLWpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31573222BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9272087543;
	Fri, 20 Nov 2020 10:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTVlGB6FxrVH; Fri, 20 Nov 2020 10:16:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E56587506;
	Fri, 20 Nov 2020 10:16:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2446AC163C;
	Fri, 20 Nov 2020 10:16:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2311C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D788B87535
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XheMEa8wfrb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:16:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 63C8487506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 10:16:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v12so7391536pfm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DakeA0oWU6fdPDE/lty3j4pqe+xZItAm23Dcv5UK9Ow=;
 b=V8JuLWpgWgi55pQCsu3amjMlIYSfX2e0Z7V3xi6FdCAak0duvJsykdTD2amnx6tpo7
 SvsOl7tv9xzLgE3Spq/XGIUhDMMjRwB6Tsz3VbDpcTQ5+c2MawZ9EVJOOdSlJqZO+vCq
 WEjGAM4UCwCHAPMcp24WlqXY0VFJraKEemuBpNgrI39eKUpDhvkDcOvQ9k1eojkpdJFh
 +dVjOBfsrpKkuCo0Y2MWZoHwE7vkRFFQkzG7IrnpXY7UhuAIgZIyfaZD3XWRrsFgN6kJ
 jqDwueFgQlvQWz9eFTndSXxVB2iT6kui/odBp7FMyS796EQiodbYC2E2XBWW0lFDdR8H
 vhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DakeA0oWU6fdPDE/lty3j4pqe+xZItAm23Dcv5UK9Ow=;
 b=YkemP6pnT0gORGvD42KWQyc/Bo+VytOCU+YIFfUsb3FwIutq3MFiielOGFsTKrBVSn
 qdlSMWpi75ad6kbnLmxL2iJUVu0H3QYSWay75LY1zpU+dWaYAz/+yqRDWalVFH7gymtT
 PnfbjG4WubTmHeHgkpUmMuC22A3plTjIv9bDn1ssVgrD8wXrNBa5Pqiqq02JSx6hkwsc
 J/WYtuk7zOdc8UtotfuewELmty4DGuOzbTOCr2e4NlFyGMBjbsIM0j36ySN4ZzS3mn/c
 8E+/+e9/JebsGQ5/THOKOnV6aFeIDJTN6U8uJi6UGq2JUSQ6sKMUAHaJOfZfcHGoKS2M
 XlUw==
X-Gm-Message-State: AOAM532Uf5ES4J8OR/vUP3HWv9OBrF3wJlCrvESdkS7vw+hbhfJkpjLd
 kHb0KxC1Y7rHsNEd/eL4IPK/BOjhQ3IFaw==
X-Google-Smtp-Source: ABdhPJzKpEFQgmlF5+jbcxryN+Fnbp76BITqMvt5rn2gj7M3ZQVeTnreJBivMrGy+xl16AXcbUFNSw==
X-Received: by 2002:aa7:854d:0:b029:197:9168:80fb with SMTP id
 y13-20020aa7854d0000b0290197916880fbmr10079603pfn.38.1605867385613; 
 Fri, 20 Nov 2020 02:16:25 -0800 (PST)
Received: from ?IPv6:2402:3a80:40a:513c:8f5:b466:78ec:c186?
 ([2402:3a80:40a:513c:8f5:b466:78ec:c186])
 by smtp.gmail.com with ESMTPSA id u85sm3250997pfc.124.2020.11.20.02.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:16:25 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
 <20201120101254.17712-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <88ca7da2-9204-e061-7b67-1128a16a7852@gmail.com>
Date: Fri, 20 Nov 2020 15:46:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120101254.17712-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: MAINTAINERS: add
 information about parse-maintainers.pl
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

On 20/11/20 3:42 pm, Aditya Srivastava wrote:
> parse-maintainers.pl is a script which can be used to automatically
> order the contents of MAINTAINERS file in preferred order (i.e.
> 'MRLSWQBCPTFXNK').
> 
> But currently we don't have a documentation on it.
> 
> Add documentation regarding the same in MAINTAINERS file.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> the patch applies perfectly on latest next-20201119
> 
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5db753fa1295..7ad00af7acd4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -136,6 +136,9 @@ Descriptions of section entries and preferred order
>  	      printk, pr_info or pr_err
>  	   One regex pattern per line.  Multiple K: lines acceptable.
>  
> +This order can be generated automatically for you using
> +``scripts/parse-maintainers.pl``.
> +
>  Maintainers List
>  ----------------
>  
> 

Rationale for my changes:
I did not go into much detail of its working here.
A bit detail on this can be to use 'scripts/parse-maintainers
--sorted' which produces the sorted file in MAINTAINERS.new by
default. The input and output default files can be changed using
'--input' and '--output' options. However, here I have omitted these
details as running with '--help' option already provides this
information in detail.
So just making user aware of the script should serve our purpose.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
