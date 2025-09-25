Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160531C695
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814018; cv=none; b=Bepjcm9RX08vo88Muy53gnnnuGdQZV8ngUzkq//SPASSfK6htqC/cjjhFkrSfEGC19MT7Qorpjt2g9EHcLNGygtrqTHOG9J3TBcTa9FIoj3fdKr6hIXqoWQVQwGJY/4KlDgQM9gWfgIUt4J4UkzIztW+FsHDmrFBgUO8HWUUU60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814018; c=relaxed/simple;
	bh=M0BwKYTKOwG+97x6OWWGb8iaLDGyWUbHd+kuVNpzX7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic3x8uyAAS4ZlmlLTkzFLS5J4gMaYuxlLkyZEHv0649vgHlvVjSBqaenSzg9ylG2c4kS7N0fakHxonjxchdLbvEL/6yFSEmxXNyGx8J+id+KmaX5rrCAqlvEgoJlcbgh7XLcQxVTeIOvREleo80r3e8SRdKDm5OvcGaLvKZpgQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4wUkxXS; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4wUkxXS"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC7061496
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 15:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyzX1T489dbT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 15:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8556613E3
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8556613E3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S4wUkxXS
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B8556613E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 15:26:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b2d0e205ca1so21274066b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814014; x=1759418814; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4GUf5N/3YbcyD+8Oivhe9ak/JJo3vnWEVVy0baHt1Y=;
        b=S4wUkxXSxthQ3hmwaYDAXWVZNA1BpddZnSX51g/42AISaE4SjE2OaMqxKZs2UmzeYe
         nI0O5HYiAckGVYQDIdEvV5JgHIi9ReWhV8SSJoqhp7DGHQFEK/r1RhYi5NsrHHT/0auF
         oyMVECNP/x18wrbEOugrRbsXIdYai5Vjfyljkulplp362erYDlC1vcTlhzghoLlATbun
         Kkl0nxgmguVcYgH62dHZ//TRSQIGaaj8aLhwMKq4ogUwtT2drBocjGmNWrSszOL/b+RC
         i1ASF4lcI+rI7uQrxFwKGucNMv/oCyodm7Wv0KOWwxW9DKCnI/zPEOaa8CokbZ8HcfuL
         1Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814014; x=1759418814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4GUf5N/3YbcyD+8Oivhe9ak/JJo3vnWEVVy0baHt1Y=;
        b=HofAiLMpVvhc3yVWxjjcXG1hOrZ9Ec3nsV011f2QI0/lHt0yADNVhvjNwkAZ4sZ+CH
         vaSowK2DhaFW+gVbOmyQMly9XNySA20TcEnwkRyifDT5bUseXz0FXV1cPAeo39y1WjdX
         PJTIQqdBxiD3WzK8LcRi3BFu2Ise1NRJ43YvyWIBmqAb5EYuEQ2aUyda8niQrdZECjOn
         94YhQfm5y/BOlqShRIG0ksGxIujWi5VNNVI57MZK1YOclg5dpqJx9RXCeEbhEDtlol1D
         BKQA9QpbKm9PwIik3lJu2ibOyPDMjupizJVaGI3Dy7mp7pEt0pQ+/Diag8kTcN0FT79z
         U9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLQF3Zq/ehjGLCdSF8MElgK3yUfR5OLjANwtUxUua/sc8AR7iZaXC+mHcv0Cs3+gg3d4WtPqLf0QUjYDPLPFih8vjFpA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzMR4bHDiGcNA5fHeohIr5UWsp2QJzBBEa5l8wWojEWyGUO5ztm
	u+jYBrb4dDUVbVcofRnJSihG2xvAVIAx5Wd+UqgyYz3lvYlNox0OJ9LG
X-Gm-Gg: ASbGncu1KbrX8bwSPrsCbz9MS9+g9STQyGZTaIMkOPCHsWAAUevkslz+Eu/ucsi6Q45
	PI9g/pooOO+jMMdK8RDz87ErfWcyqj0IqLYAzGYunWOmLfmYIP70doSuoE/kX6GJY857Xe4kWDP
	e7OgeOTc8QgAwCoRA1Z+6vbsPN16VSD0QeNIZTqBIUDSVftfyNxsCFuW2H9QalLV3CF6rxLzqVG
	gemeD2RRqnZU58LY4Y7mxpjNtVugeGtS6HRtzInXPeclcjNamFcHeIeHurH+NgujVPUE2oEt5Lj
	UAlrJnN3xo6+Qg48ZOWaOcuNJF6HZWTtzrjfMIWC6gg0ZTSXmazsRxmYlCm5tFxtLQmxUFOpI5e
	dGva5BTXX0Y0SSDn6kNNGepi+KoH7T2WdGmdYHpVYwQ==
