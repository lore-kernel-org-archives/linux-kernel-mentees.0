Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77682D9EDA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758706848; cv=none; b=ejO/ZAvTN0DoYaVYLaXsWvT8Eh0yI1E8K71jbnwbQnXx5uS75Z50g4FrsC9DhfDir+9LGGFJh03j0Z1koHyq51f/UUzl4ocH2OoBS9W374el+hTyLJYiFt2vYeGyQ0S5Qpu5KkgJcnATAR4h8LkBPtD9QhSj/u/S/kCO15HxNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758706848; c=relaxed/simple;
	bh=jzKLiKmTv/j27SzZOjxIl4Qu+tZgt4ATA7sg5rWQMC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFO8x4NH7lnL1z0NUCueIj+1nnSZ7p4ZHuEf+6gH95Ynt3Tj4qvn5QBB8i6MS/qM6yFJQraSizapTWuXzhBfBeuK2egLPg9EgJlpBksLuj3JMxAOOloxaB4bKnXBl/5hbHB94151tgSouchAEEr7OWScZKh+y2B35FFT+Gj3pHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2a/CN0P; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2a/CN0P"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C1240637
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 09:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBa8lx9wR6QH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Sep 2025 09:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 902EB40092
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902EB40092
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q2a/CN0P
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 902EB40092
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 09:40:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b2d6e91bb66so46085966b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758706836; x=1759311636; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kETfRtb13E45xSUCjG7RsgFFIEDwDhVzUH8S0QeQpIs=;
        b=Q2a/CN0PxuvB2hLwG/oHemK9zvwgEx8YHf5A9WPvTk5o/DLfS0bPAvdC0WuGCPofkv
         H6DzC6OCl9wZ+S8fQIfbw09NtWeJlEOIWjrPUT2eq5ZDPw+X2Nj5s91eXE64jr1PhGnx
         GMZ/K4z95VeoTtDBgPArR5QgEF8XHs9dQkHa6MM6Wvb65omVdfvCu48POmMhhC22NTpi
         ndo/d1Q4B/C/Xz/1zEaNmx6F+5wxwi/QiyZYgPWKI/t12oK+alI9X7JLoK3nIsPAK71w
         UyrFmAGI27nRDGqhRrcoc6WCokqb8R+qNWXuHGckoA7Ohg6suQBUjv9ow8efbWEHh6Nh
         uoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706836; x=1759311636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kETfRtb13E45xSUCjG7RsgFFIEDwDhVzUH8S0QeQpIs=;
        b=EDZIOhRVqkdiKIbyhkH/1VO70EP8FXuOJgefOlSZknNCrkwVTvGSCgt5rc4vH/rfR3
         S6xP8tB9gduaXLxeDh75P0GKod7mSs6CdEQaaV8UpqlSQAP38tb4q5sXST9bcJDt9tK/
         SY470LnD1PEKESRKnbTQRBAZTCVXlhh07VgKwUrXaURUv9ubuovudVfoQqPe7Kpi7MrD
         8JfQ8koA3ucdEjfaB2vVD4G0+o+6v/G+0z5zsPc+TSji2CtCLGDtYeQCkeXTmYqbUjRD
         f4Dq/M2H/sCBmZ2qzGebgJGI4SaLFzshulpgspAu19LFQ7ReSX8s/O+oYbiZNeJ8c2ri
         99kw==
X-Forwarded-Encrypted: i=1; AJvYcCU4EKTckg8ZaUUOoH6oF75zVo9+3xLzy7ZI6ybyUa4OTS6NjYv4GCLsmQyTHdw8NgJ3Vp6ewvAHoAATthwpGPaIVXu32A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwB4pTOP71OXl96fgm5bRF5k9Km8QqPSIOnezIK27vzXtNvjZPR
	PTXgyaMx3OIQJiUV4/VNMJWv/catyWeamG1R03ZNPRu5FJF10y5KiHzc
