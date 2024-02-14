Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FDD535A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916367; cv=none; b=Fz/Mp88YDOM52Jh7KudSDNPerHWA8sUn2How+5mCmETO8Om1pB3kqFExCOwh10HxtjxPLZUUklY0wWbL8opx989Qo1ifEWhqi94hUjgeDBtozu8Hzw+WmOfRnHjz3muMbcaQNl7T/y4+KWiZrzQCOWfDJH2mlfAqo8ld2Wk/CdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916367; c=relaxed/simple;
	bh=3pj6pCwvGHzrnBYVFkPzbVgTiY8sWV+MYBx7Wk7tlPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3a1iZ3ehke/TsqokttBreT6h1vlckoJgqRfbNxhogEvVZdUuFnUHeHXW1IRB6WNZbKfiql0VpyY7wOT01JEtavgUi8BSjpg3Fu5PKTEQd4MtSsfotptIimqz60CwxJlFb3ljb6haPEhb4OTCb2cISToiTA0L6iaNo4qOxiY4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=JP0nwrpz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="JP0nwrpz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFFE1606A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rTlLaOPp5Rv
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 13:12:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=rbmarliere@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 275FC6068F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 275FC6068F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=JP0nwrpz
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 275FC6068F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:12:44 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e11596b2e7so148036b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Feb 2024 05:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916364; x=1708521164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f+TTYz3ZRYn1rS6NQJfMoZIMgC1hO3L4Y8++b56qp0=;
        b=AXJaPtsHYldx7Vli14uXGZeK1WUgTBSQFB8Hi7PEAW/A9OYRrxQaD17GxZEC0QorwU
         RrxkV8LLncvX2mvJo20sjI5Xmck3GTDLd0KoOB0/20blC2Gpydf5nlFdOmDIGytOo+7m
         jl4nipqpUOD/VH1syz7R2LZbGw5UXtc2ZarfG2uiF7VRpG9arc03AZb6j1aK8EvHVVFq
         m99d/czontZ7wc7soTJrNN+2pEVYKFxghIPLD/hgBIxU16sxLcreCBp6xvbqUsK335HQ
         gby0BLv+QpMwEcpfqrSIjtgnpcwgv2w3byU8Wa1liQTGRdqfjQGozRfTHpizTJgEb9yS
         1H6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzvGduFrbjmCJBPx5r0iGUsc8LFE8MSBPbHC3hqQKW/ms4k2zt3S8TbA6dugDDS1takA3Airg4QdjFltb4ny+/KetwmcbWAjGVoySBrarCJvfEDNkIlMFAuJXuyu6Z
X-Gm-Message-State: AOJu0YypB/QWfKtp7QAbcAZuZB8xMH0KLPtXLtsh2PQw3evtrUP5SA04
	xd/BJDpvRdQrGWp7h2eTbBq9yfwVOuEAazqytBjts0wFEcZSoRaw
X-Google-Smtp-Source: AGHT+IG7Ea1tTcWbsnNK6seHcuYhMsug3dCkIctRj9d/ftxNCsGdzkD/ijNec/lQ8S4sMyHOSDvLtQ==
X-Received: by 2002:a05:6a21:3a41:b0:19e:8ad2:c934 with SMTP id zu1-20020a056a213a4100b0019e8ad2c934mr2974931pzb.14.1707916364070;
        Wed, 14 Feb 2024 05:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhzr6dc0r+a806gJe9uzMu7w2QClDdqjCu7TIf4Jr+3OuBb+x4wwM8Kx07Aj7xAy1QngdIYCBWWvOykLb1qStN0OiWZPsnsId5qK95TARRLC+7CUUGPzf0jRdfmVINfXJ1WBzdVP9y+o0Ym/Eva/j8J1keW8mcHAZEQmVF2PeGtZ5Shw61HvDaITYNJNYR5g8XxKLV0ZtybbiJqFFhVeXwA2W9O3L4FkNkqnlKaINikaG8d7EVCcwfC9WUUQJeJ4pY/Q==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id w5-20020a636205000000b005b458aa0541sm4106954pgb.15.2024.02.14.05.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:12:43 -0800 (PST)
Date: Wed, 14 Feb 2024 10:13:22 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707916362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f+TTYz3ZRYn1rS6NQJfMoZIMgC1hO3L4Y8++b56qp0=;
	b=JP0nwrpzpfWIaqrG/NBK9LTQ5tOzpP61eJNKXlR9Lp+bXY1c77qJHME9urEdC8Pd7TqVaj
	urDARYLVAuNEeY7EmqApcaFMtAMGq6CfjgTnrx7Pl69NbUzIkixXARBxCeb/0kjYlPkXJh
	6LEtkZ18BomJzcNk/rNi5SdVtB2YtGIO0kd+k1AGAjr3OUB7gU5yxdZOyy1c/od5zmCVth
	piLHsW3WYdbQtqHc4rASbkX4c4kJXqtbF7f8sAtg5OPz3zUz7piMx0QrJVzyyToALwEhSn
	cRCvtKm1jEjaQPHa/iuFh2yOJvdkRer2+lu7IWBzlpJshl5zc1GBMUubJ6itNQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: "Ran.Park" <ranpark@foxmail.com>
Cc: akinobu.mita@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Fixed case issue with 'fault-injection' in documentation
Message-ID: <piosq44nxwlfeutperrk6d23bx564qlbfirc5xlbouyrunf24r@u6qsgqp47fz6>
References: <tencent_3EA07E65C43816C2A8402DC655CF98916B06@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_3EA07E65C43816C2A8402DC655CF98916B06@qq.com>

Hi Ran,

On 14 Feb 19:40, Ran.Park wrote:
> In the 'fault-injection' subdirectory, the first letter F
> is capitalized, whereas in index.rst f is lowercase, but in
> index.rst all other elements in the same column are capitalized.

Does this fix any error or build warning? If so, it should be mentioned.

> 
> Signed-off-by: Ran.Park <ranpark@foxmail.com>
> ---
>  Documentation/fault-injection/index.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> ────────────────────────────────────────────────────────────────────────────────
> modified: Documentation/fault-injection/index.rst
> ────────────────────────────────────────────────────────────────────────────────
> @ Documentation/fault-injection/index.rst:4 @
> .. SPDX-License-Identifier: GPL-2.0
> 
> ===============
> fault-injection
> Fault-injection
> ===============
> 
> .. toctree::
> - 
> 2.34.1
> 
> 
