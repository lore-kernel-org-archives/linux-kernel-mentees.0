Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D3AECAAD1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Aug 2022 12:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7289582EF0;
	Wed, 31 Aug 2022 12:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7289582EF0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aEaUiZbB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0s6D0y_1QZ1c; Wed, 31 Aug 2022 12:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8786982ED1;
	Wed, 31 Aug 2022 12:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8786982ED1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C990C0033;
	Wed, 31 Aug 2022 12:02:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF03C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1AF882ED1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 12:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AF882ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3pedWYoQcLG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 12:02:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8F682EA5
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F8F682EA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 12:02:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so14746291pjg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=eRbKItI3AZhVvsC86qxXWb/4uz2oQCgmwoWLMJsb7bs=;
 b=aEaUiZbBL3nk9VM+21DWCPPZgDS3s2+8btGMtGjrqc0FEjYXnJxi6cSlN07QXAldvJ
 8c36bVI7E7TQQrvlGQvQAIcNIFkKQv1aWR/3VD4XspDYvWQDvBcFfkBCdOnxe033cZmR
 x+P5U08z+h7sS/rJnYiXrEyDKeNsI8El5vo7l5XvzRU2K0d9JR54xlR2iyfqr3d2qEpu
 jZp6SECjrob07TcOeEFz7BfwOgfwbdEshNk5ZHA2zcm9yAjpwb849xfJVvZF/9Pk2RB+
 jbZxaVMnyC1jrFRPyo5zg/V39ugsVnQpe6hXLTju00ol29oB2yrdO7zDsrnVOfnQ+0vf
 VRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=eRbKItI3AZhVvsC86qxXWb/4uz2oQCgmwoWLMJsb7bs=;
 b=s0BTpJdKiaW+ePQPqDrqrmSy/kTJVtDFCfWueLQvb+vsxjFLoHm2sW2R7vhUWbBPfY
 65fW0P6gneMVABdQH0BWsH5HZkeXE15vrrF8wO8iL7HEx8qrsJutwYgk89h0YePwtiWi
 C005VPBSaRmBkAW/warE+Y9C+vlG88wJvrohEds31KorvUwEcWFc3OMrxdYRlpSm2jt3
 4o7mR76JNU8h0DocwBfcYwE84O21amzd0U8Xn6uDVu1APs8PhYecGnRKx2XepwfbCplg
 19p+e8xnXsp2eIWo0hJJPzmRqrWwtEViZnOwI35T4KZ5qXCS0kKA1lW3/eEMybPdK2oa
 HTOQ==
X-Gm-Message-State: ACgBeo0gxXDa9utOdGbj1bUT7caskeA8wEf6yQrXdMvNExuMF4VyIO67
 wRq5G7XooJnS+e2bENQFE98=
X-Google-Smtp-Source: AA6agR5AGbwB0CETQbgBGxEfglVui+utWA4TxrvKZPB7PL0Bz2yipS4fqz5X9Aq8TvcpVQ86SsOGzA==
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id
 mh12-20020a17090b4acc00b001f57f0512e8mr2910177pjb.92.1661947321614; 
 Wed, 31 Aug 2022 05:02:01 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.140])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090aac1300b001fbbbe38387sm1156380pjq.10.2022.08.31.05.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 05:02:01 -0700 (PDT)
Message-ID: <7768a8f1-fcc6-50da-e5a5-7e2cef619459@gmail.com>
Date: Wed, 31 Aug 2022 18:01:54 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xfrm: Don't increase scratch users if allocation fails
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <00000000000092839d0581fd74ad@google.com>
 <20220831014126.6708-1-khalid.masum.92@gmail.com>
 <Yw8mUVCdov6l3Cun@gondor.apana.org.au>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <Yw8mUVCdov6l3Cun@gondor.apana.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 8/31/22 15:13, Herbert Xu wrote:
> On Wed, Aug 31, 2022 at 07:41:26AM +0600, Khalid Masum wrote:
>> ipcomp_alloc_scratches() routine increases ipcomp_scratch_users count
>> even if it fails to allocate memory. Therefore, ipcomp_free_scratches()
>> routine, when triggered, tries to vfree() non existent percpu
>> ipcomp_scratches.
>>
>> To fix this breakage, do not increase scratch users count if
>> ipcomp_alloc_scratches() fails to allocate scratches.
>>
>> Reported-and-tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
>> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>> ---
>>   net/xfrm/xfrm_ipcomp.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
>> index cb40ff0ff28d..af9097983139 100644
>> --- a/net/xfrm/xfrm_ipcomp.c
>> +++ b/net/xfrm/xfrm_ipcomp.c
>> @@ -210,13 +210,15 @@ static void * __percpu *ipcomp_alloc_scratches(void)
>>   	void * __percpu *scratches;
>>   	int i;
>>   
>> -	if (ipcomp_scratch_users++)
>> +	if (ipcomp_scratch_users) {
>> +		ipcomp_scratch_users++;
>>   		return ipcomp_scratches;
>> -
>> +	}
>>   	scratches = alloc_percpu(void *);
>>   	if (!scratches)
>>   		return NULL;
>>   
>> +	ipcomp_scratch_users++;
>>   	ipcomp_scratches = scratches;
> 
> This patch is broken because on error we will always call
> ipcomp_free_scratches which frees any partially allocated memory
> and restores ipcomp_scratch_users to zero.
> 
> With this patch ipcomp_scratch_users will turn negative on error.
> 
> Cheers,

Thanks for the review. I think it can be fixed by assigning NULL in 
ipcomp_scratches when the allocation fails as ipcomp_free_scratches
checks for it. I shall follow this email with a v2 shortly.

thanks,
   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
