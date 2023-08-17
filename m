Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0095C27C7A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 11:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6150083D18;
	Thu, 17 Aug 2023 11:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6150083D18
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=Fmv5SawT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=L9Pss4wa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 886idtLWk_3o; Thu, 17 Aug 2023 11:00:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2183683D19;
	Thu, 17 Aug 2023 11:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2183683D19
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0191DC0039;
	Thu, 17 Aug 2023 11:00:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFF49C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB5483D19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB5483D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7dyNb-6myiL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:00:44 +0000 (UTC)
X-Greylist: delayed 459 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Aug 2023 11:00:43 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35B283D18
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D35B283D18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 4E341C0009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
 t=1692269574; bh=AehP888etUrm7amHfFcvQ6JX0HnlZBk7UUTpgRujN1s=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=Fmv5SawTv711CAVIx9xFXRxB7Ue6mmxK0aBMfy333sVwh1EjxK7fdxHwdN/OSsH4l
 EF17JKgSJpqoC+ASrZTUrGUoHhoJVTldV/jwD0sncSuHbiHCDpejBHH6eGudDmNdxo
 dzZRsjCMeTQaIaOqwmak/cgHg+UUMWyEOzz8uDyvcv2cehgDAvlxKC/DveHpSLLE+T
 XuQHBuwBIUBBxCdHfN89ZdboWUaJ54ry2pzaKSLKtuvFJwOucX+S1feKRF/puwCHiT
 g4Cmu3OsabcDdW7iZhzUYVYPllbH7Xl/UgCuXZ7l450qls/H6nB9neRoMED/gexM2Q
 gGA2RQOeQoQeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
 t=1692269574; bh=AehP888etUrm7amHfFcvQ6JX0HnlZBk7UUTpgRujN1s=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
 b=L9Pss4wafQgF4+j4US+bbq98ahyzt05LdL8ktiIdf3ZsrhLTD6BQRqciiBqnrO88Y
 0oDJlyNAmioKau5c6jB7sae9gc7xH6XsU7V5lol+QG1ESSh/kdoV86Z7mEY9TQv/8S
 5YFHTCnjrH79S4j3Kf02DuXIY9CmVF4c80nLnqrrKlfaropWlRxn+b17R6b/+6eyTJ
 WcMBI/91LbNyMF9RgfB4nsLrCH8IK1/U/sO1dv0F/pPG9eiAE34csMnlVMNk/4oKa4
 V80yzQad7zvJZch2B6gBTY8F13Dbht7BQo+DxdjB8sXH4urEq28sKmGw5gPkO0UKJe
 jOQtNqk2elE2g==
Date: Thu, 17 Aug 2023 13:52:52 +0300
From: Dmitry Bogdanov <d.bogdanov@yadro.com>
To: <coolrrsh@gmail.com>
Subject: Re: [PATCH v2] scsi: sli4: Remove the buggy code
Message-ID: <20230817105252.GA14370@yadro.com>
References: <20230817103751.16350-1-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817103751.16350-1-coolrrsh@gmail.com>
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com,
 rdunlap@infradead.org, james.smart@broadcom.com, linux-kernel@vger.kernel.org,
 target-devel@vger.kernel.org, ram.vegesna@broadcom.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Aug 17, 2023 at 04:07:51PM +0530, coolrrsh@gmail.com wrote:
> 
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions
> evaluates the same expression and gives same output. Also the variable
> bls->local_n_port_id_dword is not used anywhere. Therefore removing the
> redundant code.
> 
> This fixes coccinelle warning such as:
> drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
> condition with no effect (if == else)
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
> v1->v2
> Modified patch and verified with checkpatch.pl.
> 
> ---
>  drivers/scsi/elx/libefc_sli/sli4.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/libefc_sli/sli4.c
> index 8f96049f62dd..af661b769464 100644
> --- a/drivers/scsi/elx/libefc_sli/sli4.c
> +++ b/drivers/scsi/elx/libefc_sli/sli4.c
> @@ -2317,13 +2317,6 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *buf,
>                 SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
>                 bls->context_tag = cpu_to_le16(params->vpi);
> 
> -               if (params->s_id != U32_MAX)
> -                       bls->local_n_port_id_dword |=
> -                               cpu_to_le32(params->s_id & 0x00ffffff);
> -               else
> -                       bls->local_n_port_id_dword |=
> -                               cpu_to_le32(params->s_id & 0x00ffffff);
> -

omg, it is not an unused variable. Whole bls is a HW descriptor, all of
its variables are used by HW. You should keep v1 version of the patch.
According to the comment at the beginning of the funciton s_id here shall
be != U32_MAX. That is an explanation for your v1 patch.

>                 dw_ridflags = (dw_ridflags & ~SLI4_BLS_RSP_RID) |
>                                (params->d_id & SLI4_BLS_RSP_RID);
> 
> --
> 2.25.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
