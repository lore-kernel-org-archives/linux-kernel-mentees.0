Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F72F7460
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797230; cv=none; b=VBXxfHnyeMAS65Z1eA9JoHOmNCaahPoQjwmG3GG4mSBqxFhqpSejoA2cQQo/rgJOcIhIhgWRwnFxeT68KDu/tYyoqZUzslqgi/tV/hFet7AC9JCHfuzOac6Cj6wj8b1wX0imS98i14BFtPcGWxAF4+hKiFbhp4Ed3tXcOm/clj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797230; c=relaxed/simple;
	bh=8nvJ8A7foyLcKS29tCoL0fPQRMxEjUQMAs2niNyf/vM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O8ORbw1FBZMy3/GL6ztSh+b5vTV1NF9rILyO/eK+pKo31s72FZzWhwvf2AAtyLoGT/kmcdnoYB4kYB/nixKC/yCqnBMK9Oub/nOf4oPb8YXz3e1CnUz8LXd0Tly+u+hU9pE40dR6bDaZYl2BCgIeEeAs1mnGoOSK2VpYJ4dhCNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=YxO2DPO6; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="YxO2DPO6"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE76E40FE7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4s6-PjeLsMVS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 10:47:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=jakub@cloudflare.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEC8D40F4A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC8D40F4A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=YxO2DPO6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BEC8D40F4A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 10:47:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b07883a5feeso176145966b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1758797226; x=1759402026; darn=lists.linuxfoundation.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtezjMk6/bO0x/tPzo5ofmo/kKFHp0RyWiXSJ7o70so=;
        b=YxO2DPO6g01eavUmEoNhbSJqMtq1n+h11fvuaM9H8xTQqJVzlVb1CsQI+cjH8w4yPA
         BMvwmWpWU6WMzbh8F+8Bbf22UvctuMwe9U+kwISOoMU7wrOAF9ZoSl6lsbOleNQakNBT
         g9g6gGqzvWgH0lIuQufnhg5+fFXB5W+tJn6lUsmQuB9uVHTJHTgFFe0jFB7T8MjyMKsM
         sC5qCmefV6xgbSzwkp+FQ6Q3MlfgwWQECXvVqnha6y45AoR/xNeVxnj3BllkmyY3qqxl
         v2hSoXeLj6ufV5sJVpE9N4IOH1bH+Q6JFjXCWCRgI9j+Dx/Zm9xZybhKHJUcqmpN0MYb
         5A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797226; x=1759402026;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtezjMk6/bO0x/tPzo5ofmo/kKFHp0RyWiXSJ7o70so=;
        b=sn5g1xosv/NtAyXFXwxrhoDRBiIBdB6Gy2ZCrqZOQZfnolu4UiLwN1CEQ1/Hyn5v2U
         yTdP6Uhrx7+rSaQzPpwz6+09Y40irvvyUdw2W7Yb6eY/ONXW6y5rht8/UX8JwwOYzQE0
         6qrFwznYGFydRJuubYfLBMubyZo/cUlFtgFWIp8IO9+OqVDyyOc4LQkK31Nxy0B7aGpK
         3049hbuA8/GACnakau99KLYJ1GIeFu8X6JYCGMfylK8MzsuI4lE0pYAME4EQ4QhU8I1b
         IINFLZ8JE4GWAC+nYY1GDjfOdb4vW3gOuqzuVLrS83zwREmR0exOW0B7lcqo2YULcllA
         YDWA==
X-Forwarded-Encrypted: i=1; AJvYcCXdrJQm8iILAT1jWqAjeJjxDvBnDhiqpPZ99pqZrGXdONYGAbBAUcDT8HNuaKdx4vDGu2h1zTch/ysSD0qv3oLUrJqwUw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4k1Uof2By9Dv8cJKOL2a1jeWVvdFTEOeBL9ziOPf8Y5Vuibct
	lQ/q6B0c59KLt7giQsdkBdJF9V19OPiOcu40unJN2jcLrh5R34BTN/lOhEFVS9sy5Po=
