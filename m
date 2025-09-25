Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167E278E41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790658; cv=none; b=smDXMF4lrpv4CvCZ3dAajElNdMT/9Y8OURuW+aiIeHpw8mDGsQy9nUDyFLGUXQ6xoZHKGmzjSoZadZUL4hVYTB1o4c404jrIgQJCihlKX8Uq4pY9MswpdU9FpMHctNDz8XtZmQ2FcQYgTE28sdwUX7Ic29ArkyMO2rmaK5aoZMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790658; c=relaxed/simple;
	bh=QQ2vjrQn/Zieqm61suYuD8VfLZgZWU8v8LJfcKU4ZZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTY6ZHg7jgnO+LpXKb1ziumrEx6adoGgnHXkoVRMNjQgW5HKT0YNVoXJjVUNjBWADdfzSk6kw4lZZP5cGDNydEtH2K98BUyL6iEGdQUWSa7C7pXxdV5ThtkTbIJ1ywzh1NGbUPDjOzv/obPM2EH3QAAw8XHbJTWMdqrFAmBiFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs9+/T6s; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs9+/T6s"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47E5A40B7B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 08:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjFSFq2lUU3P for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 08:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A4F940BB8
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A4F940BB8
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fs9+/T6s
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4A4F940BB8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 08:57:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b331d5cad07so10916666b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758790654; x=1759395454; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1ieKdh8ZnL9X5ENVHhQYpO7ehaHx1VKRXFWr/P98Bs=;
        b=Fs9+/T6smeBGKzHiY4rFGiKLYmzYBI01c74lbSUm6l5vfCKTLjJsvN+OCH5nytUpZl
         BPMjsn5NRgrd0cHpkLHBmEgYqMFhYVEIcJbesMH0XKfxEPM/wIhJU7vjJNdef/Lhwshk
         Yt/n5G2Nql8T+0U1A2XB58nENhwa4NPwDHL2upe5nQZqSenskuP68kAJ4bYpHiBKgehk
         yfehB/qZei9qLbP00NnPnW2oqHVq/JDDTLbXvme6bnk7Acf9wRglkA5DjqL+NSS8g9ml
         wzIO++pK/TD6TNci+MsthtZOiNVDgnkYVAas9sJQY/Qasn63ht5pq7wxD76bzOyDUlBK
         JC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790654; x=1759395454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1ieKdh8ZnL9X5ENVHhQYpO7ehaHx1VKRXFWr/P98Bs=;
        b=g5jm+1wQP/UxMoP9pGAvLKm9XRZyvxCn6N2qwadkngVt1CKtfyQcEhrbPSRozpF0/D
         +xZQwe/EvVEzlF1jEm0fEZ0PpemcL8k/vZ9GUrN/AD+biRv64kPNE5vB/YyQORA0AE51
         +JqqNIHwJ5g2qt2BhHtxLMV35p4Hs13A9lK4b0Bp5vZT/3hD2tkK09dcM4E49uA5z0OF
         Afr3rrK4wxStKhP80PmXYl7G3/OKf2uaVALjog25d2UJ3910yy8zfTuS/INI+ylAISsz
         l+xz0fyvC2miWDsZKuwRSm4T/WRp2cGxJi+noZneuZnoWRFAXQSXGUXdyw2a0efvF3Aw
         0pqw==
X-Forwarded-Encrypted: i=1; AJvYcCWN/lXAgdMGMsVFiMi5r6izzdyHPcQCt6kkKGyL6CPU8kH6I8scJIJkJSKHDxGwQipTfLvftOqG4Erhb3ipgPQBNc/SZQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzDNBWaJk6TRstUmreSo2ZI/btTkdYgTUNU+mancvJKqd6hMcoU
	Oqi1hMuWDINqaOzw/Ru675NSlNcFCLR6w1D7OOYffeqQyDE2wxHbDhyG
