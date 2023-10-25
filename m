Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20006C25B6E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 23:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3030820C7;
	Wed, 25 Oct 2023 23:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3030820C7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mmWjXR8M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbPGa82TIS0d; Wed, 25 Oct 2023 23:27:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8B783820C8;
	Wed, 25 Oct 2023 23:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B783820C8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 610DCC0039;
	Wed, 25 Oct 2023 23:27:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12503C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D47820C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D47820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsAX5-cWElyY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:27:54 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B1F3820C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B1F3820C7
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cacbd54b05so452005ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 16:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698276473; x=1698881273;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ovpAP5+hWly+cU72J7ewL3F/4BY3qoRuufHFrjaSnmo=;
 b=mmWjXR8MowPa/563vZRjq77TW25SYelW+aYkWj7VFepAUMjS3K0G3Wf2bQdNhX9FfN
 BD1l9/QPs8pc3kZbSam1lHiKGvOn8hYYRWOCffqau1ieD/mltJY833yXkfJ4wz6CetmM
 AgcYc+U/Kh7D8Kr0k3v/+MBvRHg9tAa328t9Eugl4gUcV9dtddKaLVW74y+2Sux0DSiA
 2my0IPGiQ32wU10mu3HV+/N+8F7e5jQYglwCe5Vz9cD94vo+yHWlg63h9NjPtciMRXJx
 y9dwBYwQleTuhfVI8uZW7dg/RZtoe/sIrklRPYtRBdxYMYWY9CCms7deILyuanmfbipZ
 J+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698276473; x=1698881273;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ovpAP5+hWly+cU72J7ewL3F/4BY3qoRuufHFrjaSnmo=;
 b=HzEUs5OhM2HbiwHYCS2mrY7dFsZU0SuW2UqYbD6o+0b5EPIDlm1L/wIoR8ss1M0l2Z
 MdQ4NxzFCH4807D6Jn/mdjRJePortOdnw5Z+uarjGmu2Ue5Xlh1RTZqAKprtWvaYyNdm
 DX5J439muZ2EEE4gusoxwqWf5XpYA/8yWQTGy8R3so9Tn30i9br04NOoYTEsnKGsuTKK
 T0L7DnKp5JXPRe/dLoU/PhOE1pr8Us9HI9cZ3PvTMP5mGo2TaBagYF4gdDBeQGb71jU+
 WoJV6i0oN/4tND6nNn12PAZMutn3ijE/0UxI54bsW5U9RaizS2mRRLkRoX9z6h1EfUIK
 WZRA==
X-Gm-Message-State: AOJu0Yx3iN9B/gak59jyYdWLAJQ2rMPvscXV+QYds4QT78KZNrvV60bG
 OTQ3wAJGm5fy30gDNQg0cU4=
X-Google-Smtp-Source: AGHT+IFGO6qAQ/ms3YMtIflofUb/LNTTkFW6HNjBUfNP74iVVQyA9Lg8fqQ2kuSPnnvYLaD+XYPUUw==
X-Received: by 2002:a05:6a21:1a2:b0:171:947f:465b with SMTP id
 le34-20020a056a2101a200b00171947f465bmr22926716pzb.4.1698276473541; 
 Wed, 25 Oct 2023 16:27:53 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 u7-20020aa78487000000b00694fee1011asm9886327pfn.208.2023.10.25.16.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:27:52 -0700 (PDT)
Message-ID: <c4688c53-4206-4d54-aed9-f877697e8073@gmail.com>
Date: Thu, 26 Oct 2023 04:57:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixing warning of directly dereferencing __rcu tagged
To: Andrew Morton <akpm@linux-foundation.org>
References: <20231025222811.855336-1-singhabhinav9051571833@gmail.com>
 <20231025153807.8db950f1db82b2c9ecd03758@linux-foundation.org>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231025153807.8db950f1db82b2c9ecd03758@linux-foundation.org>
Cc: brauner@kernel.org, mjguzik@gmail.com, mst@redhat.com, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, mathieu.desnoyers@efficios.com, shakeelb@google.com,
 surenb@google.com, michael.christie@oracle.com
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

On 10/26/23 04:08, Andrew Morton wrote:
> On Thu, 26 Oct 2023 03:58:11 +0530 Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
> 
>> This patch fixes the warning about directly dereferencing a pointer
>> tagged with __rcu annotation.
>>
>> Dereferencing the pointers tagged with __rcu directly should
>> always be avoided according to the docs. There is a rcu helper
>> functions rcu_dereference(...) to use when dereferencing a __rcu
>> pointer. This functions returns the non __rcu tagged pointer.
> 
> Seems sensible.
> 
>> Like normal pointer there should be a check for null case when
>> further dereferencing the returned dereferenced __rcu pointer.
> 
> Why is this?
> 
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -2369,7 +2369,9 @@ __latent_entropy struct task_struct *copy_process(
>>   
>>   	retval = -EAGAIN;
>>   	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
>> -		if (p->real_cred->user != INIT_USER &&
>> +		const struct cred *real_cred = rcu_dereference(p->real_cred);
>> +
>> +		if (real_cred && real_cred->user != INIT_USER &&
>>   		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>>   			goto bad_fork_cleanup_count;
> 
> The old code assumes that p->read_cred cannot be NULL and the new code
> does nothing to make it possible that `real_cred' can be NULL?
> 
> In other words, I see no reason to add this new check for NULL?

Thank you for the response!

I thought it will be better to have check before accessing it, just so 
we dont have any segmentation fault in future.

Also I just noticed there are two more places where direct dereferencing 
of __rcu pointer is done in this same file. Should I do those changes in 
this patch ?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
