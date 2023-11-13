Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33D1DA4D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+ld58np"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B32460A9C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B32460A9C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+ld58np
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gen2OoBol5t6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 13 Nov 2023 18:55:30 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DA75360A88
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 18:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA75360A88
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6c48fad2f6dso758621b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Nov 2023 10:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699901730; x=1700506530; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+f4rJoyzPIE0y6h0wORDQt+kRBF7nK+PXXMCBjyvGI=;
        b=V+ld58npkbVrY8oEBqTsiSPSZKTThi9Iz2zMy+aVdQ6Ro4b26RmD7GG/1DPpsbBHlP
         CZN7frAX1tnqR+wQ40vvkffwxulB4v9JefdyGKQfeChw7GxAnW62Ud0tqwsRmNidV0yI
         mwAxJH4c8HjJAYgS7NsdJzOJogDwq1AFsvyYcmbauOTVwaMpp6EtEqqGZefrWxCvjqg1
         psbUeTfvfVQndbGD62vbwUishyeG95Xr7RLjZunmD5ieEfjPj9pjBENv+DHV7h1P95DW
         RTzPIk7ilq4n58eLgmj1D7LstLgTLZlx6ElCz+x+2ak/XQNT+SPrsh0IXReiopk5qS5s
         gMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901730; x=1700506530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+f4rJoyzPIE0y6h0wORDQt+kRBF7nK+PXXMCBjyvGI=;
        b=gngI5MHR8klbWMQJRgluHWzd5ku9U7UO/+Z8wMAf0iAm2AkR1/a8KeiKjdCl4+xjB1
         RbY2RxzcVxU2iAGqgs0vB+5enzcIQUcFJOE4rrYejoBQ9AtvYwmwPLJrVjVavzAszs6h
         tU5jxkq0lXJehjCP4g4KBjVX+XmdcX68Frm8DEiYpXu4CLYqLitl9/Hpjpc9PPBIRgW/
         ZDd0kqZ4UeMOEAOgU2ycCmk1Pa6O3TkNXTwd6Op8I9pe7kKsjXG5/yrHnoMi19Ao4efZ
         l7eqkh+XYxczmD1p9jx16wTQOjBFHk+ReIekQslLdPZbo8PCU3vIyKkop2Ehua0DxQNY
         F7ZA==
X-Gm-Message-State: AOJu0YyCdWUM7cvlSLHtHb/+j9AYsdtdwa2LoGBf2EJFOFYYss4DtRhh
	dLuIgTKwkAWHip0ZWalEUT0=
X-Google-Smtp-Source: AGHT+IE5duZlYWLgqLzfa5RiDEmFjpMM0G68cLOdfphgOn3YyS8OIU25TqGIK0nk9u3XKZly5FW4rQ==
X-Received: by 2002:a05:6a20:9381:b0:163:d382:ba84 with SMTP id x1-20020a056a20938100b00163d382ba84mr130227pzh.5.1699901730166;
        Mon, 13 Nov 2023 10:55:30 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
        by smtp.gmail.com with ESMTPSA id ka27-20020a056a00939b00b0069102aa1918sm4091818pfb.48.2023.11.13.10.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:55:29 -0800 (PST)
Message-ID: <d0b1fb36-d2a6-446c-8a04-2101981f3a00@gmail.com>
Date: Tue, 14 Nov 2023 00:25:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver: gpu: Fixing warning directly dereferencing a
 rcu pointer
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <d33fc41b-5a1f-4186-a0b2-3c82dcb8f00b@redhat.com>
 <20231113184238.3276835-1-singhabhinav9051571833@gmail.com>
 <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <373d97fc-0612-40da-ae9d-6702aa4483ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/23 00:19, Danilo Krummrich wrote:
> Hi,
> 
> thanks for sending a v2.
> 
> On 11/13/23 19:42, Abhinav Singh wrote:
>> This patch fixes a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
> 
> Better use imperative here, e.g. "Fix a sparse warning ...".
> 
> Wouldn't ask you to send a v3 for that alone...
> 
>>
>> We should not be directly dereferencing a rcu pointer, rather we should
>> be using rcu helper function rcu_dereferece() inside rcu read critical
>> section to get a normal pointer which can be dereferenced.
> 
> ...but this doesn't seem accurate anymore as well.
> 
> - Danilo
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
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>> also removed the rcu locking and unlocking function call.
>>
>>   drivers/gpu/drm/nouveau/nv04_fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c 
>> b/drivers/gpu/drm/nouveau/nv04_fence.c
>> index 5b71a5a5cd85..cdbc75e3d1f6 100644
>> --- a/drivers/gpu/drm/nouveau/nv04_fence.c
>> +++ b/drivers/gpu/drm/nouveau/nv04_fence.c
>> @@ -39,7 +39,7 @@ struct nv04_fence_priv {
>>   static int
>>   nv04_fence_emit(struct nouveau_fence *fence)
>>   {
>> -    struct nvif_push *push = fence->channel->chan.push;
>> +    struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
>>       int ret = PUSH_WAIT(push, 2);
>>       if (ret == 0) {
>>           PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
> 
Hi maintainers thanks a lot for reviewing this patch.
I think I should fix my mistake by sending in another patch so that the 
code changes and description matches. So should I send another patch ?

Thank You,
Abhinav Singh
