Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082782C15B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389510; cv=none; b=lpBBGf3n3eruMUtHt/MW/U5xD8VleLKM9IL9wFRJ+OUvJPMo1DJkynYlhT25P+SQZenzH4MUQkf/1xDYGfibQJSApB6l9uTEygHGJaZZl6Abxi9MD1YyRw5uLdRQG8Yw7zF1Sbzo8a/Ek8+WJpd6jotPLiJApSP7gZPf7ywv7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389510; c=relaxed/simple;
	bh=IXj7hTXwQeyqCunCVwDQ/2Er1BA3q3NLqE9APHCkULg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PsiCRC9Nyfg5gpG8FP+3jgNt+A5XxJQgAGkhmxSQXq9kzfIP2j9LhiXmB+BopZfrgim0n20X6FqOvcXDtO1WVoOio4hyMdpFrACqI/3rzHeiybf1g9KlmUXnaF+qZN0vJcvz6KoJwCNw0x1qrnb05l2YvkBCJLdDtCKlzSr6XIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=imevi3cg; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="imevi3cg"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA06061503
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 07:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfVIHU45VLSC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 07:18:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 300B6614D1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 300B6614D1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=imevi3cg
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 300B6614D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759389505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=swyZi6awnmO5RiaAnGAjYKHP2JqeK0Fm7ds6C9onHkE=;
	b=imevi3cgH/B3jI/ZT7cDeY4Sld3d5vCkzxTCacAEFn7+Yt357+QFlQzPzA65u71UVCtOIP
	D/WbOJM/n5ji1zaI3QL+cUkKJLfTKQCeJ4QmrXaeNhndgTvRrpfAn513izBE1hz9iqmE1C
	Bz1WC6Yo6W9XUlBu5x7XXHljbYKI/Oo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-l5Q4O2_KMKuK-hlfsySiyA-1; Thu, 02 Oct 2025 03:18:21 -0400
X-MC-Unique: l5Q4O2_KMKuK-hlfsySiyA-1
X-Mimecast-MFC-AGG-ID: l5Q4O2_KMKuK-hlfsySiyA_1759389500
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e502a37cdso8449115e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 02 Oct 2025 00:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759389500; x=1759994300;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swyZi6awnmO5RiaAnGAjYKHP2JqeK0Fm7ds6C9onHkE=;
        b=dtmIJ0PBRBaTLqadDCZqfhzxF2qH5JoIdE8s42DhiqbuTW1yNlJjTNDY6uwx2PDY6w
         gwFgOjB6SnxomWZJpQgNOrMRf0Flptpmwy0sjvMGKQhnARHkpsCOW1N9iO0l6gBeGCLi
         bwA7dUqzgRuROZMXy4+CgNbureGKi1JsDOH5o25jHafzCp7Y/d3GV6N9e4HBDW8mRBxF
         gc/X7Lt6VxnGPYY5V6uR50FLaygRiKAuGM4x5EII80MOFsC1J8Yj3jAmCihqN2hM+5aW
         5ch4lhvT897iUU81r7u3ue1wLeiI6S98G07EZlcaXlBuauET9AmCBYGq0JB0p+h7ioP4
         02Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVbY3WD1ma8L+gk050nD8s7xVw7zdkefCa1WEuC/lwQMRKPfSg7TTAYl88C1NKS2dMowq+qyzGviAO2S0EIE8p+tWji7w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxnQlhTp2/OcA8uiDbs+VcoPFAb+IIBlrzKoLrU1oWLuLKN3a7H
	XGXNrYacSK4kqbQYaVR+Qx9x9T2DmMvjDGnTiUrIPIK/hz8w8KlYhuYDvJq09sb9V02N8v4MICh
	osicC2ETHRxDNvuS/yiRWrnQjGJ5mXC+tsJQ2KHz19OlbFZxWs+uIEH/TDFwVwZMRFB8qV6/lUs
	0UxLk/WmCLeXFeRw==
X-Gm-Gg: ASbGnctrGotVdrSPyKEUNMrXMS+UgwAd8jRZQKu7QXE044ynZQPJ+rRJ3rCIIFm/4wC
	HAMXBJ+eCvykbFNqq6KxuuKyVeB4Hc8cQO9Hnm76IW/Ezi1HyB/o+V8jtHNHHeTWGPbwMmLFWUt
	Us0ZXz0O8zhE7/dZD9+dUwYUSCFhV00iUb6kGC2DP8kYd9+kD3kSiuftvY1s+v6gMx5wM23c1Ks
	YaojkJPw7yY0PETK5Q8ey8GkixsvY13i9QvT6Pv99AYDynKFH8iFfOLRT7ukmuIAds9MIVBbHZ0
	PBDzDQ0npTLILsAxnv7L9HcQDP3h5pruR7qfUie1ZXMI4HBdpAPAdlBrKVF3J6oP7PgvyMFPbUw
	mjZz969oBe+456VswI8ATVz0eZlOL
X-Received: by 2002:a05:600c:4e8e:b0:45d:d97c:235e with SMTP id 5b1f17b1804b1-46e6127a1a2mr51951555e9.12.1759389500343;
        Thu, 02 Oct 2025 00:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHH2bH9y5SpEFzNPxE7t3AzNB2zTXQWFjPSl+9Pu6fOziiwiBNOHN0F39U223H2afps1W7Q==
X-Received: by 2002:a05:600c:4e8e:b0:45d:d97c:235e with SMTP id 5b1f17b1804b1-46e6127a1a2mr51951285e9.12.1759389499798;
        Thu, 02 Oct 2025 00:18:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8acc4csm2320435f8f.16.2025.10.02.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 00:18:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Bhanu Seshu Kumar Valluri
 <bhanuseshukumar@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array to prevent overflow of
 dynamic size calculation
In-Reply-To: <bfc90c7a-4ade-4bf0-88e3-86697e664e35@suse.de>
References: <20251002013312.67015-1-bhanuseshukumar@gmail.com>
 <bfc90c7a-4ade-4bf0-88e3-86697e664e35@suse.de>
Date: Thu, 02 Oct 2025 09:18:17 +0200
Message-ID: <87zfa94vra.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sVvBxFh4wQxyTHfIoQKymZ90h3zuptJtpjYsdm5B1o0_1759389500
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Bhanu and Thomas,

> Hi
>
> Am 02.10.25 um 03:33 schrieb Bhanu Seshu Kumar Valluri:
>> Use kmalloc_array to avoid potential overflow during dynamic size calculation
>> inside kmalloc.
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---

The same patch was posted by another developer a couple of weeks ago
and is now queued already in the drm-misc-next branch:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=940dd88c5f5bdb1f3e19873a856a677ebada63a9

>>   Note:
>>   Patch compiled successfully.
>>   No functionality change is intended.
>>
>>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> index eec43d1a5595..8368f0ffbe1e 100644
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
>>   	if (ret)
>>   		return ret;
>>   
>> -	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
>> +	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
>
> The first parameter is the number of elements. The second parameter is 
> the size of an individual element. So the arguments should be swapped. 
> Same for the other changes.
>
> I know it's nitpicking, but who knows what it'll be good for. Fun fact 
> is that even kmalloc_array mixes up both parameters internally.
>

You are right. I didn't notice this subtlety when reviewing mentioned
patch that pushed to drm-misc-next.

> Best regards
> Thomas
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

