Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90657C10F19
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 19:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 189FC83404;
	Wed, 16 Aug 2023 19:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 189FC83404
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XC9AV8RD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mObS4D63yd4Y; Wed, 16 Aug 2023 19:36:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0E12683403;
	Wed, 16 Aug 2023 19:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E12683403
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC0C4C0072;
	Wed, 16 Aug 2023 19:36:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51F80C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2676C6136A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2676C6136A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XC9AV8RD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJZMULoXKU41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B24FB6131C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 19:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24FB6131C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=2EGYLJQaPR1NXrPNObCs2DqcDBIJjR1YHbvOU+64Xqo=; b=XC9AV8RD/fx9oQa7BAGuxKKIcd
 IWwTZgE7qo35FOZjk3/7if+FSrSlAwg63eYLK/XRutn6wKDgFYCD8zx46cLpchLSplKyqAOGo++c5
 rY74GUGM27gtGK7Cj0/JlcMYjSZ176v04akHCjQUKpOU+/t98Q8sonS2Fg+Ipbot4zFfzK31OXYR8
 tSA6hsblTzXflhaKRxClOzmO+NctLN6PXh7MF3xFbSWX9WPmmX2MTO7VvhZQpDvcIq/gecfuh0LeY
 jRyNeeSa/RUv7QshGULIoQItpSmyt7YCAxkW3ytVuTEkXlqCLvPgOFwTyvPs5wGrHFk3to4TXID1M
 n4lpsTaA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qWMJ7-004tWe-1P; Wed, 16 Aug 2023 19:35:53 +0000
Message-ID: <38158855-5738-16a9-2237-34980917566b@infradead.org>
Date: Wed, 16 Aug 2023 12:35:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] scsi: sli4: Remove code duplication
Content-Language: en-US
To: coolrrsh@gmail.com, james.smart@broadcom.com, ram.vegesna@broadcom.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230816085007.10591-1-coolrrsh@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230816085007.10591-1-coolrrsh@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Hi--

On 8/16/23 01:50, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions 
> evaluates the same expression and gives same output. So removing the redundant 
> code duplication to optimise the code.
> 
> This fixes warning such as:
> drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible condition with no effect (if == else)

What tool produces this message?

> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
>  drivers/scsi/elx/libefc_sli/sli4.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/libefc_sli/sli4.c
> index 8f96049f62dd..5e7fb110bc3f 100644
> --- a/drivers/scsi/elx/libefc_sli/sli4.c
> +++ b/drivers/scsi/elx/libefc_sli/sli4.c
> @@ -2317,12 +2317,8 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *buf,
>  		SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
>  		bls->context_tag = cpu_to_le16(params->vpi);
>  
> -		if (params->s_id != U32_MAX)
> -			bls->local_n_port_id_dword |=
> -				cpu_to_le32(params->s_id & 0x00ffffff);
> -		else
> -			bls->local_n_port_id_dword |=
> -				cpu_to_le32(params->s_id & 0x00ffffff);
> +		bls->local_n_port_id_dword |=
> +			cpu_to_le32(params->s_id & 0x00ffffff);

That could be correct. Or there could be a bug there.
Who knows? I don't.

But maybe it doesn't matter since AFAICT that field isn't used
anywhere after it is set.

>  
>  		dw_ridflags = (dw_ridflags & ~SLI4_BLS_RSP_RID) |
>  			       (params->d_id & SLI4_BLS_RSP_RID);

-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
