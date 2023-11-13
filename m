Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0222EF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MORufd8Z"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF08821BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF08821BD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MORufd8Z
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyySUmeImGwA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 19:00:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E9B3D81ECA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9B3D81ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699902037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xjJH04gFEMWV/cqlv7v8adTIMmJNmVfPhb2cpZ40Pn0=;
	b=MORufd8ZIyfOkOVtJA+5cbrqJif9Sf6rMHp8nj2KfgQMha0ko7nK2IlMnSiSlj9+5+uziI
	JZyG3uCeutlEhRWtNeBAphHjkkdMk15Gt3n0vuKNDolyCcibObiYqzWHWCfRPPeLPoElYB
	LYNH/cDqF3xE9nwbbli1yS2Uw41p43Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-gUo6Gin4N1WRb4bNha6B9w-1; Mon, 13 Nov 2023 14:00:36 -0500
X-MC-Unique: gUo6Gin4N1WRb4bNha6B9w-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c7822862b5so29074011fa.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699902035; x=1700506835;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjJH04gFEMWV/cqlv7v8adTIMmJNmVfPhb2cpZ40Pn0=;
        b=cg4OSgAGOqq8slAXqGvA6OoAId6uCQ+ofeEz5m50qpMNG906aFXdUKZzJuHKcnuOlt
         h6Sabu8sCbmjyJx56QvVQXwMN0MYrGAGSTPYowj4Sw7R8gMRFT3bcJMHHGtsb2uyUaUj
         V3nAJD70CY8CpTAMk74baOcQUJCOaCE6ds1HUw1GtR7UWrjIIsQ9d4/Skr56m4hSNsIi
         lDbiszYjAgAzL/HZ6lYPqz8lt5TMnnmAGLwxMWVT07zP8lvWTxn5SF2RsLHpKUgptn1k
         Y9JuH4nm891XLBnpGQK1+r9OtS8Gozrg2rESM6wlwHTz2sRI+c0TiF8Q+h/5FGyy5ZrN
         rb/w==
X-Gm-Message-State: AOJu0YzNf2CnLCMHH9z+WSlcgkg1aOiC62VWsgPLJaYOKIsdEkytrX4p
	LeuZT/FWzQ1ADIAQTATl03Uu7trlCogu7oatgk7s5xuTsPKc/sW9R15BdTJkoZs0vc3DtqQlAzM
	nH2Ak/swjNG+HW7DIzJ55Z3DwS1SpjihFv0ouqi8Pp6BhqZ4p
X-Received: by 2002:a2e:be8b:0:b0:2bc:f5a0:cc25 with SMTP id a11-20020a2ebe8b000000b002bcf5a0cc25mr135226ljr.2.1699902035084;
        Mon, 13 Nov 2023 11:00:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKOZlXh+pNOQnEDYBQ7KmjIxq11+FS8KLtk5tk8xefyvp983ehULtBUTIJnRwL82VT3c4gjA==
X-Received: by 2002:a2e:be8b:0:b0:2bc:f5a0:cc25 with SMTP id a11-20020a2ebe8b000000b002bcf5a0cc25mr135210ljr.2.1699902034760;
        Mon, 13 Nov 2023 11:00:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090629c300b009b94fe3fc47sm4386719eje.159.2023.11.13.11.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 11:00:34 -0800 (PST)
Message-ID: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
Date: Mon, 13 Nov 2023 20:00:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
 <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
 <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
 <d0b1fb36-d2a6-446c-8a04-2101981f3a00@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <d0b1fb36-d2a6-446c-8a04-2101981f3a00@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/13/23 19:55, Abhinav Singh wrote:
> On 11/14/23 00:19, Danilo Krummrich wrote:
>> Hi,
>>
>> thanks for sending a v2.
>>
>> On 11/13/23 19:42, Abhinav Singh wrote:
>>> This patch fixes a sparse warning with this message
>>> "warning:dereference of noderef expression". In this context it means we
>>> are dereferencing a __rcu tagged pointer directly.
>>
>> Better use imperative here, e.g. "Fix a sparse warning ...".
>>
>> Wouldn't ask you to send a v3 for that alone...
>>
>>>
>>> We should not be directly dereferencing a rcu pointer, rather we should
>>> be using rcu helper function rcu_dereferece() inside rcu read critical
>>> section to get a normal pointer which can be dereferenced.
>>
>> ...but this doesn't seem accurate anymore as well.
>>
>> - Danilo
>>
>>>
>>> I tested with qemu with this command
>>> qemu-system-x86_64 \
>>>     -m 2G \
>>>     -smp 2 \
>>>     -kernel bzImage \
>>>     -append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
>>>     -drive file=bullseye.img,format=raw \
>>>     -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
>>>     -net nic,model=e1000 \
>>>     -enable-kvm \
>>>     -nographic \
>>>     -pidfile vm.pid \
>>>     2>&1 | tee vm.log
>>> with lockdep enabled.
>>>
>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>> ---
>>> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>>> also removed the rcu locking and unlocking function call.
>>>
>>>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
>>> index 5b71a5a5cd85..cdbc75e3d1f6 100644
>>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>>> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>>>   static int
>>>   nv04_fence_emit(struct nouveau_fence *fence)
>>>   {
>>> -    struct nvif_push *push = fence->channel->chan.push;
>>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>>       int ret = PUSH_WAIT(push, 2);
>>>       if (ret == 0) {
>>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
>>
> Hi maintainers thanks a lot for reviewing this patch.
> I think I should fix my mistake by sending in another patch so that the code changes and description matches. So should I send another patch ?

Yes, please send a v3.

> 
> Thank You,
> Abhinav Singh
> 

