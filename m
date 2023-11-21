Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007F2D603
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDu9V0Ku"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37AE60FEB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 08:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E37AE60FEB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fDu9V0Ku
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUiKnOwbZhy0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 08:59:59 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0A8F460FEA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 08:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A8F460FEA
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cf73e25b72so118535ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 00:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700557198; x=1701161998; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJ/AFKPeVxjAnYg0rcHdI79h+dhe0CVTx872xJ/48GQ=;
        b=fDu9V0Kuuu0H1ns3gYS1vz3/J+4yGrtS2Gr0k+htCozgzK/OHgkSgAhlgjraRd1Be1
         +DzmadlnmbqSeHo8GiRoXrX13b1Rx1ePdS3uB65yZc6GAv7670joeMBw5mu4dafvkntZ
         IBW+cEzJN48TgObeE3sefSi3x1sSXBV00mI4/t4kdR5ILkTNmMyeUWMXsKO9AYMz9A/S
         HjZl98D0hoNgiUWtJkHj8LmOrD9ubxL28aSWbhg0MU4nt9BsgbHFqfww+O0oxp6fMTuJ
         v48vJgD5tQBgO2xqaqWUUPfOg0B3fDUHNxqCXdM2Od7OEQ/mtJCWRDV82ALA4CLg/oXU
         dCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557198; x=1701161998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ/AFKPeVxjAnYg0rcHdI79h+dhe0CVTx872xJ/48GQ=;
        b=CRzJ5Ydlvee5OVoEcw9jQ7NqEUJwxCCJSGwIfYAX/LsiPr8a8ILAQBhl3FGpRBaJ8J
         uTi85kbbmIVdcXuk3vdrknaTNKyeVZqhma23j+P4xie4HBORFStznzwtoARhSlJvHnUS
         4SPJyUg/z/FUug6i8ZHJhjLzaEbGnHxYIXNhWO/nKzhbeLs7nwGJSfRrszu9UnDoXeiu
         85XTpFc8URRqSXeGjOlZmdH2hRsA62pH9y0OajNEm7oMSj/EFHOK0UrCL8xqAPnvtG1+
         d7+chDhu6l9zEeWbSC6Nya/5KRm4XMjDLP/VVOa5ymdlnQ9pGOxB3Ff82b37kfcLtJTN
         Q6qw==
X-Gm-Message-State: AOJu0YzgDJWXN1q71S1TO30mm5/SwmklSAF7fK2P7o1AmubtS1HNp4/S
	RIU9KIHw+hLL/sWNJuJgYRQ=
X-Google-Smtp-Source: AGHT+IHuciNeLfXvkTnSw1GZl4bJP7c7mXwIB2Y7kIFG4zpwMN7QUV1San6rTxEbjcx5PX2Gvul0Yg==
X-Received: by 2002:a17:902:eccd:b0:1cf:6a75:e989 with SMTP id a13-20020a170902eccd00b001cf6a75e989mr3141227plh.6.1700557198184;
        Tue, 21 Nov 2023 00:59:58 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.209])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001bbb7af4963sm7401133plg.68.2023.11.21.00.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:59:57 -0800 (PST)
Message-ID: <38a45214-7cd0-482a-a330-65c5be488fba@gmail.com>
Date: Tue, 21 Nov 2023 14:29:58 +0530
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
To: Danilo Krummrich <dakr@redhat.com>, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <8e9efe54-2799-4539-a8b0-aa199f8052f6@redhat.com>
 <20231113191303.3277733-1-singhabhinav9051571833@gmail.com>
 <0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <0754e669-8b00-461c-b6fe-79c659bf59a3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/21/23 06:50, Danilo Krummrich wrote:
> On 11/13/23 20:13, Abhinav Singh wrote:
>> This patch fixes a sparse warning with this message
>> "warning:dereference of noderef expression". In this context it means we
>> are dereferencing a __rcu tagged pointer directly.
>>
>> We should not be directly dereferencing a rcu pointer. To get a normal
>> (non __rcu tagged pointer) from a __rcu tagged pointer we are using the
>> function unrcu_pointer(...). The non __rcu tagged pointer then can be
>> dereferenced just like a normal pointer.
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
> 
> Applied, thanks!
> 
> There are a few more such occurrences. [1][2] Plan to fix them as well?
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv10_fence.c#L35
> [2] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nv84_fence.c#L88
> 
>> ---
>> v1 -> v2 : Replaced the rcu_dereference(...) with unrcu_pointer(...) and
>>             also removed the rcu locking and unlocking function call.
>> v2 -> v3 : Changed the description of the patch to match it with the 
>> actual
>>        implementation.
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
Thanks a lot for merging this.
Yeah sure I will submit the patch for the issues soon.

Regards,
Abhinav Singh
