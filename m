Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CF2233E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BM/zZdlt"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0D340936
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 17:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0D340936
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BM/zZdlt
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3B-mqITB3ao
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 17:10:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D498E40915
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 17:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D498E40915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699895412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G65WustLE2dEQVp8ysLE58NJMc/t5tEbPzYhJeMqn9s=;
	b=BM/zZdltFX665drRbvAQcli70L7aEfT9Vc+ZcQDPG7p1zN3y7Yqt/n+u5EqJX6T+m3J+SN
	eY0G9O4hhqIGn/YnWmmvEkAFCySAwC4RHxZijRybxvsgPh9SM2wdG5WB65QC5FLkl1o3Us
	YPqP5Vc84euMUn6N74Fz5y6IP4II5Jg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-oQ_8Op5SMeOf2g9KtaGt_g-1; Mon, 13 Nov 2023 12:10:10 -0500
X-MC-Unique: oQ_8Op5SMeOf2g9KtaGt_g-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-509901ca83eso4604461e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 09:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699895409; x=1700500209;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G65WustLE2dEQVp8ysLE58NJMc/t5tEbPzYhJeMqn9s=;
        b=PskuNBps1urzAefBpfCkXZafxSZRLYkJFqsnEIVwrKQ9/Zwvvc2RLRMXl1MaxzCAcw
         SSTeCBCUiGxcKMCHXXLiWMpX2YU9HYJVGqVeTnrw4d4ecV93Z04w0rPSXBhJyjGRGRzg
         8y/RP4a0Rg0AKsy2TilEAelUl+JMiRu6IV3xBoS6SudpId/WWnvmL19ClHwiTUJr+apP
         NJKrKG3f2EIWD9Ot+E6SbPEvtnJgnpbjiOK+nYIn/5ewMskWT5rWVdqh8QwC+a/06XRa
         bn0vmPOGt0S3O/GEnUk4j1S13h57+2kL87OoYeSdwhrNEwXPuJ9qSBgw8BWLkS07VCt/
         eyhw==
X-Gm-Message-State: AOJu0YwPqBBznr3b259tFd42AdrFzgtunvTsVo70LbzVtdPHdbaMMnsA
	EU4QSr9UfWRK8E+wCQybCotg61/neNNR2VwXyzbkLQoyvwLd/39UP3tpZfDHU+duQ0ama5qOY/q
	OTJATtdqjWbzhRlRMlYDVNNNPWNtUnBENm9ugAS/lZp/jBjRD
X-Received: by 2002:a05:6512:4014:b0:500:7a21:3e78 with SMTP id br20-20020a056512401400b005007a213e78mr6100259lfb.55.1699895409172;
        Mon, 13 Nov 2023 09:10:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/xPxDvcc33kOc3ZeaYYvr9EKONgzFQPtiIPoNDj3O2aUw5WCUYtxdrDIZshZQrDyJOu4hpw==
X-Received: by 2002:a05:6512:4014:b0:500:7a21:3e78 with SMTP id br20-20020a056512401400b005007a213e78mr6100236lfb.55.1699895408838;
        Mon, 13 Nov 2023 09:10:08 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id b1-20020a0565120b8100b004fdde1db756sm1029983lfv.26.2023.11.13.09.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:10:08 -0800 (PST)
Message-ID: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
Date: Mon, 13 Nov 2023 18:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver: gpu: Fixing warning directly dereferencing a rcu
 pointer
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20231113081040.2947143-1-singhabhinav9051571833@gmail.com>
 <f229d1ed-b71e-434a-acca-06ee81826260@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f229d1ed-b71e-434a-acca-06ee81826260@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 09:24, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2023-11-13 kl. 09:10, skrev Abhinav Singh:
>> This patch fixes a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
>>
>> We should not be directly dereferencing a rcu pointer, rather we should
>> be using rcu helper function rcu_dereferece() inside rcu read critical
>> section to get a normal pointer which can be dereferenced.
>>
>> I tested with qemu with this command
>> qemu-system-x86_64 \
>>     -m 2G \
>>     -smp 2 \
>>     -kernel bzImage \
>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
>>     -drive file=bullseye.img,format=raw \
>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>     -net nic,model=e1000 \
>>     -enable-kvm \
>>     -nographic \
>>     -pidfile vm.pid \
>>     2>&1 | tee vm.log
>> with lockdep enabled.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nv04_fence.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
>> index 5b71a5a5cd85..e62bad1ac720 100644
>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>> @@ -39,7 +39,9 @@ struct nv04_fence_priv {
>>   static int
>>   nv04_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    rcu_read_lock();
>> +    struct nvif_push *push = rcu_dereference(fence->channel)->chan.push;
>> +    rcu_read_unlock();
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
> 
> I'm not an expert in nouveau fence channel lifetime, but I'm pretty sure this should probably be a rcu_dereference_protected, since a fence likely can't lose its channel before its command to signal is submitted.

Yes, before nouveau_fence_emit() did not add this fence to the fence context's
pending list ->channel doesn't need any protection. We can probably just use
unrcu_pointer(), as in [1].

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_fence.c#L210

> 
> But in case it's not, I would at least advise to check for fence->channel lifetime before submitting a patch like this. At least the original code warned about it not being 100% correct.
> 
> Cheers,
> 
> ~Maarten
> 

