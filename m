Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9923290E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Dec 2023 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SItfbPsn"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DAE660F10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Dec 2023 08:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DAE660F10
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SItfbPsn
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9DKXnO4fN1r
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun,  3 Dec 2023 08:12:07 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 11F6A60F0D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  3 Dec 2023 08:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F6A60F0D
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-286838371faso164109a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 03 Dec 2023 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701591126; x=1702195926; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/vcuqZ4fJLLKaosyQPQg2UkPXyexycK32D3E42tjTI=;
        b=SItfbPsnEf0C4/3DW6yWLSNiAl7rxybBJCGfK8Y+rt9FrNbpSkre8sCT2cutxBo5iq
         wChf/xZlPn1zDA/Mg4r/h66K0zg7AHx6nEbO2Rn8gr1u9oJIXJblV8OLmGVpT05qspVw
         ZoZasDZqXh56coCV8nI0EsHg03A8kvFnA2s862ODDkjVSnDhggiD+MiHZOVRH50gU4sr
         eFJZUuQuAZYgbki+nRWKDyAWvJOVeMAcGPJ8Y1yFIGskC4pf6129Tush7L8mVZVPn6nN
         jeYdXsCE9aIWt8Vc48hgqlwqM4h2kLKKMTXEllJQTrnZnJBDq94zDF8zEhqozhh+WZBI
         +9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701591126; x=1702195926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/vcuqZ4fJLLKaosyQPQg2UkPXyexycK32D3E42tjTI=;
        b=Xz0lXho4NJmST37/ejGQ8CAA9S9wpA7Zotx2fVqu77eRnHt5d9u0ro2KIfuBCKknHP
         hAsAy0of0Set/6tPmGVAPYCE7A3EdEY4cKf0p6BJ+9teIwh4VHYwWBQFVL7buZPFddvM
         3vtriMIMhpm+7KEjJtMQ006gbC5nNWsqD0YMqDBKtdjHK2yz4reyN8pud28GfnpQf90a
         7at2eNvGWcnFN/VS0N43BCIW5WhnhI/uyQ2FMsTMNUaCHBcd3BP5et5gZdoe3LmQLmUM
         tZW6VeyJMRIRyph46VqPlkcA6NyAjwpbOyRglmD6UWEeZmbyKMaMXU4QHqiFoGI+1wTP
         v0+A==
X-Gm-Message-State: AOJu0YxLD/RTXuZiZKakTkgjr9ZxZZAvedNFvmyDVamKudKNsMC8SIi0
	8zFl7wR02ThHQnSLF09hg6w=
X-Google-Smtp-Source: AGHT+IE6jDWJnhDlocs06VpaYFk7tPb3o8MK+SewA2ckAVy/M4/ZakP8Bj6Mei+J9VnyXmmjhg+BTQ==
X-Received: by 2002:a17:903:2308:b0:1ce:63bf:e4c9 with SMTP id d8-20020a170903230800b001ce63bfe4c9mr34229294plh.0.1701591126293;
        Sun, 03 Dec 2023 00:12:06 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
        by smtp.gmail.com with ESMTPSA id ay7-20020a1709028b8700b001acae9734c0sm6216064plb.266.2023.12.03.00.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 00:12:05 -0800 (PST)
Message-ID: <b5b06804-a8a1-44d9-8e85-063d2cca2f91@gmail.com>
Date: Sun, 3 Dec 2023 13:41:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver: gpu: Fix warning directly dereferencing a rcu
 pointer
To: Danilo Krummrich <dakr@redhat.com>
Cc: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
 <f5a69710-f1a6-444d-9d2a-7c07589a2bdc@redhat.com>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <f5a69710-f1a6-444d-9d2a-7c07589a2bdc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/30/23 05:22, Danilo Krummrich wrote:
> Hi Abhinav,
> 
> Thanks for sending this follow-up patch.
> 
> On 11/26/23 15:57, Abhinav Singh wrote:
>> Fix a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
>>
>> We should not be directly dereferencing a rcu pointer. To get a normal
>> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
>> function unrcu_pointer(...). The non __rcu tagged pointer then can be
>> dereferenced just like a normal pointer.
> 
> Can you please add a brief explanation why unrcu_pointer() is fine here?
Is this description okay
"The reason for using unrcu_pointer(...) instead of rcu_dereference(...)
or rcu_dereference_protected(...) is because, before nv10_fence_emit() 
and nv_04_fence_emit() did not add this fence to the fence context's
pending list, thus channel doesn't need any protection" ?
> 
>>
>> I tested with qemu with this command
>> qemu-system-x86_64 \
>>     -m 2G \
>>     -smp 2 \
>>     -kernel bzImage \
>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial 
>> net.ifnames=0" \
>>     -drive file=bullseye.img,format=raw \
>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>     -net nic,model=e1000 \
>>     -enable-kvm \
>>     -nographic \
>>     -pidfile vm.pid \
>>     2>&1 | tee vm.log
>> with lockdep enabled.
> 
> How is that relevant for this patch?
> 
> - Danilo
To test rcu related code lockdep must be enabled, it gives any warning 
or error message if we are dealing inappropriately with rcu pointers. So 
I tested this lockdep enabled. I added the test description in this 
patch as well 
https://lore.kernel.org/all/0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com/ 
which is very similar to this patch so I thought I should here as well. 
Is it not relevant here?

Thank You,
Abhinav Singh
> 
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
>>   drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c 
>> b/drivers/gpu/drm/nouveau/nv10_fence.c
>> index c6a0db5b9e21..845b64c079ed 100644
>> --- a/drivers/gpu/drm/nouveau/nv10_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv10_fence.c
>> @@ -32,7 +32,7 @@
>>   int
>>   nv10_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
>> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c 
>> b/drivers/gpu/drm/nouveau/nv84_fence.c
>> index 812b8c62eeba..d42e72e23dec 100644
>> --- a/drivers/gpu/drm/nouveau/nv84_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv84_fence.c
>> @@ -85,7 +85,7 @@ nv84_fence_chid(struct nouveau_channel *chan)
>>   static int
>>   nv84_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nouveau_channel *chan = fence->channel;
>> +    struct nouveau_channel *chan = unrcu_pointer(fence->channel);
>>       struct nv84_fence_chan *fctx = chan->fence;
>>       u64 addr = fctx->vma->addr + nv84_fence_chid(chan) * 16;
> 

