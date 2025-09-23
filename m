Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508CF143C69
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660317; cv=none; b=E2j/FwWJRb7X3pCWjd6qzCPU6f+N8XsklbUlE0Vt236Ys2+IWxUDLXDo8UWm1twjtc8Zigt0LJ5uIiDh0UL9GgsWUZOuSqCRLagzuMy4m486oTVJMuMZX6r1iMIOZSBe15ltz7HVFXDIwALGzjnvJdZc/RRreAj3LoZpCLIKpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660317; c=relaxed/simple;
	bh=nGwmEIjf0Z80ZC/Qqkye+v7lXX7+Uyfj55BEPrjCfjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIzwIlRmoSjbxgnQFfe5MR+LLvhskvALF9GEWmZT9h8Yseq6Smi8d5ohG/qrUS332z27j+LXGJb+HIDFKm9EOgwYEtEm51P/zbzQoP5XVwC2H2ujYMv3q8xjhJs3t6SZRjVz/ksKvxQZ/cDhGraKKPZrT6Q5O4SMQjT+NGn24vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRnCR/Nf; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRnCR/Nf"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0145F81509
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K7mSz3V5VRC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 20:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=stfomichev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E389814D4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E389814D4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YRnCR/Nf
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E389814D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:45:15 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-267dff524d1so44702515ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758660314; x=1759265114; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sipScXl1CFAIZEiqAz6v2zuPdeVOTifZUwgP7G5st/0=;
        b=YRnCR/Nfs0xgnsjO2UM1nVHZsKv0Wmt71x/9Yp81RHZXyhfbbR7IekkLAE5LRzNnY9
         2E+Eth8+x09eaKIuZIHuZsGQF+4NjvpqCu6UAZe+HdD9GB3KFpI7nWdJZz6gfkiC8DWE
         d9C8ZktDiemXa2l2CLWv7I2XN0+8k8AhrjHwdf2LLJVKzkUdi0796zFeX0Ot4IIogBaB
         5ewObdzrr6k6PJqln0d3IRVnEDfiZTuqwS3e3EBkahpQGo7vhlJ07ncxUKnp2caEmKmi
         2wwQrpYN4PxM8DHxy1MWCX3EegNSDrs5TnAEWw/JFKM+m0CxaOaO0AOlxyaTmRkgPr2v
         c0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758660314; x=1759265114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sipScXl1CFAIZEiqAz6v2zuPdeVOTifZUwgP7G5st/0=;
        b=xIKOOfUxHFZBDYa93dK82a1xzXNO/a6L4CIVwOgjaP2jFeQHsF0uyk3aTBnIexSHW1
         cQDkT2YKDYQoEgJDC9YyjZ4QHxQYMddKwdCADILKBFKzZkB5fRuq8C7a9eFn3p0AxorX
         MTJ4sqvyxQhJZrR0sL0gnhLtisGXuhZmLdHhBELcq+YmEIzc9ceauicJ1dPRFL2svh6F
         ioxVfsFbUOMe2m+IaJGX/h5pshbFZ83Bdu/1B5KMjz6jWqYnkHXK6o6+4q/mV4M8Y9Ly
         QkPClVc6Fv22ErZIMwpA6ZzF+ovOUICPmhDiUxJVryzqB8IsjbnFXFHXWGAwTWcw0jwc
         qkKw==
X-Forwarded-Encrypted: i=1; AJvYcCU8KNT2b8+72yi1qGIXfW1NkEfcC1WcDrSvlDGbjEMIfnksQzU2a0Pj398ZLG/l7wnW6Rkh5fyIWyl27q10/1Yv55YTBg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxQooPM16/F6OYFktKlAKBkhaFNajhEVFpesSPlC9YROjw+Sc+X
	dUw81mitZXMMGn1AC9u0EDp8sOgH/PcU5ySBW+LsrJ9t9QHfdCT9hKk=
X-Gm-Gg: ASbGncsMBZ5XWZ0eJDamjNL7u1PNQbkjEHhNiF4F+DeQFp9txKVSThA5GoC3NIxwMJd
	o2gksQzi9A57aWnibp6EopoDANcWCl4z0K8xL9BET/mo6Q/Onqfi1Ic0jGAij252U0/X66CZ4Hu
	S3RH4rwTmEe5vyOgxMYtaCDSiVtAO8hoF02/LZ1fUrfwvhrEuYowvwu/ax1sJxLWh5K+GsQ7+8V
	OMv3SOjvOkOLoBr3zsIkTakxCLyEswvZb/RXHPvbU9jNgtDQsxJVq6Ncm/KRRaxyWOkAz3hV0T2
	VbSTJ7fh6ZBMYhB+UDg8rbNS0dNKhQGI6E5rBl9C4/jHZrOT5M3YlgfuM/zuQ83Bbq/5DzhVBI4
	V0vVUEdkQ2t8dHxuOO85HIdLCaaah19gDBrdRPMNJU9+mMP4XCIKI99Ige9IDtBobA3lwZ+qHEB
	en8IX28g/G7XgZbSd7aJJVMxa4fcpxX/HCRuYBgFUhRGvF0BVblSsBEW79rAdKdWqyPh6xHk4Yz
	ASj
X-Google-Smtp-Source: AGHT+IFlpvsj7lKaK/ZqzoeecXc8ehWZkc0IxVgAN+LI3oeEEkFfcubTmnGuNVbCi3mV+UCdDzJmEg==
X-Received: by 2002:a17:903:190:b0:277:9193:f2da with SMTP id d9443c01a7336-27cc0dbb137mr49147325ad.5.1758660314194;
        Tue, 23 Sep 2025 13:45:14 -0700 (PDT)
Received: from localhost (c-73-158-218-242.hsd1.ca.comcast.net. [73.158.218.242])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2698016c098sm166380315ad.33.2025.09.23.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:45:13 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:45:13 -0700
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
Message-ID: <aNMG2X2GLDLBIjzB@mini-arch>
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>

On 09/23, Mehdi Ben Hadj Khelifa wrote:
> ---
> Mehdi Ben Hadj Khelifa (4):
>   netlink: specs: Add XDP RX queue index to XDP metadata
>   net: xdp: Add xmo_rx_queue_index callback
>   uapi: netdev: Add XDP RX queue index metadata flags
>   net: veth: Implement RX queue index XDP hint
> 
>  Documentation/netlink/specs/netdev.yaml |  5 +++++
>  drivers/net/veth.c                      | 12 ++++++++++++
>  include/net/xdp.h                       |  5 +++++
>  include/uapi/linux/netdev.h             |  3 +++
>  net/core/xdp.c                          | 15 +++++++++++++++
>  tools/include/uapi/linux/netdev.h       |  3 +++
>  6 files changed, 43 insertions(+)
>  ---
>  base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
>  this is the commit of tag: v6.17-rc7 on the mainline.
>  This patch series is intended to make a base for setting
>  queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>  the right index. Although that part I still didn't figure
>  out yet,I m searching for my guidance to do that as well
>  as for the correctness of the patches in this series.

But why do you need a kfunc getter? You can already get rxq index
via xdp_md rx_queue_index.
