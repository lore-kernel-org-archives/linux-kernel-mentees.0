Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1825CAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BpNSQjRI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734F440321
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 01:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734F440321
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BpNSQjRI
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hp4lKVzKODmv
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 01:20:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 56A854030E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 01:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A854030E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700529650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kCIj+Yck5hQUwyiYPGShSSX7xq3O6mmynZaUoJB6T40=;
	b=BpNSQjRIRB9TcxoqSB8m7P6F1HKoswoaSXB82Cj/4R7TkV11MIVdmYODKio/aeSBCPtgFH
	RNghLu4TioYUbgRTnhgGbk1yxhEWmhsL/RNDlh/xKczQOHc/8Av4suJfcwsNhuqabwV43k
	+44V/gZJfuvTVDyPwUdArYCOwsHeOEs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-8DTV8gxyP5CWvfCHXTrCvw-1; Mon, 20 Nov 2023 20:20:48 -0500
X-MC-Unique: 8DTV8gxyP5CWvfCHXTrCvw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a003328902dso80297466b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 17:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700529647; x=1701134447;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCIj+Yck5hQUwyiYPGShSSX7xq3O6mmynZaUoJB6T40=;
        b=WNsgdh05bbR6r2dY3gUqxOduYW1FjmhUDAa2/2Tyv10EIxXKplDklv/lSouUZrlUYS
         TsLbvALy68nXrIFLj/kYTOcjall8XIeVD8kGVXUxIpYNdCaMb+b/XhEkisnwVluUZ0Lr
         rbrrtC+9X6mNqbfKOz+fUYmLZynj9rbGUPNOQJgow/QY5UVrDeMhqnm4XcIxvXnD6GEG
         MFoSTGDG76pVpTsMqqvTNMZvEbLgTAIaNMKP5rq3wiACDXUN8N1B068dLGRhoenAnj/w
         NtGc0Gi4GdFnAMfzn8Rg3VPUx1+5Vu+lRFZZfghCHDJLxVcFBs7VUBGSjkNwMI7F2MPc
         KCbQ==
X-Gm-Message-State: AOJu0YyAfqltHhG4Yr6VgAw+9lyTnz0vQUzwDCj5jUMfuDUonyLKCMSv
	FlPsPpFYGr+9peBwwNn73zIPKPJYobqJLHVy2GOgaKBGaBO+1D3xNNydujFd4rlTvduOTj1CEl8
	teC8z7MN2n513LqA1pP+dAqbQh6veEFJLCCfVqEro0BU/zXqW
X-Received: by 2002:a17:907:75c2:b0:a00:5a2:1270 with SMTP id jl2-20020a17090775c200b00a0005a21270mr1978739ejc.21.1700529647758;
        Mon, 20 Nov 2023 17:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyBCCXNkml7//Jq8+SMQnK5DKpWB+c9i7u+CTdreYkrRUsU87iIOGRCYGYKmhOrD1fz3e5Zg==
X-Received: by 2002:a17:907:75c2:b0:a00:5a2:1270 with SMTP id jl2-20020a17090775c200b00a0005a21270mr1978732ejc.21.1700529647502;
        Mon, 20 Nov 2023 17:20:47 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709066c8200b009e656ce2930sm4468816ejr.60.2023.11.20.17.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 17:20:46 -0800 (PST)
Message-ID: <0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com>
Date: Tue, 21 Nov 2023 02:20:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, kherbst@redhat.com,
 lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
 <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/23 20:13, Abhinav Singh wrote:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.
> 
> We should not be directly dereferencing a rcu pointer. To get a normal
> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
> function unrcu_pointer(...). The non __rcu tagged pointer then can be
> dereferenced just like a normal pointer.
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
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>

Applied, thanks!

There are a few more such occurrences. [1][2] Plan to fix them as well?

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv10_fence.c#L35
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv84_fence.c#L88

> ---
> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>             also removed the rcu locking and unlocking function call.
> v2 -> v3 : Changed the description of the patch to match it with the actual
> 	   implementation.
> 
>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
> index 5b71a5a5cd85..cdbc75e3d1f6 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>   static int
>   nv04_fence_emit(struct nouveau_fence *fence)
>   {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>   	int ret = PUSH_WAIT(push, 2);
>   	if (ret == 0) {
>   		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);