X-Gm-Gg: ASbGncuMcHt4RgpEyUt8qrRkzirRl8911fVeD1kpdpfdgPtfCp1Bv4Bk15Wa8Arij2t
	RD2+3216/CPR4B7a1EGxyf9Z23lAeXCbMe4gwkqU3vjFHSBC25PVq26XUYwENnwZY+5ou7+c7pV
	stpAGn5bgUFz1ZsQVi1WM2vpdNGA1VSMYe88eELnorhNeO8y9XiYFtS+8lCzITyqfOiNxKe3pCy
	D3krOVn6ZU662cAOzsrnQVzjtJZo8qqyPM5u7oWFzlVDhk8P3Ooo1/YkFVP2TClXNprv3wjIh9w
	N7NNRYUQUrEYlSPwCQGM9zyir8pf4L2rqwuf11FctCN381L7+DibjPnl+kiARO8ZX717GAh5REt
	OsMVBgMMbIpdOBd38y2AWkd+Gk0ZSpgnMq+Md8n8pP20=
X-Google-Smtp-Source: AGHT+IHgxhg/8L0HWZrIRreMxlREkgm0qw2qxTqKaDyvZUongIqmZ+eF5XRwzrB4DjOfUfKpvkk3Ig==
X-Received: by 2002:a17:906:f599:b0:b0c:ac7d:474f with SMTP id a640c23a62f3a-b34bfe4619bmr131647766b.10.1758790653822;
        Thu, 25 Sep 2025 01:57:33 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efb8903sm123418466b.33.2025.09.25.01.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:57:33 -0700 (PDT)
Message-ID: <9773fb16-d497-4d67-804d-0c6e70def886@gmail.com>
Date: Thu, 25 Sep 2025 10:57:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
To: Stanislav Fomichev <stfomichev@gmail.com>, lorenzo@kernel.org
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
 <aNMG2X2GLDLBIjzB@mini-arch> <f103da72-0973-4a45-af81-ec1537422433@gmail.com>
 <aNRxRRSfjOzSPNks@mini-arch>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <aNRxRRSfjOzSPNks@mini-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 11:31 PM, Stanislav Fomichev wrote:
> On 09/24, Mehdi Ben Hadj Khelifa wrote:
>> On 9/23/25 9:45 PM, Stanislav Fomichev wrote:
>>> On 09/23, Mehdi Ben Hadj Khelifa wrote:
>>>> ---
>>>> Mehdi Ben Hadj Khelifa (4):
>>>>     netlink: specs: Add XDP RX queue index to XDP metadata
>>>>     net: xdp: Add xmo_rx_queue_index callback
>>>>     uapi: netdev: Add XDP RX queue index metadata flags
>>>>     net: veth: Implement RX queue index XDP hint
>>>>
>>>>    Documentation/netlink/specs/netdev.yaml |  5 +++++
>>>>    drivers/net/veth.c                      | 12 ++++++++++++
>>>>    include/net/xdp.h                       |  5 +++++
>>>>    include/uapi/linux/netdev.h             |  3 +++
>>>>    net/core/xdp.c                          | 15 +++++++++++++++
>>>>    tools/include/uapi/linux/netdev.h       |  3 +++
>>>>    6 files changed, 43 insertions(+)
>>>>    ---
>>>>    base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
>>>>    this is the commit of tag: v6.17-rc7 on the mainline.
>>>>    This patch series is intended to make a base for setting
>>>>    queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>>>    the right index. Although that part I still didn't figure
>>>>    out yet,I m searching for my guidance to do that as well
>>>>    as for the correctness of the patches in this series.
>>
>>>
> I don't really understand what queue_index means for the cpu map. It is
> a kernel thread doing work, there is no queue. Maybe whoever added
> the todo can clarify?

Hi Lorenzo,
Can you help us clarify the todo added in cpu_map_bpf_prog_run_xdp() in 
this commit: 
github.com/torvalds/linux/commit/9216477449f33cdbc9c9a99d49f500b7fbb81702 ?

Regards,
Mehdi