X-Google-Smtp-Source: AGHT+IGDiS7N74oVbf2PUhKEBndwAEuvYhlHAhqWKLDD7n6ktQyQUWHg2Hw3sa9zB3n6Bnm5oDSerA==
X-Received: by 2002:a17:907:1c15:b0:b04:2d89:5d3a with SMTP id a640c23a62f3a-b34bde1e594mr225468166b.7.1758814013323;
        Thu, 25 Sep 2025 08:26:53 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.26.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f87511dsm192990966b.43.2025.09.25.08.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:26:53 -0700 (PDT)
Message-ID: <4b77c830-2a7d-444a-adeb-4d1370f8923f@gmail.com>
Date: Thu, 25 Sep 2025 17:26:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests/bpf: Prepare to add -Wsign-compare for
 bpf tests
To: Daniel Borkmann <daniel@iogearbox.net>, andrii@kernel.org,
 eddyz87@gmail.com, ast@kernel.org, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com,
 ameryhung@gmail.com, toke@redhat.com, houtao1@huawei.com,
 emil@etsalapatis.com, yatsenko@meta.com, isolodrai@meta.com,
 a.s.protopopov@gmail.com, dxu@dxuuu.xyz, memxor@gmail.com,
 vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org,
 gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, James.Bottomley@HansenPartnership.com,
 mrpre@163.com, jakub@cloudflare.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 mptcp@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
 <20250925103559.14876-4-mehdi.benhadjkhelifa@gmail.com>
 <5ad26663-a3cc-4bf4-9d6f-8213ac8e8ce6@iogearbox.net>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <5ad26663-a3cc-4bf4-9d6f-8213ac8e8ce6@iogearbox.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/25/25 4:04 PM, Daniel Borkmann wrote:
> On 9/25/25 12:35 PM, Mehdi Ben Hadj Khelifa wrote:
>> -Change only variable types for correct sign comparisons
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> 
> Pls write some better commit messages and not just copy/paste the same 
> $subj/
> message every time; proper sentences w/o the weird " -" indent.

