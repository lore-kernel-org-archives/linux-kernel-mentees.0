Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFAFC3062E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 14:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3508761556;
	Thu, 17 Aug 2023 14:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3508761556
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3D1BJw0T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q82L0JERNO6l; Thu, 17 Aug 2023 14:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C6C7061562;
	Thu, 17 Aug 2023 14:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6C7061562
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6E91C0039;
	Thu, 17 Aug 2023 14:52:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ED20C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 14:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3A641EA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 14:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3A641EA1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3D1BJw0T
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9aVOtshYwZX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 14:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F7BD41E8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 14:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7BD41E8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=wYEcyK46K6KN9IIi0RnZeATO9I6pLm4XjX5dQ7B0Nws=; b=3D1BJw0TbO+uh99t4IPtzRJYVV
 PkVR5R8XjKuFSvfoUrZxbUfdehUeELlZHQOG6lN1uJMfLngnfLswZ0n144vNIWwCfppUd6Bn1wBna
 ufjHuFM3vU/FkHA/3skCuXnzUFNjXpZsPJvN+V75G1k3fAkMIQvjm/Rc5HGiEcidZkrOSrPRYm1ke
 crOexaePXayA81TG+qVn4g+ocK4vqGp5Pr3OBkyz1YZniI0Ajuyo5KsQk9Awrt5g0fJV5pQyjCUqj
 ErKBzSV6W15nnIPEL6YPA/ieDeTp41UmOEiRfP2CRTioeWXO6sbhpS3yy27cX+OZo5NhA5k66zmuj
 a1bicnfA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qWeLs-006bSc-2I; Thu, 17 Aug 2023 14:51:56 +0000
Message-ID: <79ac6ee9-247a-c3da-c0f7-8c26bd0b1ad0@infradead.org>
Date: Thu, 17 Aug 2023 07:51:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] scsi: sli4: Remove the buggy code
Content-Language: en-US
To: Dmitry Bogdanov <d.bogdanov@yadro.com>, coolrrsh@gmail.com
References: <20230817103751.16350-1-coolrrsh@gmail.com>
 <20230817105252.GA14370@yadro.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230817105252.GA14370@yadro.com>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com,
 james.smart@broadcom.com, linux-kernel@vger.kernel.org,
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



On 8/17/23 03:52, Dmitry Bogdanov wrote:
> On Thu, Aug 17, 2023 at 04:07:51PM +0530, coolrrsh@gmail.com wrote:
>>
>> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>>
>> In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions
>> evaluates the same expression and gives same output. Also the variable
>> bls->local_n_port_id_dword is not used anywhere. Therefore removing the
>> redundant code.
>>
>> This fixes coccinelle warning such as:
>> drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
>> condition with no effect (if == else)
>>
>> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
>> ---
>> v1->v2
>> Modified patch and verified with checkpatch.pl.
>>
>> ---
>>  drivers/scsi/elx/libefc_sli/sli4.c | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/libefc_sli/sli4.c
>> index 8f96049f62dd..af661b769464 100644
>> --- a/drivers/scsi/elx/libefc_sli/sli4.c
>> +++ b/drivers/scsi/elx/libefc_sli/sli4.c
>> @@ -2317,13 +2317,6 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *buf,
>>                 SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
>>                 bls->context_tag = cpu_to_le16(params->vpi);
>>
>> -               if (params->s_id != U32_MAX)
>> -                       bls->local_n_port_id_dword |=
>> -                               cpu_to_le32(params->s_id & 0x00ffffff);
>> -               else
>> -                       bls->local_n_port_id_dword |=
>> -                               cpu_to_le32(params->s_id & 0x00ffffff);
>> -
> 
> omg, it is not an unused variable. Whole bls is a HW descriptor, all of
> its variables are used by HW. You should keep v1 version of the patch.
> According to the comment at the beginning of the funciton s_id here shall
> be != U32_MAX. That is an explanation for your v1 patch.
> 

Thanks for your comments.

>>                 dw_ridflags = (dw_ridflags & ~SLI4_BLS_RSP_RID) |
>>                                (params->d_id & SLI4_BLS_RSP_RID);
>>
>> --
>> 2.25.1
>>

-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
