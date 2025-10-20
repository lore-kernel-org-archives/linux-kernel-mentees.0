Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10534321F2A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760978359; cv=none; b=SCgea0lVE6+tb6bmaMVoXtPiE5sKBU3cl0GQdEaKnAQIRTS5tFLpeJcu+JNbYYRwEw7NkJvA3ZRf5zY/38JrILxUYfNPRVzlGLcypBWWZBMVwV3cIpMUKJZFAxsaHzUcbAEqVPIdNIWOp48VfNbKytwNXoZfM9buyTLqxo0OtYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760978359; c=relaxed/simple;
	bh=h4psjA+4m5Yd0xvfxXbO+b9oxRofaNODIGIPOWNQOjw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rwvaY+Gpse7BZcoMVlCaKNS4nOi5I7/EDjR/I7nqdBuIG+ahzwjCIk2GZWCWhBjT6UirA+70uz8+QpTBFaXbhhNYQLtVFLmH73v1GPnpIZSC+/0o0r8iZSRWJv7Se6D4/n5bvFvi6pxIuWO4CFPiptcQjxyHoMBt9Xhc5e+J/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=tqthmF+f; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="tqthmF+f"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A4B82311
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 16:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pF5GG0Ut1RCN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 16:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEC02822D7
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=kernel.dk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC02822D7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=tqthmF+f
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CEC02822D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 16:39:14 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-430d06546d3so23934605ab.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1760978353; x=1761583153; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxMaJn1oMU5F/nUr+F+IuKEyn6pUCEn8SKXf5r6k4ks=;
        b=tqthmF+fxAFtiSwsTv1HmKqAhemz46cZn/PwB17UkJ5SrOSrAF6GN2aioKnkJUtnOm
         KL016rY4vZqTIXydsPHdwa3SkvvU/MA6xwCUE7vsEuIGfdMgAPrAp7A5oDS/PPxHCprJ
         7pQH2Hqsgobd+iNAl6oKuc93sSI9Al+S2fLIexa2TJv9nC54GfzMjMMSHKBME59Z0c2k
         WJJp5XB6ip3BFlzhhGoFLGfdkRN3uSsUSVfae2R0TlilSguwMhFcPzeakwzPG6skgLlp
         HlNE8wItfgh8KgoaKUjMHxYAexmEpxk9OTzrT/qtlgPgPUY+lnoasOhdR/i/JQ0nV/FP
         BGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760978353; x=1761583153;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxMaJn1oMU5F/nUr+F+IuKEyn6pUCEn8SKXf5r6k4ks=;
        b=bopnM2s9Qk0J8TcGxsaPs18XdyFC8bJBP9dbFzhjA8fm5YtkzREUoZnhehD2RTyOZQ
         NTRfR9fISswsZKbwG6kNbsLWnCrIEd9cVo9wjpb13WOxgPWENlM+e/xjNZUifc6LEWN2
         ZhoztmBYohFNikrt6DMoH8OnyTqwUMxMIw22HYzbVYx4AdJ7WFyu8qoyre9sNq8JeU3y
         E36xS/rN+4tMhaPTZb2kyS7kLHKkhh8CEW8QAIt5dM5stPTXz8NUslWKVGy8+lzHJXHR
         uNhfDcDlATBOqprfkBIntTlTVHdTU8e57+xfDdbMd14hI7Uvp6/mcuDJGYS1UlK4bFBl
         /n/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXz9Y71LPmqdapO2Eahgy7WQ59eSN000kNmGfJJVf49ZnRylTRuc7cfRrFaLDZJ1Zvhgnjp+cedtWKZXzJdarHyeKrxiw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzSPgNxCUQ2zI6JIBHJiweFqWad5CpSlK1Wl+RrRe3wm5IVds0p
	yOWWZb38qXjtwo5T6GPBlXB3HFcM4C7szHGMlNZi3GKtkbyRTIv9UrWgwAZdTTb4Q5s=
X-Gm-Gg: ASbGncvsNYBwJIkvmjdY4rpvw9r3Q0UmuMP80uRMBSYQK68yhbI81Zd6DvgBqEFon+M
	frLzpvkHP+pmderzpqDLKN4omhEAL1IJzGqOONRULIXY/oQxwOckuF8P4PPiVCg4N8WoKLP7r5H
	OLXbXQjTOoeTlrX/h4YLsyTNyQS5yB+AsRNGFOlYN8PRerH7UHCTi6pXm2LBHHQU8RhmYOSg7Pl
	qEWXCGMh1p4n9zFrbV19cvc0uI36F03QVbTdl8Etux3MEQ3sNPgD6KrAaqhVxeqdthRNH54cUtL
	vY6gnuKv+RRfE2XMzbo933LKuu8OUvVK4b847qtAG0+Wwa8IBNOoPCQAL0WzVZdpuhrb0nhg8cy
	YY5xzHrbfJzlZK/TdvAT4GJVf/4q6P497wptZx6j8EY22faKqSEELF2nAJkpVgdHw6uIPILnPxT
	hOUg==
X-Google-Smtp-Source: AGHT+IFW26MRpxaoSVeHKWJk5WnecJwW3fQuafM/KT8lBR3W1vBSFYWv7g9d2DXyZbjSs0gxMJQgNQ==
X-Received: by 2002:a05:6e02:1fe8:b0:430:c403:97ea with SMTP id e9e14a558f8ab-430c524fbb3mr205255725ab.2.1760978353191;
        Mon, 20 Oct 2025 09:39:13 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07ce09fsm32052445ab.39.2025.10.20.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:39:11 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20251018213831.260055-1-mehdi.benhadjkhelifa@gmail.com>
References: <20251018213831.260055-1-mehdi.benhadjkhelifa@gmail.com>
Subject: Re: [PATCH] blk-mq: use struct_size() in kmalloc()
Message-Id: <176097835143.28490.789079417051480319.b4-ty@kernel.dk>
Date: Mon, 20 Oct 2025 10:39:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sat, 18 Oct 2025 22:38:13 +0100, Mehdi Ben Hadj Khelifa wrote:
> Change struct size calculation to use struct_size()
> to align with new recommended practices[1] which quotes:
> "Another common case to avoid is calculating the size of a structure with
> a trailing array of others structures, as in:
> 
> header = kzalloc(sizeof(*header) + count * sizeof(*header->item),
>                  GFP_KERNEL);
> 
> [...]

Applied, thanks!

[1/1] blk-mq: use struct_size() in kmalloc()
      commit: e5a82249d88c7063c4ac998704b0ae5784013976

Best regards,
-- 
Jens Axboe



