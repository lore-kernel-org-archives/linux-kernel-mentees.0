Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C11C3DA62
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 17:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D830F83FBA;
	Thu, 17 Aug 2023 17:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D830F83FBA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UxZbWIN6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjRKNQqHZ8EX; Thu, 17 Aug 2023 17:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DC3C68400F;
	Thu, 17 Aug 2023 17:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3C68400F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC8C8C0071;
	Thu, 17 Aug 2023 17:24:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE817C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0CB48400F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CB48400F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGyoW12h9-aE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FA4783FBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA4783FBA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=98fxoirN/Zj64QlVogFrB6MtraBkkeO+8jNX/wKR4lk=; b=UxZbWIN6QcKSi5/fZfyfAq/rss
 iICZBGvgGctNr3gWm225M02ZqixctF3bQ06Of0YuvvHt3W4JgONL/aqYsOEVZxZLaL7D9BK4N3Hxb
 jpKQDpquTsu4Qcbtij1IOq6nWFjpI/CfBHZv94tH2SGOFDM7klb1Lh3rwvpKNIVo5kaiStDFkTL9l
 t+t09+gBSaKLXy2O+skNYHIxX5fpD80+IwILLfLvl8C0mxfwfY7P3Cswgsc+Bc5nAIB5FCRn1PGNl
 0hJbmDkwVQVYxvEBaI4BKb4mzV3lDgK8l+pDVXvK9oB0KotiZc44o02FRit9PGf9zn9PTf1vbjxW1
 XLxAtZrA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qWgjB-006saa-1M; Thu, 17 Aug 2023 17:24:09 +0000
Message-ID: <f33e4fad-6ee0-4892-6eae-0d1308f1166e@infradead.org>
Date: Thu, 17 Aug 2023 10:24:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] scsi: sli4: Remove code duplication
Content-Language: en-US
To: coolrrsh@gmail.com, james.smart@broadcom.com, ram.vegesna@broadcom.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230817114301.17601-1-coolrrsh@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230817114301.17601-1-coolrrsh@gmail.com>
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



On 8/17/23 04:43, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions
> evaluates the same expression and gives same output. Also, params->s_id
> shall not be equal to U32_MAX. Therefore removing the unused code.
> 
> This fixes coccinelle warning such as:

Thanks for that. ^^^^^

> drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
> condition with no effect (if == else)
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

Based on feedback from Broadcom people,
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> v1->v2
> Modified patch and the corrected the warnings using checkpatch.
> v2->v3
> Modified patch details keeping HW descriptor variable.
> 
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
>  
>  		dw_ridflags = (dw_ridflags & ~SLI4_BLS_RSP_RID) |
>  			       (params->d_id & SLI4_BLS_RSP_RID);

-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
