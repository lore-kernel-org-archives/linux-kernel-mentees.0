Return-Path: <SRS0=cFAU=NV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417DDC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Aug 2021 21:04:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F3F60FD9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Aug 2021 21:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5F3F60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A245760B4F;
	Mon, 30 Aug 2021 21:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_K1vfnUp2-D; Mon, 30 Aug 2021 21:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BB75E605D4;
	Mon, 30 Aug 2021 21:04:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96E79C001A;
	Mon, 30 Aug 2021 21:04:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D10D0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 21:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA3E4402C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 21:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ND6d6kQNTicy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 21:04:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D265402BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 21:04:15 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u1so5500009plq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DR2Bm1R7YKSILao3MIz9gdsriioL6L4Hdgm+Hq95yfk=;
 b=ah+4CA5h+kOwFd9qrEibSKfYAPfYPA83e3z19xKkl0kEPGZHX9BjvNNIlNCmuCTkXX
 OmMkgnLYCbXJFPMl/uNwnZ7tGJd9XFnyVK5rD+PPYOjgk9EhpGul2WjEs/kNX+h2CQix
 bDevhwEQZAchriHqTe8K2o7x4pbEeMPBILP1vLOOSXFb8wGKzXjRJHqqB591CppFPJpS
 7k7ACVFs9omrP3aTjkTx3K4LwCNocbanA6eC7hRPlw0/8xD6o2t3uJnBfKBeXbGJ1cEL
 JvjGWRXh76BC39zDasi/DXiNmZwP/TCyXDbjekiUeEikZJrcl1u3AKpJbERDh9fuopj6
 /92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DR2Bm1R7YKSILao3MIz9gdsriioL6L4Hdgm+Hq95yfk=;
 b=Bja8gYyMJ5R16Yaqg+0x+xg9w9uuz1juSHS0GeweuOnzYR/Ch8wzEu23gRXd7hSwIE
 5+Cf1oOBdDx+F9X/UwwaxTL0HantTqS0TmkSuiYrkpwBooOw157yt0petTa1SFXt82hw
 pYJc0M1WtV/G4eEbMxBCTh9ay1wvJIgIQUKGnaXNCsdn1ohqC9+3Kkg2nE9EfjetIltw
 9Kqw3c7KEcuVjTHlcSHkg1bPmkifTXAgA4Tyr8uG+a3IW/53ZK4RGRUi6F5Xmrfer0s+
 z9XXXQ+nmLuH88XiAgtiksWA4hutL56Esu7+GI7OxS2/3W9bdIROPvuuEWZ59iHXD9u4
 Qdhw==
X-Gm-Message-State: AOAM531k+l+Yn4ZTAFxgxWCLBcuPwtkqOYjVqGmMBkqtJUIIsJEkUsiE
 SHGjhjgrrzoeHHxjwxEsBC8=
X-Google-Smtp-Source: ABdhPJyRz3j8yhGjQruBYt5HogHLyYwlaJCVaG/s7Dn3Fl+divZ4zxqIxw55Rs0lx0A5X/d1yV/xyQ==
X-Received: by 2002:a17:902:9682:b0:138:e2f9:720d with SMTP id
 n2-20020a170902968200b00138e2f9720dmr1366038plp.57.1630357454505; 
 Mon, 30 Aug 2021 14:04:14 -0700 (PDT)
Received: from [10.80.16.166] ([103.137.210.137])
 by smtp.gmail.com with ESMTPSA id w4sm362753pjj.15.2021.08.30.14.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:04:13 -0700 (PDT)
Subject: Re: [PATCH v8 3/7] drm: lock drm_global_mutex earlier in the ioctl
 handler
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-4-desmondcheongzx@gmail.com>
 <YSdltHVQnIr+vkTn@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <c9e08f10-035f-63dd-698c-faa93c935cd6@gmail.com>
Date: Tue, 31 Aug 2021 05:04:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSdltHVQnIr+vkTn@phenom.ffwll.local>
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

On 26/8/21 5:58 pm, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 10:01:18AM +0800, Desmond Cheong Zhi Xi wrote:
>> In a future patch, a read lock on drm_device.master_rwsem is
>> held in the ioctl handler before the check for ioctl
>> permissions. However, this inverts the lock hierarchy of
>> drm_global_mutex --> master_rwsem.
>>
>> To avoid this, we do some prep work to grab the drm_global_mutex
>> before checking for ioctl permissions.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index d25713b09b80..158629d88319 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -772,19 +772,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>>   	if (drm_dev_is_unplugged(dev))
>>   		return -ENODEV;
>>   
>> +	/* Enforce sane locking for modern driver ioctls. */
>> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
> 
> Maybe have a local bool locked_ioctl for this so it's extremely clear it's
> the same condition in both?
> 
> Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 

Thanks for the suggestion and review. Sounds good, I'll update and send 
out a new version.

(Sorry for delays, been busy with moving)

>> +		mutex_lock(&drm_global_mutex);
>> +
>>   	retcode = drm_ioctl_permit(flags, file_priv);
>>   	if (unlikely(retcode))
>> -		return retcode;
>> +		goto out;
>>   
>> -	/* Enforce sane locking for modern driver ioctls. */
>> -	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
>> -	    (flags & DRM_UNLOCKED))
>> -		retcode = func(dev, kdata, file_priv);
>> -	else {
>> -		mutex_lock(&drm_global_mutex);
>> -		retcode = func(dev, kdata, file_priv);
>> +	retcode = func(dev, kdata, file_priv);
>> +
>> +out:
>> +	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
>>   		mutex_unlock(&drm_global_mutex);
>> -	}
>>   	return retcode;
>>   }
>>   EXPORT_SYMBOL(drm_ioctl_kernel);
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
