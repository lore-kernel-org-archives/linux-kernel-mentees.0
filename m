Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3A1DE4DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755970915; cv=none; b=B00i8wIQkAVnpHEVgIbn6oO54iaDBLAgpCSAn5CairquRd+XCEpBZcUkG98aL2kOuZpYuGGL6cfWGUaavGu+Mg7Nk0EHVjNleBqXNjkkoI9l3w3RRnilzxeWfxW66lAOPYys7RpkDjCBuKImmePsyIns+e3P3GEUfVdsKwGwbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755970915; c=relaxed/simple;
	bh=Vqsur2y8RSmKY5nLbktYvL+6enfobV0AVZknVfAmh40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqgz7L4cSXERZQvMK9HP4cJsK36KCKgCPWq/G7USLADcaklFgOkQTAztFt8JrvIkfq8AnY2xWmjnSxd6vDnQudXOrCailuw0mAejXEOPE4CvGUeE8BuMmwZ87WvIZre1R6bk38uexfTdaztcg326LxiprVZzNxn1IrHq8sfuGZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkRAKOd1; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkRAKOd1"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF6D41080
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 17:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGiFIxx2f5NF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Aug 2025 17:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CA8340FC3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA8340FC3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VkRAKOd1
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5CA8340FC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 17:41:53 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-30ccebcc7e4so1399134fac.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755970912; x=1756575712; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITqdo3Ifd8N3LbhIbwmmh+G/PmOUjB4de9aY4Vzo3DI=;
        b=VkRAKOd10IDKpHscteBJl8QmSB4uSLMkI2ReYsyMR41JFHt6IQJKBRsReo15j7Wp9Q
         TxixvZNfJwukPZIY6oVtZba5pl0nduhnK8npsuG3z46Ksk8p+jIsbEXGhoCvRgDtkJGe
         muUqrsSjbHzehtW2Mp1rcFm9Uwq+3VXTbdeXrsbeOxkILKPdJZHLWYQRHMzQ8LQ8O108
         xmHRB/Rc/5u0VAzDuMhEt/Yi54eGPTu7aNNdeOR6DzPRZHsbHhSgjhVfXqPpJLDdmZyS
         l+/Lf5GGfncEG99F0T+XskHmnSa064m0+JCKqBmSwUhwbVqGNk06Xk7RAzrcvCmBdUoc
         sTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755970912; x=1756575712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITqdo3Ifd8N3LbhIbwmmh+G/PmOUjB4de9aY4Vzo3DI=;
        b=DwHzZIRczKFp6MmTriJLKNPt9p7etG8D8jRwp6PtyGrms+vH0GLXqwcw29gMI5QBPq
         BYJcov2fMJoE7k11CWdVAl5xxLNQHnRGj8+fALntaT6lf8ua2rYof5z4McWvkvJP/kNe
         gtkKJxY/h1MeHyzia7KRvhGpyGZDTL23CU7GIacx9qUPywO9hrVlF4/UnPmBYbVt3TbR
         xx7+N19mHfDuT94TWde5B6qMgOKhOsSyFOFLPwdPGzNdGWVy9HpHA1q8y2yo1bnqGn+a
         h0aWQCJ3b76YfZirNig8eSc2TZvQes2STVeMT5b9FhS+UsW3g2FzoIuAm4eJS5CIXGfp
         taHg==
X-Forwarded-Encrypted: i=1; AJvYcCUaR4UefOjxnExHhewLCo6+hAVTA2h0AV1gHayNNIkjXifAxFHkEhdfT0IH2+fXbm5rMjZtROBdfHBaGwCXkwyYRwkC4Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxc6Bwg5P9q7J6o3i9UQaVVi3cCoT/5HT5jT8m/JA8rAuSbblrV
	Mmw/OmXIdqHK6EMKbwrZP57O9ZCzdaoPGCQuLQkj0Q/uRBK0fJ8FMeYU//PFChilFIxLyephmAz
	GSsJXSd2XDq9Sw6HseAZ99prs2AvUmlI=
X-Gm-Gg: ASbGncvQnS5qizP9yd8MI1SPbUUUj6ysh7sJHdojEe6ZWUVpU3ks2/jhuobiYlEECg0
	WRwP23P42VYNygFBsR5iLw5jiaIBbD4RYxmazVH8flWWt+QhVqDivp8upJVm3yk1PJ6+7rPziwU
	vtdAtknncBUKW6RcPlYl0pKdSs6aVCxpWm7+qBeXk4qTsFj87GNF0w8x511f+Vw0oAveB68ggy2
	hVGj7bGQ/E/cnIbnsw=
X-Google-Smtp-Source: AGHT+IGzZeNIqe9P5PGqgBcOWCG/DtxycER6I/XwHnz+4/6S9/11ldzzr2W81ivO38l/U5UWp3jfUPRuWo6itDksOMY=
X-Received: by 2002:a05:6808:1907:b0:433:fd1b:73f1 with SMTP id
 5614622812f47-43785261777mr2782955b6e.6.1755970911987; Sat, 23 Aug 2025
 10:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250817155053.15856-1-marcelomoreira1905@gmail.com>
 <aKKvjVfm9IPw9UAg@infradead.org> <CAPZ3m_g+KcJt_wxBjdmvyW+FqXAcEfVDUuHkp8iZ6XiUZ+6x-w@mail.gmail.com>
 <aKbdFONDSYp0FxSg@infradead.org>
In-Reply-To: <aKbdFONDSYp0FxSg@infradead.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 23 Aug 2025 14:41:40 -0300
X-Gm-Features: Ac12FXxOrdRfL4gdqoXJWo3pkqhcKRZcNxkx1s5GRciO1CYupAllcGOQWi05-dw
Message-ID: <CAPZ3m_gdi5Mo_N-L-M0nQoGy99m=krv1R=nb2ucj6mbcRJXTig@mail.gmail.com>
Subject: Re: [PATCH v2] xfs: Replace strncpy with memcpy
To: Christoph Hellwig <hch@infradead.org>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 21 de ago. de 2025 =C3=A0s 05:47, Christoph Hellwig
<hch@infradead.org> escreveu:
>
> On Wed, Aug 20, 2025 at 10:47:17AM -0300, Marcelo Moreira wrote:
> > Hmm, I've sent the same link to other people, and none of them
> > reported any issues with the SSL certificate. In my case, I'm using
> > Let's Encrypt. It could be an outdated certificate in your Firefox.
>
> Turns out I was connect to a corporate VPN which had some man in the
> middle thing checking for "bad" websites, and they somehow considered
> your bad, and their redirection didn't work.  Sorry for the blame :)

Oh, ok haha, don't worry :)
>
> > Regarding sending it to the official xfstests README, it would be a
> > good idea! If anyone here is involved in the xfstests project and
> > thinks the post is good, I can send it to the official README :D
>
> I think for the README itself it's probably a bit too specific.
> But I'd love adding it as a new HOWTO file linked from README.

Hmm, cool, I can submit a patch to
git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git adding this new HOWTO
file :D
Thanks!

--=20
Cheers,
Marcelo Moreira
