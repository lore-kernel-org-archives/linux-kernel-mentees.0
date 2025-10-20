Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9A2749D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975134; cv=none; b=gtlpjJY3v+8dW4PIsGsLJsnKffx1q+53zSH8DtygkVp+k8hvDM/lgv7bZ3ThM8j7u6idw2xbV7lqYcmuobTRrPPLI3fxWdItWLHZuQIbGTbwO/N+2FkE3XGoDIyUULS6ZBmJ20kCR06z2AiMGbREAeJAuY/6mpsanrUtKg1fAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975134; c=relaxed/simple;
	bh=rWlIEOfLt4QSbEFCHlWSDOc4rlXWOXGgHbTI9+CTFCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eW6wEMP12De+hD0CigQQKfmiAmbiR4Tq3YIm1ATJlo4GKL/GBujf4xyrT0apqEuWwrE1LtjLNBrvTCn3KRve7Mq41DkPtkvoe7+efHYbnLT/wuJfY1hA5Ho5yk9mlhnmeW2n4fFpHLqVV5NgYYHq6y5Jge6eTpFzLTS9x2jWfog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG+Y5427; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG+Y5427"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08F8F40FC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 15:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_QcjBJhuKtq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 15:45:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02CB740D17
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02CB740D17
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VG+Y5427
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 02CB740D17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 15:45:31 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b404a8be3f1so103532266b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975130; x=1761579930; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLVd96XUXQkv2BukfYJUOUjTeSFa5/2WoKAq5E06sq8=;
        b=VG+Y5427n41i6NP/oc6ePEO5Ys3OBiQgVDejmZk4QcyzFPlF/wIBng8si4NwhmtY1U
         hMN6+r+EJjST8Alxk5rdUQp7PlweD8P2L47jCnyNeA5lD6QfBpFtNrTwWVHD7RqL3Zlw
         Uf4OPCjig1iUEgG9fObYVI6PX5Ei2xfXcrj+dB01xdm4dFLITpBnRW0lDxSQLWUkt6vc
         SEXz177a2oqMFDaWgRO+zCWGkRkAoyRmtfsdfYzcQ3XoVNdFGJuNhGx9dT7tlxer0V+V
         76Jme5HTDWGNGxdXORuDqsmCUU/ELtWEUyrvKrYm7WT7dibbuhBiTuV+gVODU9CLCM3V
         an/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975130; x=1761579930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLVd96XUXQkv2BukfYJUOUjTeSFa5/2WoKAq5E06sq8=;
        b=So8ivJGCUBhkYYHb3a/BQuhCdVvKNUaQLOeXIW5+Y+URD/JN1+y67FX67ag51+FGbS
         lcVnjXZfTSIrOCiLcWzFR1q9auzpCbBhpjBSNev8EDqqwpRmUjaCgiUzYouBzSrRqEOE
         0OIjUnnwKrTHcQL3VyQCllaKULJcWHvdVcdWnT6ZTNiBQZb8DN2qKhzvtv0W6SSvgj3h
         S2fs20HX2plQTJFM+kPf0kIFab8OGi+/l/U9wnRPtJAazuxNDjoes9gkugi55GOyM/yS
         G+eyrQbxMVDakru2QYKS92kXYrqJwhb4Vw33yg82K8Lu2sXoqHZQ2GfKXdm1+ufNd0xF
         OoMg==
X-Forwarded-Encrypted: i=1; AJvYcCWICewStjVTldmmOQ0juBtjjVXPQUB7cyzrenhszAXuOU/vM192U3S4dl+0s9/EEIYt1I6RFhCp8uVnIYWts+AZ5dsBTQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw5+/L4DRNz394XvMH9zXlmoi9GitxQmL69/ke5P3yGDTaHjoWy
	Pxfwkk9ApSt+lltuk6Yq5r8Zj/zU/J9D8ePm/9gSQZoS8Gga3IbOBLf2
X-Gm-Gg: ASbGnctvQEEgN8JE7pJHYmvP4gU6yVSD9Vbv2n9MMDbjMvQd7UrNYrkbbKAjHE7ONTI
	geJZkPZb7w3x0h87gDBguwfMAYCD0FmALLz8gnZMeAbYv2AT417wfgo6SZuK9z3TG78zkuFzk45
	YzrSw8B1MXdpUa1Budhge2t9BznV2yCsiXmySLoaJezamUwYhyityUbqkf6JfgeNxh0xeOcBn7n
	K0DIg/RklzpIbbjOAkIAQDK8v57qBtm3Yc9mIcPLFUJFDXQaq38Ml0Gb1vkZcjomPuPNpefNYBO
	iOUi6/Jmcys82xGfeFD1GzdmX9xN70xRxrwn788Y4PSjuRe02vg5Td24rLPVj7tK/ROWBBkJ16i
	svxnpRDJhT4Gx1AHkC4pWIk37jdFyQmPezMnEwoio+hrWICKE+a1yShwtOhvSvxUSrLVTHVtXGx
	XmfX9qsHtYwpZmskc6SZgPyUrheDb4zw==
X-Google-Smtp-Source: AGHT+IGbvK/f+EyST6/Ou/X1/Otr+t9j4IgsCu8YzzEolwEyyl33v0jG1ZAXlIIZiPmx169QmFhW2Q==
X-Received: by 2002:a17:907:9708:b0:b04:2d89:5d3a with SMTP id a640c23a62f3a-b6475505d94mr884342366b.7.1760975129544;
        Mon, 20 Oct 2025 08:45:29 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.86.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebc474c6sm808850666b.78.2025.10.20.08.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:45:29 -0700 (PDT)
Message-ID: <d9819687-5b0d-4bfa-9aec-aef71b847383@gmail.com>
Date: Mon, 20 Oct 2025 17:45:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] bpf/cpumap.c: Remove unnecessary TODO comment
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net,
 kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, haoluo@google.com,
 jolsa@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019165923.199247-1-mehdi.benhadjkhelifa@gmail.com>
 <42b9b376-897e-4984-909b-218bd1e3214a@intel.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <42b9b376-897e-4984-909b-218bd1e3214a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 4:41 PM, Alexander Lobakin wrote:
> From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> Date: Sun, 19 Oct 2025 17:58:55 +0100
> 
>> After discussion with bpf maintainers[1], queue_index could
>> be propagated to the remote XDP program by the xdp_md struct[2]
> 
> But it's not done automatically, so not aware users may get confused.
> 
> Instead of just removing the TODO, I believe you should leave a comment
> here that the RxQ index gets lots after the frame is redirected, so if
> someone really wants it, he/she should use <what the second link says>.
> 
Logical,I will send a v2 soon.
Thanks for the review.

Best Regards,
Mehdi Ben Hadj Khelifa>> which makes this todo a misguide for future effort.
>>
>> [1]:https://lore.kernel.org/all/87y0q23j2w.fsf@cloudflare.com/
>> [2]:https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/
>>
>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> Thanks,
> Olek