Understood, though the changes are very similar / are the same with the 
same goal that's why it made sense to me to do that and I will remove 
the - in future commits.> Also say
> why
> this is needed in the commit message, and add a reference to the commit 
> which
> initially added this as a TODO, i.e. 495d2d8133fd ("selftests/bpf: 
> Attempt to
> build BPF programs with -Wsign-compare"). 
I will do that in the upcoming version.

> If you group these, then maybe 
> also
> include the parts of the compiler-emitted warnings during build which are
> relevant to the code changes you do here.

Okay. I will do that. Should i send a v4 with the recommended changes 
but not including the rest of the files meaning the ones that I haven't 
uploaded in this patch series which contain type casting or should i 
just make changes for these files in this series?
Also will it be better if dropped these versions and made a new patch 
with v1?

Thank you for your review and time Daniel.
Regards,
Mehdi
>> ---
>>   tools/testing/selftests/bpf/progs/test_xdp_dynptr.c          | 2 +-
>>   tools/testing/selftests/bpf/progs/test_xdp_loop.c            | 2 +-
>>   tools/testing/selftests/bpf/progs/test_xdp_noinline.c        | 4 ++--
>>   tools/testing/selftests/bpf/progs/uprobe_multi.c             | 4 ++--
>>   .../selftests/bpf/progs/uprobe_multi_session_recursive.c     | 5 +++--
>>   .../selftests/bpf/progs/verifier_iterating_callbacks.c       | 2 +-
>>   6 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c b/ 
>> tools/testing/selftests/bpf/progs/test_xdp_dynptr.c
>> index 67a77944ef29..12ad0ec91021 100644
>> --- a/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c
>> +++ b/tools/testing/selftests/bpf/progs/test_xdp_dynptr.c
>> @@ -89,7 +89,7 @@ static __always_inline int handle_ipv4(struct xdp_md 
>> *xdp, struct bpf_dynptr *xd
>>       struct vip vip = {};
>>       int dport;
>>       __u32 csum = 0;
>> -    int i;
>> +    size_t i;
>>       __builtin_memset(eth_buffer, 0, sizeof(eth_buffer));
>>       __builtin_memset(iph_buffer_tcp, 0, sizeof(iph_buffer_tcp));
>> diff --git a/tools/testing/selftests/bpf/progs/test_xdp_loop.c b/ 
>> tools/testing/selftests/bpf/progs/test_xdp_loop.c
>> index 93267a68825b..e9b7bbff5c23 100644
>> --- a/tools/testing/selftests/bpf/progs/test_xdp_loop.c
>> +++ b/tools/testing/selftests/bpf/progs/test_xdp_loop.c
>> @@ -85,7 +85,7 @@ static __always_inline int handle_ipv4(struct xdp_md 
>> *xdp)
>>       struct vip vip = {};
>>       int dport;
>>       __u32 csum = 0;
>> -    int i;
>> +    size_t i;
>>       if (iph + 1 > data_end)
>>           return XDP_DROP;
>> diff --git a/tools/testing/selftests/bpf/progs/test_xdp_noinline.c b/ 
>> tools/testing/selftests/bpf/progs/test_xdp_noinline.c
>> index fad94e41cef9..85ef3c0a3e20 100644
>> --- a/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
>> +++ b/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
>> @@ -372,7 +372,7 @@ bool encap_v4(struct xdp_md *xdp, struct ctl_value 
>> *cval,
>>       next_iph_u16 = (__u16 *) iph;
>>       __pragma_loop_unroll_full
>> -    for (int i = 0; i < sizeof(struct iphdr) >> 1; i++)
>> +    for (size_t i = 0; i < sizeof(struct iphdr) >> 1; i++)
>>           csum += *next_iph_u16++;
>>       iph->check = ~((csum & 0xffff) + (csum >> 16));
>>       if (bpf_xdp_adjust_head(xdp, (int)sizeof(struct iphdr)))
>> @@ -423,7 +423,7 @@ int send_icmp_reply(void *data, void *data_end)
>>       iph->check = 0;
>>       next_iph_u16 = (__u16 *) iph;
>>       __pragma_loop_unroll_full
>> -    for (int i = 0; i < sizeof(struct iphdr) >> 1; i++)
>> +    for (size_t i = 0; i < sizeof(struct iphdr) >> 1; i++)
>>           csum += *next_iph_u16++;
>>       iph->check = ~((csum & 0xffff) + (csum >> 16));
>>       return swap_mac_and_send(data, data_end);
>> diff --git a/tools/testing/selftests/bpf/progs/uprobe_multi.c b/tools/ 
>> testing/selftests/bpf/progs/uprobe_multi.c
>> index 44190efcdba2..f99957773c3a 100644
>> --- a/tools/testing/selftests/bpf/progs/uprobe_multi.c
>> +++ b/tools/testing/selftests/bpf/progs/uprobe_multi.c
>> @@ -20,13 +20,13 @@ __u64 uretprobe_multi_func_3_result = 0;
>>   __u64 uprobe_multi_sleep_result = 0;
>> -int pid = 0;
>> +__u32 pid = 0;
>>   int child_pid = 0;
>>   int child_tid = 0;
>>   int child_pid_usdt = 0;
>>   int child_tid_usdt = 0;
>> -int expect_pid = 0;
>> +__u32 expect_pid = 0;
>>   bool bad_pid_seen = false;
>>   bool bad_pid_seen_usdt = false;
>> diff --git a/tools/testing/selftests/bpf/progs/ 
>> uprobe_multi_session_recursive.c b/tools/testing/selftests/bpf/progs/ 
>> uprobe_multi_session_recursive.c
>> index 8fbcd69fae22..017f1859ebe8 100644
>> --- a/tools/testing/selftests/bpf/progs/uprobe_multi_session_recursive.c
>> +++ b/tools/testing/selftests/bpf/progs/uprobe_multi_session_recursive.c
>> @@ -3,6 +3,7 @@
>>   #include <bpf/bpf_helpers.h>
>>   #include <bpf/bpf_tracing.h>
>>   #include <stdbool.h>
>> +#include <stddef.h>
>>   #include "bpf_kfuncs.h"
>>   #include "bpf_misc.h"
>> @@ -10,8 +11,8 @@ char _license[] SEC("license") = "GPL";
>>   int pid = 0;
>> -int idx_entry = 0;
>> -int idx_return = 0;
>> +size_t idx_entry = 0;
>> +size_t idx_return = 0;
>>   __u64 test_uprobe_cookie_entry[6];
>>   __u64 test_uprobe_cookie_return[3];
>> diff --git a/tools/testing/selftests/bpf/progs/ 
>> verifier_iterating_callbacks.c b/tools/testing/selftests/bpf/progs/ 
>> verifier_iterating_callbacks.c
>> index 75dd922e4e9f..72f9f8c23c93 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_iterating_callbacks.c
>> @@ -593,7 +593,7 @@ int loop_inside_iter_volatile_limit(const void *ctx)
>>   {
>>       struct bpf_iter_num it;
>>       int *v, sum = 0;
>> -    __u64 i = 0;
>> +    __s32 i = 0;
>>       bpf_iter_num_new(&it, 0, ARR2_SZ);
>>       while ((v = bpf_iter_num_next(&it))) {
> 

