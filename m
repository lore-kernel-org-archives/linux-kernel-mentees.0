Return-Path: <SRS0=1Ivo=NJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D223C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 14:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5193A610D2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Aug 2021 14:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5193A610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA1D80C9E;
	Wed, 18 Aug 2021 14:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdktjNm94Qsv; Wed, 18 Aug 2021 14:50:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 387D780B92;
	Wed, 18 Aug 2021 14:50:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C2DBC0010;
	Wed, 18 Aug 2021 14:50:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 855DCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65ABB40217
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tR_Bfk_zpvAI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADB50401FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 14:50:09 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id o10so2013064plg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6Uh8FBGFVJ1JdTCeddx1mUTf33ZOu2+YFROQAiC4wXw=;
 b=FvxDgvbsWlWgiHHfo1cKELhnM2uSeTuVKkYL2a8NcwGFJLwbeRWzgzRHZ8LWuG5NXb
 VBDbxFm+4D48ZsM+JzqFGDXsR8/MRg7RcLNCTLAb/qRBj0LrTjF+EoGTNZ/5UDl0VIDs
 yi4RDyhBIfbtt4V0QSVU8m8PekoGAmb/y6FaL5QMxUynMoAF/3DGPMkYnvRX6SgglbFZ
 mawgbJD1NySe74n5M2h+iekGuME65Y14JCyXEVYJd5jWsZfD64RfyzT5lmyWIQiHuHpx
 6qgGkSn19WksDxegdxPDTs/Iv798MUgIt59ehxFNZZl8bO57ZUqixbljydZbbWhvJK47
 ZaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Uh8FBGFVJ1JdTCeddx1mUTf33ZOu2+YFROQAiC4wXw=;
 b=CAL7dZX1JN7YV0pEeA6azI2saL0/RohUL53oYJmSYmhEhVeDzBEtMeNi3m/iiCMO/K
 S1p7ITrubUR5cGeCzS1U2Cn4WbqAg2eb2h0is0fxbw7RvcJXzTIWznjST4tYP378t4eQ
 eOg4+f63o/YW/ccXBoDBXQ+k9//MwtItbjm+IajMeJKcyNuHkfoyr9i+pXTkJgr74fRv
 7V6ZOi1LTcPUnBX4i6Z9nb9u0bH+DZlUwjvXR8h8+WxvdU5MEsb/0ALLmgVG2L/DPmBz
 qzqIjwPuNnNih3aht1ofLVWdZMo/R39RKXkVfugYzyOhdflbgmnExgzh95fUeSe0wHfO
 j+Qg==
X-Gm-Message-State: AOAM530I6oShhCGdFm3gjRRtaemBn4wk6pcP4ePcGIRc0HwnBZLMlmFL
 UdVeZ9wkGVGp20zNV/kVsKuyAR65YIbjLx9wjTM=
X-Google-Smtp-Source: ABdhPJwK6zZDS5MxiSPQQly8zibq21bpqwtpHyPoIGe12pbxG6FIcKasukxZTM8/HiLQS9uS1RYPEQ==
X-Received: by 2002:a17:90b:3784:: with SMTP id
 mz4mr9897189pjb.127.1629298208817; 
 Wed, 18 Aug 2021 07:50:08 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 64sm6780126pfy.114.2021.08.18.07.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 07:50:08 -0700 (PDT)
Subject: Re: [PATCH v3 2/9] drm: hold master_lookup_lock when releasing a
 drm_file's master
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-3-desmondcheongzx@gmail.com>
 <YRzbTUM8ggXlIEyr@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <a69a6870-18fe-5bbc-074e-871753a8f593@gmail.com>
Date: Wed, 18 Aug 2021 22:50:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRzbTUM8ggXlIEyr@phenom.ffwll.local>
Content-Language: en-US
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

On 18/8/21 6:05 pm, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 03:38:17PM +0800, Desmond Cheong Zhi Xi wrote:
>> When drm_file.master changes value, the corresponding
>> drm_device.master_lookup_lock should be held.
>>
>> In drm_master_release, a call to drm_master_put sets the
>> file_priv->master to NULL, so we protect this section with
>> drm_device.master_lookup_lock.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> At this points all refcounts to drm_file have disappeared, so yeah this is
> a lockless access, but also no one can observe it anymore. See also next
> patch.
> 
> Hence I think the current code is fine.
> -Daniel
> 

Ah ok got it, I didn't realize that. I'll drop patch 2 and 3 from the 
series then.

>> ---
>>   drivers/gpu/drm/drm_auth.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 8efb58aa7d95..8c0e0dba1611 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -373,8 +373,11 @@ void drm_master_release(struct drm_file *file_priv)
>>   	}
>>   
>>   	/* drop the master reference held by the file priv */
>> -	if (file_priv->master)
>> +	if (file_priv->master) {
>> +		spin_lock(&dev->master_lookup_lock);
>>   		drm_master_put(&file_priv->master);
>> +		spin_unlock(&dev->master_lookup_lock);
>> +	}
>>   	mutex_unlock(&dev->master_mutex);
>>   }
>>   
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
