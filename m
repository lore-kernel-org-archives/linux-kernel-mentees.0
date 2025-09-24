Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732E25F784
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758753098; cv=none; b=Fup/0fwgyj8tVSiU39sLRLWarCYhcARIzAvy8kmozI88pZfsUcskq9s6gTREr0f/Cbgwgb12h1OJ3wB0fx96T7M6Op1Cf9jxJ49UJy2FD5d2T7ue5OUK7Rsfk9VubkhNwhRqAQ8WM+MjAjjAlI/z4AaPQP/EP4SaLsY7GROyNfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758753098; c=relaxed/simple;
	bh=E3mp818XeEDGifzwzdOnw8G4qn3w2nYXo2kiXHXmH1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnGvZ73yOmR1URgtD/n9AID8A183WQq6Q7nzxnKpBtm90WbHcbf0cY8JppYg9jy1ecV2vxANWkRFTL5xkzFfBq5SkJ3U/lIP19moE+iQtIqmRUUrKc0Kl5Wdahxpm4haw0fcP1yG2TcFyFcp1ek+TrskXDwaUygKxA6k349bQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoU9NBZE; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoU9NBZE"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66FE4610FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 22:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqbhhB1m4BUs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Sep 2025 22:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=stfomichev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D910610FA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D910610FA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aoU9NBZE
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6D910610FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 22:31:35 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2697899a202so11915435ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 24 Sep 2025 15:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758753094; x=1759357894; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWJ481WqwYt03Qs8yEQYxXt74IruS1KgxQpyoMD3fOU=;
        b=aoU9NBZEEsqu/Lemn1kA1SMbGtexUAGJrT2yJvgnpNgG+LQRkkqjRmsBmNAaWf9dNu
         dolsgUSedoM5UHSzrhsVneb6H1FlUSAGO/22EaQ2J7D/IHZzc+Gahq4hYEoMwwZAb6Sm
         soGDYZjMsGK3aM4fhar1WidEbDCxxbNfxE5n+3rXkQ6kIc7M79WG+Ot6tXYzgUWey5En
         HV4CpwPM8bukmT9DDSXg0wUGxXT2kvKqXGC9OLNRCUFhe4Bzch3ZlnSUKwjFq66N1kqL
         zHxVficJOb4iRNapTnyXRd41yCoMAodFSnXrioEMKWHFlg3KxJNAkKU+73MM0qfsuz+7
         X0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758753094; x=1759357894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWJ481WqwYt03Qs8yEQYxXt74IruS1KgxQpyoMD3fOU=;
        b=gjQ9OtarTK6w2BIQs5w+IkO3PTVuyprf2kN8jhlEpAEplfLIekDZe07fO/Tevaim2o
         ilcXx2tlboM1JbaekLZ/5vVGBv0nIazW6khPA6vx3jXU8YG905bEjpVuNGLACyKzc9Jc
         INh9s1nPnSnC/r1qFi+BPD2ldnur9NnSlO3WVK+xjYcRIrwEYHroulWGxoufoSwYcAxG
         EUgajAhGXm/2Zc6C5y9J/HFCRKZmUHaTq6VUdJ9H6YssKzThyKw02nsImpParTqJe3l9
         tfzS5Ypi1peWurWUbr4M5u0/SWAtQ05R/65aZYezambnaSmgm5UlGUGJ95U8m1qFbXfj
         h2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUnsiPsdT1U8Dq6ZzSpxlIhcYB+MJim0G46m6RJllOZxnbFBxWzq+cyqHjKkacX51zjgG85j19pjC5PZ9oeaZ3O1L9WsA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywpuvm8Z5wbRzt+jknbODnj5SWnh6o3dlTjVnyqSfvUHTZ1l+jK
	uog6MykquFAbDflzOF5vBtrDMvbN+vfu5a7flXmbGenlFbzp6RSyGP4=
X-Gm-Gg: ASbGncvogDLzm9QFjQwSl8esAN7Lx+5aYECYWPlFWqqK20Pvodltj25rhY3NtQcJ+UO
	nvlYUII6fi1NHcZojR4QY09KsI/wyhI0ygTzJ2hZgWJ3j6i3pBd4SBBKwbF+wgdKEFUQ0KU84C/
	hbgjgzFYmTXhm2hsSwYT5HEky3a858m8HWi9C6qwuJ0nmCNXsP+KMRyayq3K1N5wtP00smLJn9/
	+ebDvBUrRxoufwKDu+O0Y8J1mIaAUfT+n6fFA/bm2S+lROxxTUr615X+8WE11g+Oem7eftgMS4P
	9JBLp4e9KDPBBbxUmozch+73CoTLl4m9DwFBg1TiPD9DY5HkZCBDSpc6T7/oLUJQeqGOo+WtCBC
	BVm+TEe9mwZP58/7H8+GhCrt8rZf5SUgikBw0YGf4wbF9xjJQuI+h8C14KN/IxOPWRnO3Dkly1G
	B/iFMsX+nvD3b0NHbwiIq0IM8HBgBafvweFSzi8rmfGWNd3i90UttYOdAj+MYAeVW8nZO0Ywx7s
	9Xt
