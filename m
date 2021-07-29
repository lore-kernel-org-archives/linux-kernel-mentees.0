Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBFAC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 14:32:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2B760D07
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 14:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE2B760D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA6B60669;
	Thu, 29 Jul 2021 14:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdQzhjPC53I1; Thu, 29 Jul 2021 14:32:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EBC5B6064D;
	Thu, 29 Jul 2021 14:32:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1302C001A;
	Thu, 29 Jul 2021 14:32:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDB0BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 14:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA74C838C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 14:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdKk3KRvYocO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 14:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 122E88387D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 14:32:19 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d1so7239067pll.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TCqiZ9emwIn3DT8Qsqk3JokMy2CspMehkepsJ5X2OwI=;
 b=pYmciwP358P4iHb5J1kUSRLLsujMHUNOs6IfYo1L3SmlG0rWOcGEzMCxc6qjBXTyJn
 DDH6pWCrYwzFt/vPl1abGPC0Gs3TTe4cny88etZlimyWd3AzxTdNyZ6QT45d0F38B96L
 V3yPQ41hpebZlq4SIo8ju9Ews+sSLWL85P6yV7D7+DFOKY7hOKT6Pu9v1Omqchz7ZFCG
 +raQzzTRYZs0RtB647vonPTl3GiFFZhtHcoeuNPd4AmLtrWpp/mMFkDV8/Wtb0hcgsQc
 qSMdAnaj+p05tP9CUTmeyEAb48oDtTdVzIsg/hvB6ViMPfyniuTVSgK9KrJQf3PrYqZC
 yVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TCqiZ9emwIn3DT8Qsqk3JokMy2CspMehkepsJ5X2OwI=;
 b=ZTJ6xuXGcS+THK671xnM7rW8biZ1Nmu5Pn8EcPrb9ZhTLia9E2ol7RhvE6nKUNZCna
 TH4ZGpNL9PsQskjvyF9SIM+zVX65ER8n5TLnZy0Upni3u3EY3Me2P2rk4K335qvFoCTE
 O8u8K31IF/VolDAg1FC0p/OXljMq7rFvSS+EErWvnh34SoSLI27ab/qbKyO9RBu7UO/+
 VvgZIqeB4ep85T6GmOeJpCYbVti3kmULvE2RP0IehMQHs4tKyNTy32k9IBZZQpTz7sIi
 52kCp38uGhpG+VKOj1GRzplMYNBCMS+gf+uE44t/XQ7CVGhEw6I4kFmO353niAm39Bsg
 W8qw==
X-Gm-Message-State: AOAM5326t0l3i7AAwxJye7nwoHP2bxkm7/hWc8sl5CB8gniP0mWwzAGp
 1V2Y9934YyhU0oe2dUZRn1a3AktUg0DF+E/4UJU=
X-Google-Smtp-Source: ABdhPJy0u0+T52Mob4Ito6crR05tVv7wP86/2LEo3TbMmbfDVRZIhzxPK9wjz9JsmCtRtqAI46W+/Q==
X-Received: by 2002:a17:90b:609:: with SMTP id
 gb9mr5714173pjb.156.1627569138906; 
 Thu, 29 Jul 2021 07:32:18 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n56sm3801845pfv.65.2021.07.29.07.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:32:18 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
To: Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
 <YQAaIrNUXa6i2gxD@hirez.programming.kicks-ass.net>
 <YQJSE3TMRydDNhqT@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <fbf2ec46-5ef5-7108-450a-13a7c48c30ce@gmail.com>
Date: Thu, 29 Jul 2021 22:32:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQJSE3TMRydDNhqT@phenom.ffwll.local>
Content-Language: en-US
Cc: intel-gfx@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org
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

