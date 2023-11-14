Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D282AEFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOBhll3t"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B915382123
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 16:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B915382123
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MOBhll3t
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AFiW5POOVCL
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 14 Nov 2023 16:24:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A50C5820F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 16:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A50C5820F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699979045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OMAt2bbB2OtDJnSmDdv+SlogJ2MSXP9BdKgitEjjES4=;
	b=MOBhll3t70mujD+V3M6p6KdQro+7Ycw5hYiOhhdGMsMshPkfC6L9yWklMZQmJPu0Ty2gG/
	k/6I+s2QNBHbFnEoS38oTelU9LexWA+chTe1ANEES6HFbJpLTD6Ck0lH3TWD4cr2YEYskD
	J2zNsc8t9ymHmBqsOwYwWb3ElnC8Wnc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-PYJUTvZfNOCzeR46YauqUQ-1; Tue, 14 Nov 2023 11:24:04 -0500
X-MC-Unique: PYJUTvZfNOCzeR46YauqUQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66d159f725cso73805496d6.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 08:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979043; x=1700583843;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMAt2bbB2OtDJnSmDdv+SlogJ2MSXP9BdKgitEjjES4=;
        b=WAOYdYUzbdkN5SNOglyPos9Fe68Ynn4AMYEtm9GjJVEzaa2eJW5wJ4NJrj2ZOXrqiS
         uY8eMYQAW3j3XLBErG37OnU2jaJJ7B0860/69giqrYjIOkEMyZJl3gxfzg2yw5JSG0Ks
         hS9f6oWBI0RN+khzm5yZw9t7A3hlBtTqSwbLeLMKAzWdGQT1C45Rt87ZKlchythsaYo5
         9WLweifH4L1LjJHwRQDkM4rew/cqCz/L9JdQVYEkbh6sxLdLKSyL6z7rypJCzq9VnWKL
         djZ0lF8LHNcrqACPdTW5aBLAuFhiGIHFJ5NjGzcIPyjaA5EHzSMx0RMSpbscVvTCUjIK
         5HJw==
X-Gm-Message-State: AOJu0Yy11pRW0qq0HU4vUR/1VK4x0ztLocQsxebk5BT0aQKa290+y9Yo
	W/2V6Dns0YuoEpXDKyJqoQ9eZX3afn5XhH38BVEWC62CMKMEm1UHxK8ij9JOhcFAgDzSlamnoe8
	nqMhnneGUQ//b8y/VC4NiTVZpo1OoY7pgsLtx9NgY0jC38qT3
X-Received: by 2002:a05:6214:326:b0:66d:630a:79b9 with SMTP id j6-20020a056214032600b0066d630a79b9mr2571519qvu.40.1699979043489;
        Tue, 14 Nov 2023 08:24:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi30kHAx5KL8eGl/LlTeExArejiri6J6i2eS/UN/F1fLR88NH5AhNiHw7NXj2GlJ54m2/4ew==
X-Received: by 2002:a05:6214:326:b0:66d:630a:79b9 with SMTP id j6-20020a056214032600b0066d630a79b9mr2571490qvu.40.1699979043228;
        Tue, 14 Nov 2023 08:24:03 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ee11-20020a0562140a4b00b0066d0ab215b5sm3054571qvb.13.2023.11.14.08.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 08:24:02 -0800 (PST)
Message-ID: <6a1ebcef-bade-45a0-9bd9-c05f0226eb88@redhat.com>
Date: Tue, 14 Nov 2023 17:23:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Prevents NULL pointer dereference in
 nouveau_uvmm_sm_prepare
To: Yuran Pereira <yuran.pereira@hotmail.com>, airlied@gmail.com
Cc: kherbst@redhat.com, lyude@redhat.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <DB3PR10MB6835FA6E15F3C830FC793D2EE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <DB3PR10MB6835FA6E15F3C830FC793D2EE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yuran,

On 10/26/23 19:03, Yuran Pereira wrote:
> There are instances where the "args" argument passed to
> nouveau_uvmm_sm_prepare() is NULL.
> 
> I.e. when nouveau_uvmm_sm_prepare() is called from
> nouveau_uvmm_sm_unmap_prepare()
> 
> ```
> static int
> nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
> ...
> {
>      return nouveau_uvmm_sm_prepare(uvmm, new, ops, NULL);
> }
> ```
> 
> The problem is that op_map_prepare() which nouveau_uvmm_sm_prepare
> calls, dereferences this value, which can lead to a NULL pointer
> dereference.

op_map_prepare() can't be called with `args` being NULL, since when called
through nouveau_uvmm_sm_unmap_prepare() we can't hit the DRM_GPUVA_OP_MAP
case at all.

Unmapping something never leads to a new mapping being created, it can lead
to remaps though.

> 
> ```
> static int
> op_map_prepare(struct nouveau_uvmm *uvmm,
> ...
> {
>      ...
>      uvma->region = args->region; <-- Dereferencing of possibly NULL pointer
>      uvma->kind = args->kind;     <--
>      ...
> }
> ```
> 
> ```
> static int
> nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
> ...
>              struct uvmm_map_args *args)
> {
>      struct drm_gpuva_op *op;
>      u64 vmm_get_start = args ? args->addr : 0;
>      u64 vmm_get_end = args ? args->addr + args->range : 0;
>      int ret;
> 
>      drm_gpuva_for_each_op(op, ops) {
>          switch (op->op) {
>          case DRM_GPUVA_OP_MAP: {
>              u64 vmm_get_range = vmm_get_end - vmm_get_start;
> 
>              ret = op_map_prepare(uvmm, &new->map, &op->map, args); <---
>              if (ret)
>                  goto unwind;
> 
>              if (args && vmm_get_range) {
>                  ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
>                                 vmm_get_range);
>                  if (ret) {
>                      op_map_prepare_unwind(new->map);
>                      goto unwind;
>                  }
>              }
>      ...
> ```
> 
> Since the switch "case DRM_GPUVA_OP_MAP", also NULL checks "args"

This check is not required for the reason given above. If you like, you
can change this patch up to remove the args check and add a comment like:

/* args can't be NULL when called for a map operation. */

> after the call to op_map_prepare(), my guess is that we should
> probably relocate this check to a point before op_map_prepare()
> is called.

Yeah, I see how this unnecessary check made you think so.

- Danilo

> 
> This patch ensures that the value of args is checked before
> calling op_map_prepare()
> 
> Addresses-Coverity-ID: 1544574 ("Dereference after null check")
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index aae780e4a4aa..6baa481eb2c8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -620,11 +620,14 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
>   		case DRM_GPUVA_OP_MAP: {
>   			u64 vmm_get_range = vmm_get_end - vmm_get_start;
>   
> +			if (!args)
> +				goto unwind;
> +
>   			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
>   			if (ret)
>   				goto unwind;
>   
> -			if (args && vmm_get_range) {
> +			if (vmm_get_range) {
>   				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
>   							   vmm_get_range);
>   				if (ret) {