X-Google-Smtp-Source: AGHT+IGqXSUCi05Q6A/shBANKJJ+7L6thhmdeK778FmwuGU+D6HEICoXlQ65iZTp1I/QU4cKU7BZPQ==
X-Received: by 2002:a17:902:8210:b0:267:44e6:11d6 with SMTP id d9443c01a7336-27ed6aca024mr3396525ad.6.1758753094437;
        Wed, 24 Sep 2025 15:31:34 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-27ed6886f4esm3083585ad.80.2025.09.24.15.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:31:34 -0700 (PDT)
Date: Wed, 24 Sep 2025 15:31:33 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, donald.hunter@gmail.com, andrew+netdev@lunn.ch,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, matttbe@kernel.org,
	chuck.lever@oracle.com, jdamato@fastly.com, skhawaja@google.com,
	dw@davidwei.uk, mkarsten@uwaterloo.ca, yoong.siang.song@intel.com,
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
	horms@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
Message-ID: <aNRxRRSfjOzSPNks@mini-arch>
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
 <aNMG2X2GLDLBIjzB@mini-arch>
 <f103da72-0973-4a45-af81-ec1537422433@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f103da72-0973-4a45-af81-ec1537422433@gmail.com>

On 09/24, Mehdi Ben Hadj Khelifa wrote:
> On 9/23/25 9:45 PM, Stanislav Fomichev wrote:
> > On 09/23, Mehdi Ben Hadj Khelifa wrote:
> > > ---
> > > Mehdi Ben Hadj Khelifa (4):
> > >    netlink: specs: Add XDP RX queue index to XDP metadata
> > >    net: xdp: Add xmo_rx_queue_index callback
> > >    uapi: netdev: Add XDP RX queue index metadata flags
> > >    net: veth: Implement RX queue index XDP hint
> > > 
> > >   Documentation/netlink/specs/netdev.yaml |  5 +++++
> > >   drivers/net/veth.c                      | 12 ++++++++++++
> > >   include/net/xdp.h                       |  5 +++++
> > >   include/uapi/linux/netdev.h             |  3 +++
> > >   net/core/xdp.c                          | 15 +++++++++++++++
> > >   tools/include/uapi/linux/netdev.h       |  3 +++
> > >   6 files changed, 43 insertions(+)
> > >   ---
> > >   base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
> > >   this is the commit of tag: v6.17-rc7 on the mainline.
> > >   This patch series is intended to make a base for setting
> > >   queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
> > >   the right index. Although that part I still didn't figure
> > >   out yet,I m searching for my guidance to do that as well
> > >   as for the correctness of the patches in this series.
> 
> > But why do you need a kfunc getter? You can already get rxq index
> > via xdp_md rx_queue_index.
> 
> Hi Stanislav, When i was looking at the available information or recent
> similar patches to populate the queue_index in xdp_rxq_info inside of
> the cpu map of an ebpf program to run xdp. i stumbled upon this:
> https://lkml.rescloud.iu.edu/2506.1/02808.html
> 
> which suggests that in order to that, a struct called "xdp_rx_meta" should
> be the route to do that. In my navigation of code i only found
> the closest thing to that is xdp_rx_metadata which is an enum. I tried to
> follow was done for other metadata there like timestamp in order to see if
> that gets me closer to do that. which was stupid with the information that i
> have now but for my lack of experience (this is my first patch) i tried to
> reason with the code.So yeah, since xdp_md is the structure for transfering
> metadata to ebpf programs that use xdp. it's useless to have a kfunc to
> expose queue_index since it's already present there. But how would one try
> to populate the queue_index in xdp_rxq_info in cpu_map_bpf_prog_run_xdp()?
> Any sort of hints or guides would be much appreciated.
> Thank you for your time.

I don't really understand what queue_index means for the cpu map. It is
a kernel thread doing work, there is no queue. Maybe whoever added
the todo can clarify?
