Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC1E2B9D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F86OEvDW"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B49584417
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 23:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B49584417
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F86OEvDW
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WgCfQw2NVDcS
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 23:52:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A0F7484413
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 23:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F7484413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701301968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DMKF7ZGyx5GoQuAFp4AyN/BySHZDI7ZFOdXRc26u9o=;
	b=F86OEvDWLMi2LymUr2Bo0CDBlnprbBqOkCUK1PJeB4WcsmmTL34NT/lZhceg1EIZ8iWM6G
	llaFHTShyBrAguVa9CSa4wPkJgJCM9IPjJgSNiKZa32AXixHmkLpR4dXJ3qLXu3jrcvwyZ
	szfXvZs4IQb+fjZI6aR4k/mFoudecp4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-hvXwgCIfO6adftrFTv_5Rw-1; Wed, 29 Nov 2023 18:52:45 -0500
X-MC-Unique: hvXwgCIfO6adftrFTv_5Rw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a172dfcf438so23020166b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 15:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701301964; x=1701906764;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DMKF7ZGyx5GoQuAFp4AyN/BySHZDI7ZFOdXRc26u9o=;
        b=Q+YLZ+Lt97ykYTf8bMDIUde94PoaAsav6xA/OO+2gRPOaqIOfR47A2fSfnP9h3GG7G
         GVEpYdBonLfLBhyWZKfi/cdF/4Km4n7hrdKVnpeVFYXBhLMbfm2vT0NuFZUgo8YKpN1O
         yXcSsOkO6MrBCZi5ZXc/wiOqs9eQ4ty5Qo1EoK/Dn9wSwJ5ySGVX4pHm9TYK381Gw7Bd
         sss/Xtbf3JuOdBmXoSSzOvYQRh2yXFuPOPspk8lhZWh+acKszedk4iiakZRIz8Tb2cL5
         BR+QcXElxBcp2Q7pBjDuiHCP+yQFi2/j3jtAq/uHvmImhLe/xTB6CrIcWGKdjU/0A9GA
         kSJA==
X-Gm-Message-State: AOJu0YyXXrQTfx318UlHTS+OonOpe1WZLPO6p4UxR2vQbEQ804Ed5z7W
	oCs0Tiu6X2nPRchEgydZPS07iJhzd2bIiKyhJ5SUjMNOPV8eCrDsyTOFvPnHOtu+fCBMc5rheJh
	WqymXEnSKwCgggnzAPTVgtR6dXxko1P+7SruA6lUpQhuuJsc3
X-Received: by 2002:a17:907:d407:b0:a02:ad84:3ab3 with SMTP id vi7-20020a170907d40700b00a02ad843ab3mr14530386ejc.44.1701301964732;
        Wed, 29 Nov 2023 15:52:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Ukuv1GKWzasfo9LAPEUmsG843xaS5Q/R1hpoDiLL/MvrRWEV6+4Y1JuxN9p0wrwz093U2A==
X-Received: by 2002:a17:907:d407:b0:a02:ad84:3ab3 with SMTP id vi7-20020a170907d40700b00a02ad843ab3mr14530375ejc.44.1701301964478;
        Wed, 29 Nov 2023 15:52:44 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id qc14-20020a170906d8ae00b009a9fbeb15f2sm15030ejb.62.2023.11.29.15.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 15:52:44 -0800 (PST)
Message-ID: <f5a69710-f1a6-444d-9d2a-7c07589a2bdc@redhat.com>
Date: Thu, 30 Nov 2023 00:52:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver: gpu: Fix warning directly dereferencing a rcu
 pointer
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Cc: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231126145723.388162-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Abhinav,

Thanks for sending this follow-up patch.

On 11/26/23 15:57, Abhinav Singh wrote:
> Fix a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.
> 
> We should not be directly dereferencing a rcu pointer. To get a normal
> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
> function unrcu_pointer(...). The non __rcu tagged pointer then can be
> dereferenced just like a normal pointer.

Can you please add a brief explanation why unrcu_pointer() is fine here?

> 
> I tested with qemu with this command
> qemu-system-x86_64 \
> 	-m 2G \
> 	-smp 2 \
> 	-kernel bzImage \
> 	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
> 	-drive file=bullseye.img,format=raw \
> 	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
> 	-net nic,model=e1000 \
> 	-enable-kvm \
> 	-nographic \
> 	-pidfile vm.pid \
> 	2>&1 | tee vm.log
> with lockdep enabled.

How is that relevant for this patch?

- Danilo

> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
>   drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
> index c6a0db5b9e21..845b64c079ed 100644
> --- a/drivers/gpu/drm/nouveau/nv10_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv10_fence.c
> @@ -32,7 +32,7 @@
>   int
>   nv10_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>   	int ret = PUSH_WAIT(push, 2);
>   	if (ret == 0) {
>   		PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
> index 812b8c62eeba..d42e72e23dec 100644
> --- a/drivers/gpu/drm/nouveau/nv84_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv84_fence.c
> @@ -85,7 +85,7 @@ nv84_fence_chid(struct nouveau_channel *chan)
>   static int
>   nv84_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nouveau_channel *chan = fence->channel;
> +	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
>   	struct nv84_fence_chan *fctx = chan->fence;
>   	u64 addr = fctx->vma->addr + nv84_fence_chid(chan) * 16;
>   

