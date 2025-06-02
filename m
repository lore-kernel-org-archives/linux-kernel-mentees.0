Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68214885B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748846313; cv=none; b=T+veKf6/lfX8IPGUbMNev2+op73hwGlkzRwx/6rpyWZD0LPjBjDAwjZFmf+ZqC/1dsxsWvwO9BTfMNb4UDfVqI6cShvjsS9NgyZ89oVrv+BbJ8Jx2dpiPzV8lYiwPv3l9mlrR6XL4DiGWj2Up5atMoa3dHSxgz4WKgDIGGFKt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748846313; c=relaxed/simple;
	bh=5K9DZAdoXkEhJvvS8lIyG+i+OoTGkEjZLhsCL/QjuU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtVrwOVX1eyN/deeZJkgUmM+o1ejtYrsTYRWDtAi6edYHXKY5qYFaEuRdpnE/rtWHVyIPtzONWnmP2Jdvq2fHcdvkUFu3SVNVH/0dV2EDnHkt7Prn5VZ0vRbFaUt7GCHNjjjPSkBVHt6IS1PynL/RlqyRXmKM+ID8zEzEfS9am4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHZEl+X/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHZEl+X/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A222781FDE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 06:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE5xygv_NhTI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 06:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DCA181FD7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DCA181FD7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cHZEl+X/
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2DCA181FD7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 06:38:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311ea13388fso686447a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 01 Jun 2025 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748846310; x=1749451110; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6/WtYv92WDCQzfI89O1jMWaaW6tHqiaCffXvp4Jf10=;
        b=cHZEl+X/yDou5mC6d4KxKBdtPV7UCo82QfSR+ul+6EMV4OmN6lYCDamJf4/IC+JPbJ
         58qYLMOI5CsVZwIpPwaF0CXrCe+zLKJWEeL5RkNkEbSLMI12bwfUUt4FKRe8pFgBuuWX
         6VSirrEjQIgQrCiHSjxtAKDquwsBC47kQc+Luh9WS+inCJKD1zI/nSulTwOrOE378+Wf
         asoqh0eSVl3NTkTsxewf2CH3nGPInegzsgWJTxUrlyQKSP7aEKsmPUP4jgasDl1gVe3D
         C5wPGHBVQ8Dra+GFI/1O1jLG6WeuQYJDFcSYusAE8vCuzvncoYEF77+O3d3AMs9pKRAW
         jE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748846310; x=1749451110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6/WtYv92WDCQzfI89O1jMWaaW6tHqiaCffXvp4Jf10=;
        b=MiAcoiut9ifoZurCxbN9Dot/RoMKX2fzTz+qxtD61naS13OBDU+NUJ4LUqFLfGcHvb
         QrVYFuDe/oUmIOE83LhILz4V7PVF0BAOT9O3CUPhvv8U6puoyVOhgjB5RP+6/Bci5nqE
         f4qrM7Je04KL3aYzNBfStAAXacO8vEBMsZuCIwCqts0/8mqUbFmjCGDF2aWLHbwZ2Q6J
         z5w+RSGtUpRo/afTnpNyVBKyfnGyER+ZdxTNchk1y4fqaTLndXANOsFL6wvq+lwGFGAv
         88AT7w8IePr/XvUFw00SeSAvReNZsgdRxXTdz4b92p6KC7ItgljathQ3gjCZ55MNkAH7
         +Bdw==
X-Forwarded-Encrypted: i=1; AJvYcCVUywmmJYmAVVaf01NDLxt+vEYS2YLgtl+w7nbqDbQ7LEmkQu2eM9Tw3w9zRetPynahTEalQdoeZGVQhI2Yih6foC88WA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywzj/P/SB1pQN1GrNb87IpfBRVIdshWJFpeTJy2870h/85vlrou
	otOK4gSJuhHtq7tNyEHPY4yp8/3e4RkogPe+7K5QywJBZQIQJkVwZREg3b1FC4weukjf50mqzyJ
	4/Whml3QxqScPr8qiMgqULSjMou6Odeg=
X-Gm-Gg: ASbGncsghlkQLWFII2ciXZGjEcTXCM2h7CKgmSHU+XRDdzYbIP5LsLd4FcRXN8/AdU1
	3Tni41NbHLaH5uI8SsM710ayju63uoNV1NVGu5QffmTXCReyqb/f0Sf2RY+SgyXq4hCFFyurlhU
	rF8afY8nYxD/BYPkGBnitjm4QXPnRKFtGEYK3Vxyt7eac=
X-Google-Smtp-Source: AGHT+IGDnFrNctY2BZsrUFmHD3WIym+SkWAGWtWeIQZExNMaiV6VP5h9l2Foyc29sJkBB2ppexPTia7WJ+c1swBM1LA=
X-Received: by 2002:a17:90b:1a8f:b0:312:1dc9:9f5c with SMTP id
 98e67ed59e1d1-3124db0a69dmr6276557a91.4.1748846310386; Sun, 01 Jun 2025
 23:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org> <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
 <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org> <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
In-Reply-To: <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Jun 2025 08:38:16 +0200
X-Gm-Features: AX0GCFv4K3Kkfeg5lJL_nJ41MNrvZNr1dvdVDYMiaTafaqDgMKNXXrQePYM8xKg
Message-ID: <CANiq72=MZ63Yyspe+XoHkT6zQNWmLt8_qRScoX=2jhLzV73e8w@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 3:18=E2=80=AFAM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> oh no, it looks like I submitted the patch without the explicit v4
> version and without the 0/3 part :/...  Sorry for that, it's the first
> time I've made a split patch like that.

No worries!

I saw the other message with the extra "manual" v4 cover letter, but
that may confuse tooling, since it is wrapped and the title does not
match etc., so it is best to resubmit it properly at this point.

The cover letter, and the right titles etc. should be generated by
`git format-patch` for you, so I would suggest using that and
reviewing the output (you will need to fill the cover letter in the
file it generates) before sending it.

Thanks!

Cheers,
Miguel
