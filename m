Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D7AC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 08:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5EF9603E9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 08:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5EF9603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A797A414B7;
	Fri, 30 Jul 2021 08:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdFCz6n-Fa84; Fri, 30 Jul 2021 08:06:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C78E340664;
	Fri, 30 Jul 2021 08:06:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FA5BC001A;
	Fri, 30 Jul 2021 08:06:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 198A1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 08:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF4A5832C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 08:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-v7spmLPvbU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 08:06:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6597B83216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 08:06:51 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id l19so14119073pjz.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zm9ze6NcDMmKTtzUJRmbUQg85ybXUDcN1daZdih1WjE=;
 b=onZBHEQbJavX+A5KRaetjgjzUwDmd3WCx9N9tbq25vGwq8nGrSKPYOUZvsmHEyOmWZ
 M+OOTZh5N2bVPdOJKKUW0J6lyGyB/gqr98pG3kRWp6HVtXZtkS3klXocUCX+WCWIt8oD
 +6eXSNqMZPOHcBKpetSx0mhW+ZpAp4LEt9PFIRVm/NHWfWJXAsy73etXU6K85KQHqWLb
 JaycqPhwfCq4En3t7KTHKtpBJWWDjmhnH8ugeLZwoW4SCKMBPDZWv3g69zS2Txoyi3z0
 /ajIPha64CrownvM58gbSPAOQ7kcQVbDTAw8K5AVvnznWduE+XeeQTiQbAed6jWcke8j
 jweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zm9ze6NcDMmKTtzUJRmbUQg85ybXUDcN1daZdih1WjE=;
 b=oPU/REICLvG4bk4gfd1cOKZzwbBivVvoOlO84+qSn47Z/+F+l+tXxg4c4xyXlDMEYR
 ij8A6px6Bu5LnZ7CR4VqN05VnAlK8ju+xaSmxliEn8OASLoVA/q2mLWU6MtyMIaj2Yw7
 jFRGloLIoDqYs28YX9oIph+1Jo9+7IkrizuCE0WJqcJTqJPvFGCVv7v6MddE0HgYEmyr
 xpzKrYHqWw76YVIfYxVCnvD+cnTQUOVtY46KIUa/JaHA+yW/P6t1SE3msATtImDcef+8
 YWzyYrV83KtcOSW4IQo0M64g4q9wq/2muRgo471R3BxaY/e/8i6s4cSOAIdPhZyp0kH3
 iRgA==
X-Gm-Message-State: AOAM530r82uVGllDYUVHLLIPUQwMI+68AwtLGIYQ9AZzMAyc6WibUdAK
 /x7SzwgdTw2+AN3JrYSyx9POZn2/uYpXacmTnbM=
X-Google-Smtp-Source: ABdhPJyjRArgqkf3xuf3FtJ1loWdS7BbIoDktTv4OVnTPGAPLzlWFDLZqp+Y+Y7pidu7lZiihP0LDQ==
X-Received: by 2002:a63:5506:: with SMTP id j6mr1211210pgb.19.1627632410498;
 Fri, 30 Jul 2021 01:06:50 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id e8sm1295050pfm.218.2021.07.30.01.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 01:06:49 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
To: Boqun Feng <boqun.feng@gmail.com>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
 <20210730041515.1430237-3-desmondcheongzx@gmail.com>
 <YQOXTW8kSHdNjhiY@boqun-archlinux>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <35518f4b-5e4a-b284-1f86-5cba64941211@gmail.com>
Date: Fri, 30 Jul 2021 16:06:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQOXTW8kSHdNjhiY@boqun-archlinux>
Content-Language: en-US
Cc: tzimmermann@suse.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, peterz@infradead.org,
 mingo@redhat.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 longman@redhat.com, will@kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 30/7/21 2:08 pm, Boqun Feng wrote:
> On Fri, Jul 30, 2021 at 12:15:15PM +0800, Desmond Cheong Zhi Xi wrote:
>> In drm_is_current_master_locked, accessing drm_file.master should be
>> protected by either drm_file.master_lookup_lock or
>> drm_device.master_mutex. This was previously awkward to assert with
>> lockdep.
>>
>> Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
>> helpers"), this assertion is now convenient so we add it in.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 9c24b8cc8e36..6f4d7ff23c80 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -63,9 +63,9 @@
>>   
>>   static bool drm_is_current_master_locked(struct drm_file *fpriv)
>>   {
>> -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
>> -	 * should be held here.
>> -	 */
>> +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
>> +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
>> +
> 
> I think it's better to also add the lockdep_assert() of & (i.e. both
> held) in the updater side, and have comments pointing to each other.
> 
> Is it convenient to do in this patchset? If the updater side doesn't
> need to put the lockdep_assert() (maybe the lock acquire code and the
> update code are in the same function), it's still better to add some

Thanks for the feedback, Boqun.

Yeah, I think the updater side maybe doesn't need new lockdep_assert()
because what currently happens is either

	lockdep_assert_held_once(&dev->master_mutex);
	/* 6 lines of prep */
	spin_lock(&fpriv->master_lookup_lock);
	fpriv->master = new_value;
or
	mutex_lock(&dev->master_mutex);
	/* 3 lines of checks */
		spin_lock(&file_priv->master_lookup_lock);
		file_priv->master = new_value;

> comments like:
> 
> 	/*
> 	 * To update drm_file.master, both drm_file.master_lookup_lock
> 	 * and drm_device.master_mutex are needed, therefore holding
> 	 * either of them is safe and enough for the read side.
> 	 */
> 
> Just feel it's better to explain the lock design either in the
> lockdep_assert() or comments.
> 

But clarifying the lock design in the documentation sounds like a really
good idea.

Probably a good place for this would be in the kerneldoc where we also
explain the lifetime rules and usage of the pointer outside drm_auth.c:

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 726cfe0ff5f5..a3acb7ac3550 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -233,6 +233,10 @@ struct drm_file {
  	 * this only matches &drm_device.master if the master is the currently
  	 * active one.
  	 *
+	 * To update @master, both &drm_device.master_mutex and
+	 * @master_lookup_lock need to be held, therefore holding either of
+	 * them is safe and enough for the read side.
+	 *
  	 * When dereferencing this pointer, either hold struct
  	 * &drm_device.master_mutex for the duration of the pointer's use, or
  	 * use drm_file_get_master() if struct &drm_device.master_mutex is not

Best wishes,
Desmond

> Regards,
> Boqun
> 
>>   	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>>   }
>>   
>> -- 
>> 2.25.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