X-Gm-Gg: ASbGncvq9Ezjg/TVymwuAv7ueaovkWwNGygLwxzRAmuS0JmRtzG09+mYJbYRkmq/nOm
	a8xpxl1RLcMPmXOyzlXWHelKlRhy1WQurPb6muB/g7fT1wYZR0Z91TavYWkEhsLDLeEJ1s9v0Qf
	s0FWNTeU1fLCUSo9TxUle9puTnoQxnNaK0y20oHn84gO4SBDLAHXbfR6pVb8SzmpZ6m2jxNMw4N
	BynMmNVTG0quu+kpEVTnYKOF0d6dixWar2fvrbyzixpppD9vamanjelTDGE494Nq9Nf6gbT6C2M
	bYIijWNnPsXbCZn0e/9HfxuYJMP+w8EPuKG3e2Th4EYnDfUYwOZyX28j4tCV486wcfcS7PprJHd
	O06rQlYbUFbtnNlwli1eQs3Ca969fHEAgIr2uc3eQdSmR1T/pCF8=
X-Google-Smtp-Source: AGHT+IF0eP7C+aQmBPuYKh5yIDRssL3F6YcaqJ1p8ewtObRtDnPBvvunL6qa6AQJ5XZK9rsgzL9BsA==
X-Received: by 2002:a17:907:7b8c:b0:afe:ae6c:4141 with SMTP id a640c23a62f3a-b302689ce0emr223705166b.2.1758706835860;
        Wed, 24 Sep 2025 02:40:35 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.1.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b31a562fe38sm211353166b.45.2025.09.24.02.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:40:35 -0700 (PDT)
Message-ID: <f103da72-0973-4a45-af81-ec1537422433@gmail.com>
Date: Wed, 24 Sep 2025 11:40:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, donald.hunter@gmail.com, andrew+netdev@lunn.ch,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, matttbe@kernel.org, chuck.lever@oracle.com,
 jdamato@fastly.com, skhawaja@google.com, dw@davidwei.uk,
 mkarsten@uwaterloo.ca, yoong.siang.song@intel.com,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org, horms@kernel.org,
 sdf@fomichev.me, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
 <aNMG2X2GLDLBIjzB@mini-arch>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <aNMG2X2GLDLBIjzB@mini-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/25 9:45 PM, Stanislav Fomichev wrote:
> On 09/23, Mehdi Ben Hadj Khelifa wrote:
>> ---
>> Mehdi Ben Hadj Khelifa (4):
>>    netlink: specs: Add XDP RX queue index to XDP metadata
>>    net: xdp: Add xmo_rx_queue_index callback
>>    uapi: netdev: Add XDP RX queue index metadata flags
>>    net: veth: Implement RX queue index XDP hint
>>
>>   Documentation/netlink/specs/netdev.yaml |  5 +++++
>>   drivers/net/veth.c                      | 12 ++++++++++++
>>   include/net/xdp.h                       |  5 +++++
>>   include/uapi/linux/netdev.h             |  3 +++
>>   net/core/xdp.c                          | 15 +++++++++++++++
>>   tools/include/uapi/linux/netdev.h       |  3 +++
>>   6 files changed, 43 insertions(+)
>>   ---
>>   base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
>>   this is the commit of tag: v6.17-rc7 on the mainline.
>>   This patch series is intended to make a base for setting
>>   queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>   the right index. Although that part I still didn't figure
>>   out yet,I m searching for my guidance to do that as well
>>   as for the correctness of the patches in this series.

> But why do you need a kfunc getter? You can already get rxq index
> via xdp_md rx_queue_index.

Hi Stanislav, When i was looking at the available information or recent
similar patches to populate the queue_index in xdp_rxq_info inside of
the cpu map of an ebpf program to run xdp. i stumbled upon this: 
https://lkml.rescloud.iu.edu/2506.1/02808.html

which suggests that in order to that, a struct called "xdp_rx_meta" 
should be the route to do that. In my navigation of code i only found
the closest thing to that is xdp_rx_metadata which is an enum. I tried 
to follow was done for other metadata there like timestamp in order to 
see if that gets me closer to do that. which was stupid with the 
information that i have now but for my lack of experience (this is my 
first patch) i tried to reason with the code.So yeah, since xdp_md is 
the structure for transfering metadata to ebpf programs that use xdp. 
it's useless to have a kfunc to expose queue_index since it's already 
present there. But how would one try to populate the queue_index in 
xdp_rxq_info in cpu_map_bpf_prog_run_xdp()? Any sort of hints or guides 
would be much appreciated.
Thank you for your time.

Best Regards,
Mehdi Ben Hadj Khelifa
