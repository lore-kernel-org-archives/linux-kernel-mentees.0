Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A828C037
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758873636; cv=none; b=TDwTXAoe08G88HPsxvyHxDMRwCybux4LSIC99FOMDSlMiXo9XddXnhtTS1Ddni2cZnyL+/2vDcRK07/UW+oHkjiwhLFXvGLf3l7w4gH7T3nQrVf/oqyy+MkLUYhHUdUobsqrea8nhW1Qp5cKOAPc7eDSxe2lLs9wnSwmsaZT3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758873636; c=relaxed/simple;
	bh=uKv781t5pHxGX9XHdWBHGON9HVERC0KRbzcEdEyQXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCNMuHtS5J51z3hvilMEny59GUA5YWBMy0pEbDU/Ba13N2v+7ZB4tsb8xu4nDYPUxt5zE0bEy1R5luPO5SsCmjPDb9wkLZ159XBmETeoZOYZHXEzDH2+9J2JsRIGvKBZu8FIggwf8Bgc5xYDG8/CXxtDK+AOicwI3mUHhCk4SYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRAaq+yV; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRAaq+yV"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E82D61BDD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 08:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPRQKEPbgAry for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Sep 2025 08:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F27D6175C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F27D6175C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hRAaq+yV
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3F27D6175C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 08:00:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e32139ef7so2695935e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Sep 2025 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758873631; x=1759478431; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Iu0F1mpJxkFZwruVTis8t8NuagO8uvem8I8R547GH8=;
        b=hRAaq+yV8535CDWv1Iy3/OyIaqBfAsq6qKQ5I1Feguka3iUXa4pwE01akkQm9J/qaa
         d5ChQT65tpYjFSAlTddCZyiIqeqvhOBSmzGuvjAXXBMIZWaZTxgKOfsrI2CzE0fXNUsl
         xa+plzRelLgn33vXMh7aw8Dl5/ZvfD0ByaPjz3iODw+/9p1JRazbqwypE0uz7/X154u+
         Q48Ws1owZMiUG4wFVEJcOASGIWTbiELP7pGyDS77cCLOxmqDk5YX0GHUi7KnRq4ybmDO
         +cG0g3Rn+z4iwyfmskj4DuRTOotnEwXHKWppzxzryJUkOdl3vZ3wOVMvFHbTBlidJVd5
         irYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758873631; x=1759478431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Iu0F1mpJxkFZwruVTis8t8NuagO8uvem8I8R547GH8=;
        b=A94IUojGNNcYjb7pL51f9aB0x+MPB6chGBkrzV8E+fX+qd0U9rcDVuklB7VNqtqaxu
         qLoc1tLYagilKGroJeA2dhsM9LMhnpINwRlVPYENtRJ6n7ckylXLtfDn7dOalVr/pMPS
         bHWPQQktdonqq7l9rsxzea05q9y/qT9+w9aP8mZldkDfEJApTYyqQPc04vhWSr1Ukmj6
         b26t5QYUJthQ075SQUF3zpjVeSbpFgBErvI4XnWYWKBOcLss+sCW9A23nmO5tz2uyYtR
         e7NIScP/mIaIYcHC4Q23QMFGZELOy0fobg6fu3q+CiPO3joThmHluGYDf0eF3ZwAiPI5
         x1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVj3706wDA0mxaMWjX6yhl8aSQqJNN5PqcWJ+EW98ByklhhiS6WYIFR7EP62NUza8287bSABI7ZyGfKjWDKVgZHTvc31Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwPTDmq5mI8Dzw4WiFnUnOEbt5ncm6sh9vSAqG0teaN1/Xhmwjq
	pBKTEyX0Q/sTJrpdL4brHxFBC0YOYv0tGlhvL6zHyvzFtyksNLxZYuU7
X-Gm-Gg: ASbGnctWClyXW6t4PDMWWF/fQZ4FOPMnDSOXr9EcixqMeQcGBeK9DsWU/KdioXwe1xn
	f3iQ3cE5+WcZeajMK2ihr0QXp3fagROJwvYYYZHq26jSZGwfeYkjkvbXZd38h0IV/vH1wbWvc5+
	vSVaGzZjKMZioGsxwN6t/NjBO6TisEpquc3fkByvc0ywNyAUq0P5GF9DIfaQAJPOlIUAEcWkDWn
	qCjP+hHn6Jv1ZgjLLSzt+HYG/TpMmDXgqtEO7nmSMwhfr4V2tfI5GGqJgeRuqwCO3h1JUmB/1Np
	Hie+CEDeMzoRaR5SXbG6lkStOvyoMh17CyWi7/xlb1tntdl6yXdXaOpkUfGLY+K6MuuGSVCt13U
	dAMgfKKIypyIYqtXLSUNJo2i9Lv35GJDhmK35GHSM
X-Google-Smtp-Source: AGHT+IHNpFF3srU1saXcXVO6zTDT4O5u6j9Vyxp4h+sviEeunSEZcOR+GiZEhHwsuD8UAwncJOuzoQ==
X-Received: by 2002:a05:6000:310d:b0:3fc:854:8b84 with SMTP id ffacd0b85a97d-40e455ca678mr3054531f8f.3.1758873630709;
        Fri, 26 Sep 2025 01:00:30 -0700 (PDT)
Received: from [172.16.20.151] ([41.229.125.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9e1bd14sm6212872f8f.28.2025.09.26.01.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:00:30 -0700 (PDT)
Message-ID: <fcbdfd79-3996-47cb-9d91-ad049147d352@gmail.com>
Date: Fri, 26 Sep 2025 09:00:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] selftests/bpf: Prepare to add -Wsign-compare for
 bpf selftests
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, daniel@iogearbox.net
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 matttbe@kernel.org, martineau@kernel.org, geliang@kernel.org,
 davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com,
 ameryhung@gmail.com, toke@redhat.com, houtao1@huawei.com,
 emil@etsalapatis.com, yatsenko@meta.com, isolodrai@meta.com,
 a.s.protopopov@gmail.com, dxu@dxuuu.xyz, memxor@gmail.com,
 vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org,
 gregkh@linuxfoundation.org, paul@paul-moore.com,
 bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com,
 mrpre@163.com, jakub@cloudflare.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org, mptcp@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
 <CAEf4Bzaf81OYLTzpN6E4ths_mN2gP29rMYBmbp7P2GqSMj8FbA@mail.gmail.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <CAEf4Bzaf81OYLTzpN6E4ths_mN2gP29rMYBmbp7P2GqSMj8FbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> I see little value in these transformations. Did we catch any real
> issue here? All this type casting and replacement is just churn.
> 
> I certainly don't want such churn in libbpf, and I'd leave BPF
> selftests as is as well. int vs u64 can have subtle and non-obvious
> implications for BPF code generation (for no-alu32 variants
> especially), and I think BPF CI already exposed some of those already.
> 
> I think we can live without -Wsign-compare just fine.
> 

I was convinced by [1] that this needed to be done not just for current 
version of the code but for future code being more robust initially.I 
have already done all the work and I can follow daniel's suggestion for 
the next version.Otherwise,This means then that the TODO comment to add 
that compiler warning in the makefile needs to be removed.

Also I wanted to ask since the CI bot had success with my patch.What 
does this [2] mean exactly.

Thank you for your time reviewing and helping.

Regards,
Mehdi

[1]:https://github.com/kernel-patches/bpf/commit/495d2d8133fd1407519170a5238f455abbd9ec9b
[2]:https://github.com/kernel-patches/bpf/actions/runs/18006172526