X-Gm-Gg: ASbGncuRyAegNoSuSaSkXHPnpQS8e+bHSCKyi5WE6E3b4P521JVqjSsKWDRc+9DA9k1
	W783JhPHNOKV9t2EpUAzShLibuRhWgcbSloqKS1I2EYQhCax6EMsYa2k1wO2ue4O0F7nNOXv2j1
	+ivlSVRmm0FdYr5irM3tqC6Vm+iDKgijtPZcAX6eajYTyUTZ5XijnsuIERPTL6hdTbgs0nDEGZA
	4bGRGb+y5Faboxl6k4gEA4UK2qBNLTVbWGFb6hqWSBzDtoPtfMBtryGSL2EdhtYVpt22gdH3wTz
	AlWhurVW9tOT3+3YyP3AIZ0UtbHYsiBgMXMKM6OhS3o3ctjAS3paFNdIC0DFTYAOY1sIngmWUA6
	relu2SlcXSzAK+rk=
X-Google-Smtp-Source: AGHT+IEEcfDn2RrVsshiYTVRq+15zLodFJyHTF6YE6Rd2TNw1hBwfGLx4qw9HosoUAVdPzH9DGkLsA==
X-Received: by 2002:a17:906:6a14:b0:b29:8743:8203 with SMTP id a640c23a62f3a-b34b14ad9e0mr345065266b.0.1758797225581;
        Thu, 25 Sep 2025 03:47:05 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:d677:295f::41f:5e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a983ffsm140688266b.94.2025.09.25.03.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:47:04 -0700 (PDT)
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
In-Reply-To: <e85e7bb2-6229-4b04-9c2a-7a7b79497c6c@gmail.com> (Mehdi Ben Hadj
	Khelifa's message of "Thu, 25 Sep 2025 12:28:07 +0100")
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
	<87h5wq50l0.fsf@cloudflare.com>
	<0cddb596-a70b-48d4-9d8e-c6cb76abd9d2@gmail.com>
	<87348a4yyd.fsf@cloudflare.com>
	<e85e7bb2-6229-4b04-9c2a-7a7b79497c6c@gmail.com>
Date: Thu, 25 Sep 2025 12:47:03 +0200
Message-ID: <87y0q23j2w.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 25, 2025 at 12:28 PM +01, Mehdi Ben Hadj Khelifa wrote:
> On 9/25/25 11:18 AM, Jakub Sitnicki wrote:
>> On Thu, Sep 25, 2025 at 11:54 AM +01, Mehdi Ben Hadj Khelifa wrote:
>>> On 9/25/25 10:43 AM, Jakub Sitnicki wrote:
>>>> On Tue, Sep 23, 2025 at 10:00 PM +01, Mehdi Ben Hadj Khelifa wrote:
>>>>>    This patch series is intended to make a base for setting
>>>>>    queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>>>>>    the right index. Although that part I still didn't figure
>>>>>    out yet,I m searching for my guidance to do that as well
>>>>>    as for the correctness of the patches in this series.
>>>> What is the use case/movtivation behind this work?
>>>
>>> The goal of the work is to have xdp programs have the correct packet RX queue
>>> index after being redirected through cpumap because currently the queue_index
>>> gets unset or more accurately set to 0 as a default in xdp_rxq_info. This is my
>>> current understanding.I still have to know how I can propogate that HW hint from
>>> the NICs to the function where I need it.
>> This explains what this series does, the desired end state of
>> information passing, but not why is does it - how that information is
>> going to be consumed? To what end?
>
> In my vision,The queue index propagated correctly through cpumap can help xdp
> programs use it for things such as per queue load balancing,Adaptive RSS tuning
> and even maybe for DDoS mitigation where they can drop traffic per queue.I mean
> if these aren't correct intents or if they don't justify the added code, I can
> abort working on it. Even if they weren't I need more guidance on how I can have
> that metadata from HW hints...

Both filtering or load balancing you'd want to do early on - in the XDP
program invoked on receive from NIC, which as Stanislav pointed out
already has access to the RX queue index in its context. Not on the
remote CPU after spending cycles on a redirect.

And even if you wanted to pass that information to the remote XDP
program, to do something with it, you can already store it in custom XDP
metadata [1].

So while perhaps there is something that you can't do today but would be
useful, I don't know what it is. Hence my question about the use case.

[1] https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/

