Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33607224DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IhxQC9/4"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD1DD60D70
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1DD60D70
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IhxQC9/4
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNnPl53ccFqm
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 18:49:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 48AEE60812
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48AEE60812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699901367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J9Fat91VCfWswbfB4dQoar2RJWXbpc4KeUVKZoklMG4=;
	b=IhxQC9/459hFg7pu2vmZ0oJwHmuqDtNl7zE8uv1GZQsbTgFhfW+RWuRKqUqO57Tx951rn3
	Ak3R/jdEPTBan1wnuYkBl4qrRAen8V1iWjbLaS0itAy5D+/b5+EF1K1WEftYF/sLnFfoXB
	4GLDj/ukhbVYx24FeBSk4ZDxZ6Omqlw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-boz86xQeMgeU4sLeXmpodA-1; Mon, 13 Nov 2023 13:49:23 -0500
X-MC-Unique: boz86xQeMgeU4sLeXmpodA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9e28d82339aso306259966b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 10:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901362; x=1700506162;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9Fat91VCfWswbfB4dQoar2RJWXbpc4KeUVKZoklMG4=;
        b=EeaJfUNbzPIh7sUO9v6tGIqi0stkYEo7eS2srefuMmxCrNXBwfXc2KFjTga0Px29LP
         6B4k4DJ++/J5R/h6hwQyaaR0jbHvi0TE3uFeJL2UKh2FBmpXYxsojtGD+SCEzzTwB3d0
         Io2BjAz5s7Gsp6wLOVYwLrfjk9+T4Db+BMfQtmhdFUrLKw5Y2syGDzOIRqbU7VaAdiHv
         iVjWnfp0agJE0OXwvl2O9LoSvnup78+uWvRw8k4eGQNjqKFn8V54f51DC/l25BBpEr4X
         1s3yfMl41EUQ1GmoFTkcjh9pdLjmOBIunRfuv1+ViD1CPknF4tRLwD1gFTWuw43Y1s/x
         MMKA==
X-Gm-Message-State: AOJu0Ywx6XmTGiXEmTDFsoDYiqfVYq16NiEWuDDcsDkvaQzHvFt1/8jh
	jR9JIqWuDgGGxjjGz1znpNEMccaTLh/5MgTuaFRZX3iB9HviDiNwLGgwDQhOQIJ34VjqHSLQJrb
	3YlAspqDM01Ls8daviHVMPFbFeCvf2nnEW0QJN8ssIn7zvYDg
X-Received: by 2002:a17:906:3bd7:b0:9dd:7ccf:77f8 with SMTP id v23-20020a1709063bd700b009dd7ccf77f8mr4957514ejf.20.1699901362783;
        Mon, 13 Nov 2023 10:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ0uVWVogauvgHwe0HaAW2uaROhlGctVUZQkTd5P1FixQh0Rbjuz2KkG7VPVhO+wwo/3DUDA==
X-Received: by 2002:a17:906:3bd7:b0:9dd:7ccf:77f8 with SMTP id v23-20020a1709063bd700b009dd7ccf77f8mr4957500ejf.20.1699901362466;
        Mon, 13 Nov 2023 10:49:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id y24-20020a170906471800b009dda94509casm4368759ejq.102.2023.11.13.10.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:49:21 -0800 (PST)
Message-ID: <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
Date: Mon, 13 Nov 2023 19:49:20 +0100
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thanks for sending a v2.

On 11/13/23 19:42, Abhinav Singh wrote:
> This patch fixes a sparse warning with this message
> "warning:dereference of noderef expression". In this context it means we
> are dereferencing a __rcu tagged pointer directly.

Better use imperative here, e.g. "Fix a sparse warning ...".

Wouldn't ask you to send a v3 for that alone...

> 
> We should not be directly dereferencing a rcu pointer, rather we should
> be using rcu helper function rcu_dereferece() inside rcu read critical
> section to get a normal pointer which can be dereferenced.

...but this doesn't seem accurate anymore as well.

- Danilo

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
> ---
> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
> also removed the rcu locking and unlocking function call.
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

