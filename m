Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37AE2857C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795537; cv=none; b=TbkNaonN+v6yH8uvMG4eyJyLVQECUxueWt5K3YUfQbGyOKXeMzxvbM/FYu3HfDRMS8yo8cLGQ7VjkNN2Tkq/7GDrSmokLWtF6SVun3swVveyIEKNH+nfg9l2/gMlvsMx+jES94dNUN9tVIEbyIn+2eWJUfkZR3BmO1EQ3nI4O94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795537; c=relaxed/simple;
	bh=0szZ/1t2vF723fTx+0uYOJw7RgMxwYGlCm1Nqaxh6Dg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NeoLOl9Xdc/DHzSITc4le/l7SNJYz4Dho9riKFwuMaUW9AfSc7PSOn073N7qXtwy8GQkluXpAbF4hdpT0td/Apb+eAw8/zTnpavJs1egFU5Ih9p1NUhAw7EHN+PsEbK5uVHK1bYYLy6WxD0vCUoCpORZNniPZCJh4irtM3uAAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=XFwLveOn; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="XFwLveOn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4178640F7D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nsjm-Nn2fHEM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 10:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=jakub@cloudflare.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55FF940CBF
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55FF940CBF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XFwLveOn
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 55FF940CBF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:18:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b07e3a77b72so319184566b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1758795532; x=1759400332; darn=lists.linuxfoundation.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=opLUmUG+lsRAbSy1R5a7UUs1ZFkf867TQlaVzzmhmQI=;
        b=XFwLveOnMVbIL1AtK/uJ4fQfKLW3fj8oWq0WcYjo+qjjy37F45SkdgAjbNbDy/Mgnv
         ElHOchBaOGb/5whPYNKeRlWQ5TqidRvNAZYjwkDSktDykqUzapKMhaCnTjMvXghfF534
         aZATbIW/hVTMjiS+gnYg44wkfgMZx9Mfvj6RP2rMI5pbCjg8NbG0rVeqb28doId3uIE/
         DO9aSOYXTzsgpp5SVD9TjhhWJ647ht9BcYTk+EgLa84Y1Yunqz6z/cCZwPbaXfPXV/Yp
         v9ZMsByK8XVxOvYZb8QeXHGbR13DaYdAYeJ3kXEddGbgqhPwPnX85/jew22psfb5scvi
         Eghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795532; x=1759400332;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opLUmUG+lsRAbSy1R5a7UUs1ZFkf867TQlaVzzmhmQI=;
        b=YFgtJbJMNgZCaTcd1Javz66b8qWK7qLj3Ag5zwFdGMgHmY2C5ezJ34D2mRotiqEpoO
         vKX34RTV8xg1ihWd3YNyL8/VSMbOdQUqOXYMTC9hbOROuG9WYwUnU57QVkLrS25DTSwp
         DBLlDlo84m9Q8vGrNzJcrLxFMUBb/5BHqcpAZtnhTxujFx6DV8VY6AcmzNfUSlA+aetD
         V2KtcKeYuHYkXFjUFFkAy7WqA0I/8YvhoqHxtrI7m4izagGJ4sheNExyzPwp8p6NAup9
         xc2FINKW8J7rNd8yWq8ulR6jUEk2jkGrUTBgf+d6X+2m+sX03ZXTdthdCqTGY/gE6Eqa
         bFsg==
X-Forwarded-Encrypted: i=1; AJvYcCWBpa9PEsDBP3dcuEuKCdp03ApdnOdo3Ok2r/Cfg8Qf1M335uAx951LD/TaqplZSl4OU92W2tA+djuyTDl8RXW+sZCTWQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywtrr01DeqTZcBt+lSQxuNtzljq1gDTZN3nQdQ2lF6VKW0eoRJ7
	bAbWsZG5GqdrwC1k++m0UH5KyqjHUP85Cg94cUdGsYx5AGkwRusKaiSUAXuLIBj/WIw=
X-Gm-Gg: ASbGncuUO5mzPTkMnc+U8DLJFlL1QRi5cvKznTB51PnvsPvcSYja6gCF052UQYcBruL
	xv8D9Fgd00616VYMqJ8Ccby/GpwlCgEpXnyVXH424cD0gk1LTl6CfMdKQPeac70pFKPS0FfXipz
	gUSD3pUeSFgjFZ0AJJWUyiiUdlkeSmrMfREhD98QYMdhK9wZOPv2y4KtfH0O3umkC4i17dOMKZ7
	QDrTLF5ftQjKZoD4du977vz3QO0ZhwlduvJEtu76zLr6y2HP0fOvpbAYD75qqzadsYoHEXzn1E7
	m0EOPlWsX1wmP7QVRCgjtJN299YQAmSf/TpY29OoMh8s3BiHdD8CmJmErWADRfkk2bOEaeSga1U
	0ljA0uUlgxHirpoH/MCLM8UU3OA==
X-Google-Smtp-Source: AGHT+IFhft95WME5prTDF0IZI8kkYS3aAO32jFFFBf65s/9jPTkMU0F9cjZ8kCcS0fWYH8vfDPruLQ==
X-Received: by 2002:a17:906:6a02:b0:b35:cc60:9fd1 with SMTP id a640c23a62f3a-b35cc7000a9mr165718466b.18.1758795532196;
        Thu, 25 Sep 2025 03:18:52 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:d677:295f::41f:5e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f758csm139119666b.53.2025.09.25.03.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:18:51 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  donald.hunter@gmail.com,  andrew+netdev@lunn.ch,
  ast@kernel.org,  daniel@iogearbox.net,  hawk@kernel.org,
  john.fastabend@gmail.com,  matttbe@kernel.org,  chuck.lever@oracle.com,
  jdamato@fastly.com,  skhawaja@google.com,  dw@davidwei.uk,
  mkarsten@uwaterloo.ca,  yoong.siang.song@intel.com,
  david.hunter.linux@gmail.com,  skhan@linuxfoundation.org,
  horms@kernel.org,  sdf@fomichev.me,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  bpf@vger.kernel.org,
  linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
In-Reply-To: <0cddb596-a70b-48d4-9d8e-c6cb76abd9d2@gmail.com> (Mehdi Ben Hadj
	Khelifa's message of "Thu, 25 Sep 2025 11:54:59 +0100")
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
	<87h5wq50l0.fsf@cloudflare.com>
	<0cddb596-a70b-48d4-9d8e-c6cb76abd9d2@gmail.com>
Date: Thu, 25 Sep 2025 12:18:50 +0200
Message-ID: <87348a4yyd.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 25, 2025 at 11:54 AM +01, Mehdi Ben Hadj Khelifa wrote:
> On 9/25/25 10:43 AM, Jakub Sitnicki wrote:
>> On Tue, Sep 23, 2025 at 10:00 PM +01, Mehdi Ben Hadj Khelifa wrote:
>>>   This patch series is intended to make a base for setting
>>>   queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>>   the right index. Although that part I still didn't figure
>>>   out yet,I m searching for my guidance to do that as well
>>>   as for the correctness of the patches in this series.
>> What is the use case/movtivation behind this work?
>
> The goal of the work is to have xdp programs have the correct packet RX queue
> index after being redirected through cpumap because currently the queue_index
> gets unset or more accurately set to 0 as a default in xdp_rxq_info. This is my
> current understanding.I still have to know how I can propogate that HW hint from
> the NICs to the function where I need it.

This explains what this series does, the desired end state of
information passing, but not why is does it - how that information is
going to be consumed? To what end?

I'd start by figuring that part out. Otherwise you're just proposing
adding code that serves no actual purpose.
