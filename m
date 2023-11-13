Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7623749
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPmvI2w0"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB5940129
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB5940129
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aPmvI2w0
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxsgrnGc8QTM
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 19:31:44 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4207F40123
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 19:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4207F40123
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c48fad2f6dso767962b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 11:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699903903; x=1700508703; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ya4lKSeDeZMEtHM/vOqEa/CuouJ2vfBkewF1j97GI=;
        b=aPmvI2w0wwdFG/oXR2x/Eugd/BPXY4hbUmSfc5XrzPyZM2WUTG5otFPI2iPlN2yWFs
         rT+U/Dj9SG1HFDPvUVjJfD1CKAyELiTS1WAsjGrKYAJY9PWegcYgYmzRXVTpzko/UiMk
         qhvNYsnsBWb0Mu85MnjxTLYxod77Jgqkpo6QUaBYpWaCACS4lxkC+07g2Kdlm5v++Mg1
         yuZVn1kHbCvkoZ02iA3/FT10/9KhIyvqTM68n3HhtC1VQsAWroDfAGEZNrvKdNeIksJs
         vBUYtZS9WJcUkTzpWuOwfBMhLaDTM/Iliv/CYDbLyhESRE+FLsWKbNlGOTAahjmas8B4
         6SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699903903; x=1700508703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ya4lKSeDeZMEtHM/vOqEa/CuouJ2vfBkewF1j97GI=;
        b=kU7Zbiasvna96Qs2j0IjxN8XU97nnEKhT48qW+5gnw5BVbBmNUvSwYmZRWM13EY+sA
         /yDrlXE65RZbfVQjPdmfHQRUHHr+f/bExQK3Y+xHq+/ETHmshsG/vE3gG/4rWm7TE0KX
         LRh82pn7OYF87ZQYlof7x6nW8X5xAS5SLyfOW2EpXFZP+wKsHgNTIMLDyc6nDZb0nqp/
         /QVH+hYGqCq9I7aF6qtmMgD5gP9x+MP+lYtUIy6Hvcl+q1XNiaigzLHtZFbQahJ2sjsc
         LnIbaWTGXJFR3zpUYVH70jyznecPRyCjlUHRZyXJI1ApUqdyzIgynsdpvWmfVeAT+CrN
         3/Cw==
X-Gm-Message-State: AOJu0YyumsDzKxRTv7wxFzD0r0OpQOoFIMrwan8QIyhu4ArnACqxCMkA
	hXfwW6hxoTvr2YIgdKSp8VU=
X-Google-Smtp-Source: AGHT+IHY3zaBuTI7fce0sQWhI+Z7AUzp84RcB6fLnCjZ28J35T5xGuGiZVl899gjrlTg6KyEo4oT3w==
X-Received: by 2002:a05:6a20:8406:b0:186:e43:c60e with SMTP id c6-20020a056a20840600b001860e43c60emr362303pzd.1.1699903903458;
        Mon, 13 Nov 2023 11:31:43 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.208])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902c19100b001c60c8d6b4asm4369489pld.149.2023.11.13.11.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 11:31:42 -0800 (PST)
Message-ID: <1b5836af-3dbd-4031-a759-01f9885777bf@gmail.com>
Date: Tue, 14 Nov 2023 01:01:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
Content-Language: en-US
To: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
 <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/23 00:43, Abhinav Singh wrote:
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
Hi, just for the sake of my own confirmation, the patch is merge ready 
right? once the CI runs successfully it will be merged right?


Thank You,
Abhinav Singh