On 29/7/21 3:00 pm, Daniel Vetter wrote:
> On Tue, Jul 27, 2021 at 04:37:22PM +0200, Peter Zijlstra wrote:
>> On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
>>> On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> Inside drm_is_current_master, using the outer drm_device.master_mutex
>>>> to protect reads of drm_file.master makes the function prone to creating
>>>> lock hierarchy inversions. Instead, we can use the
>>>> drm_file.master_lookup_lock that sits at the bottom of the lock
>>>> hierarchy.
>>>>
>>>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_auth.c | 9 +++++----
>>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>>>> index f00354bec3fb..9c24b8cc8e36 100644
>>>> --- a/drivers/gpu/drm/drm_auth.c
>>>> +++ b/drivers/gpu/drm/drm_auth.c
>>>> @@ -63,8 +63,9 @@
>>>>   
>>>>   static bool drm_is_current_master_locked(struct drm_file *fpriv)
>>>>   {
>>>> -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
>>>> -
>>>> +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
>>>> +	 * should be held here.
>>>> +	 */
>>>
>>> Disappointing that lockdep can't check or conditions for us, a
>>> lockdep_assert_held_either would be really neat in some cases.
>>>
>>> Adding lockdep folks, maybe they have ideas.
>>
>> #ifdef CONFIG_LOCKDEP
>> 	WARN_ON_ONCE(debug_locks && !(lockdep_is_held(&drm_device.master_mutex) ||
>> 				      lockdep_is_held(&drm_file.master_lookup_lock)));
>> #endif
>>
>> doesn't exactly roll off the tongue, but should do as you want I
>> suppose.
>>
>> Would something like:
>>
>> #define lockdep_assert(cond)	WARN_ON_ONCE(debug_locks && !(cond))
>>
>> Such that we can write:
>>
>> 	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
>> 		       lockdep_is_held(&drm_file.master_lookup_lock));
>>
>> make it better ?
> 
> Yeah I think that's pretty tidy and flexible.
> 
> Desmond, can you pls give this a shot with Peter's patch below?
> -Daniel

Sounds good, will do. Thanks for the patch, Peter.

Just going to make a small edit:
s/LOCK_STAT_NOT_HELD/LOCK_STATE_NOT_HELD/

Best wishes,
Desmond

>>
>> ---
>> Subject: locking/lockdep: Provide lockdep_assert{,_once}() helpers
>>
>> Extract lockdep_assert{,_once}() helpers to more easily write composite
>> assertions like, for example:
>>
>> 	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
>> 		       lockdep_is_held(&drm_file.master_lookup_lock));
>>
>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> ---
>> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
>> index 5cf387813754..0da67341c1fb 100644
>> --- a/include/linux/lockdep.h
>> +++ b/include/linux/lockdep.h
>> @@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
>>   
>>   #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
>>   
>> -#define lockdep_assert_held(l)	do {					\
>> -		WARN_ON(debug_locks &&					\
>> -			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
>> -	} while (0)
>> +#define lockdep_assert(cond)		\
>> +	do { WARN_ON(debug_locks && !(cond)); } while (0)
>>   
>> -#define lockdep_assert_not_held(l)	do {				\
>> -		WARN_ON(debug_locks &&					\
>> -			lockdep_is_held(l) == LOCK_STATE_HELD);		\
>> -	} while (0)
>> +#define lockdep_assert_once(cond)	\
>> +	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
>>   
>> -#define lockdep_assert_held_write(l)	do {			\
>> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
>> -	} while (0)
>> +#define lockdep_assert_held(l)		\
>> +	lockdep_assert(lockdep_is_held(l) != LOCK_STAT_NOT_HELD)
>>   
>> -#define lockdep_assert_held_read(l)	do {				\
>> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
>> -	} while (0)
>> +#define lockdep_assert_not_held(l)	\
>> +	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
>>   
>> -#define lockdep_assert_held_once(l)	do {				\
>> -		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
>> -	} while (0)
>> +#define lockdep_assert_held_write(l)	\
>> +	lockdep_assert(lockdep_is_held_type(l, 0))
>>   
>> -#define lockdep_assert_none_held_once()	do {				\
>> -		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
>> -	} while (0)
>> +#define lockdep_assert_held_read(l)	\
>> +	lockdep_assert(lockdep_is_held_type(l, 1))
>> +
>> +#define lockdep_assert_held_once(l)		\
>> +	lockdep_assert_once(lockdep_is_held(l) != LOCK_STAT_NOT_HELD)
>> +
>> +#define lockdep_assert_none_held_once()		\
>> +	lockdep_assert_once(!current->lockdep_depth)
>>   
>>   #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
>>   
>> @@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
>>   extern int lockdep_is_held(const void *);
>>   #define lockdep_is_held_type(l, r)		(1)
>>   
>> +#define lockdep_assert(c)			do { } while (0)
>> +#define lockdep_assert_once(c)			do { } while (0)
>> +
>>   #define lockdep_assert_held(l)			do { (void)(l); } while (0)
>>   #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
>>   #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
>>
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
