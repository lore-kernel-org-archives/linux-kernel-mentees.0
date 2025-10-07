Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C523BCF0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875817; cv=none; b=KL0jeBWZ4b/fUnRtidjTpyVDWdJLAJwgwIz5CA6cdKa55OhHdFXEJ8WS/u18dXek8QjdfrZ59g2BZrGIPlGfbcHfaQ5YjeyHNDZlE29Bpw01ACH9oqCbK0ICeeVdcZ0lset/HRArPaK3Y6RUSSUqYID7HcxJu/zGlZNp8Gzd3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875817; c=relaxed/simple;
	bh=HLZmmlnEOK/+rMounk1d6rjHNRAMTqkMP+AI0sVPxqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SS5pGzMICUDz5xcTaoUBsch3d2tMUnxwjHbBQvBuL18dsg48SuRORDx9Ff5cHJ1fuIXwY+xxGeNeiuPutlLSOgF69Tq1EgVxBNAQ/2bpKmvCLs8qN+Nsve7Mt4EuGfynnSBumXnjZzQr3gatvKDki23TajZzAPPSKEUAv2plsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z9+ZCTTl; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z9+ZCTTl"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CBF40BE6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 22:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcfEH8DVrY4I for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 22:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=skhan@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C46E240BE5
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C46E240BE5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Z9+ZCTTl
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C46E240BE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 22:23:34 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-42f788ffec0so10725815ab.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 15:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759875813; x=1760480613; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31cl1fXsRMYUJckHJxsY+0hejvaCKyOwda/UZ5hvf0k=;
        b=Z9+ZCTTlKUTUgdh3ATeie8NHEPV1LjUJDPFcpaf4iRbhYLlgj8fuA29eI54OhX7xVy
         sUrdsd1e3OMeAk/X17312MXf9iv/CVvXR22m3KF0pwc0pqdACj/lNsz5GwylZ5NkFs7u
         3gza5feaMQpv1IdwIlgyFKxHP6DVqw/I763xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875813; x=1760480613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31cl1fXsRMYUJckHJxsY+0hejvaCKyOwda/UZ5hvf0k=;
        b=ssUiGvq6uaimNBPUvyNI65VGPxGYXkfC5J6+Z2+k9EnPFBSc9gjAxBFpLY/EhBq4zP
         SUXf0ZCTQM7pNbWlPQtGnjYDso8Eg8mKx6FJSOHfQzu6I9i221SHp/KLUnkfFytuNaYK
         BByIcOkn9TAXDWN2gRyNa5+fySpKRYbD2bMSfwiCCQoTZisNhqLwnyUbwWtwT0mvXIku
         zVXJiviiSTEvNk97Ja1IdZThBqpfNv5mT4f9LsH46rhNqz4fl2qsX6yGv0dmhBqvjiM1
         9jXG4toD75TYW42h2+ELvlXyMcUvgvzPb+OLsxkBIy96BkRkIPymHWosI985T5j+qpDb
         zAPw==
X-Forwarded-Encrypted: i=1; AJvYcCU20IIgswXUsVP6q3we/NF2hQ8tU533WpkQTz+GpRdat28qGc7QL6fTfvW5qyBEMu/zyH7iSH5LpmBOyLUohC+90jDwrg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzLasSpSbdAwZ7tI5BmnC0ZqpswIOY+4W3f0iF+osCC7AiGkM8X
	N5+wgq5wn1q2SODM05mvUWb7VBS/I25LKyFf+0ngr8ulpvEWJaJNC6+fxTFQOH/yP/brXA==
X-Gm-Gg: ASbGnctonPIJvpfcy0nayP1n78nlKPdIyCqlKojEyDrDy8IBBiiiFb03p9wm+7q1pFG
	aYxYjFcNUEVGxjcnbElVXJtKJWqjzX+7EN5oX88DVo33YcDiO6grpA27/CSPdEmjSl9yWDbl3eM
	IkBL6+9jgaJxCC22mJA9zta+xbcUtAnK2tXT19qkkUU4UPFOpilFY0vHNxU5KnvwzY+lMgza4Qe
	QSPo0KP/WWFbvhdY6kzs4QmfkhHRE6K6OSD09B5SA3ys0cclc2TWbOlGwQBzA5G+sDtmDAW+RaL
	RQ7qdQP2s0cRC+j8HVY+AhjYTnBsW0yulCurB86ROOLWlbMfsrD8Qd6Y/PlUZhz6/dFawmfrLpA
	tOkhC02CI89Hnwp2xm+kDR73z/FWqgJ5wjY1h0rmi/dYadW6PNNsfoIs6LrU=
X-Google-Smtp-Source: AGHT+IHCuNQVRRlLttXQ6quBeFGnqpFxQ1Yq9OjeBe2AwvWKaea5kF8NxYMgZLk9O/aGpWrj4AMUXw==
X-Received: by 2002:a05:6e02:1d8d:b0:42d:878b:6e40 with SMTP id e9e14a558f8ab-42f8737f064mr10813735ab.13.1759875813476;
        Tue, 07 Oct 2025 15:23:33 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42d8b215dd6sm69116115ab.14.2025.10.07.15.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 15:23:32 -0700 (PDT)
Message-ID: <10082c41-4302-4cb3-a2bf-788e59bad0c8@linuxfoundation.org>
Date: Tue, 7 Oct 2025 16:23:32 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: cpu_rmap.c Refactor allocation size calculation in
 kzalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250930092327.27848-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250930092327.27848-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 03:23, Mehdi Ben Hadj Khelifa wrote:
> Wrap allocation size calculation in size_add() and size_mul() to avoid
> any potential overflow.

How did you find this problem and how did you test this change?
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>   lib/cpu_rmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/cpu_rmap.c b/lib/cpu_rmap.c
> index f03d9be3f06b..18b2146a73d2 100644
> --- a/lib/cpu_rmap.c
> +++ b/lib/cpu_rmap.c
> @@ -36,7 +36,7 @@ struct cpu_rmap *alloc_cpu_rmap(unsigned int size, gfp_t flags)
>   	obj_offset = ALIGN(offsetof(struct cpu_rmap, near[nr_cpu_ids]),
>   			   sizeof(void *));
>   
> -	rmap = kzalloc(obj_offset + size * sizeof(rmap->obj[0]), flags);
> +	rmap = kzalloc(size_add(obj_offset, size_mul(size, sizeof(rmap->obj[0]))), flags);
>   	if (!rmap)
>   		return NULL;
>   

thanks,
-- Shuah
