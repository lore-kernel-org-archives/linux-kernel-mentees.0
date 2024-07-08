Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A77E782
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439826; cv=none; b=DglsASt1mWTbvwgjzKWbEmbimmoGd5Vae0xf6rJ+lxmxQf11qz42ag4yxZR1XjSkWd2PM/p5XwlLUIue5HaLdlczfvoPW83N2lRaJ8lMZvAknJEDiF6+LrVd9a2jVCh4WeHBmaYMoG3XtcjCGYU84x8WWzLcokHV09YbxHgVi5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439826; c=relaxed/simple;
	bh=SUIMCgaacRO0cSlQoird0ishcpaQlxLRaKsUM24BmkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjXGCaLxfK/NW0Fo0zEHDVjeVnZ//xsvm1WKPvD/PFOY4cZ7EAdBpEavYDmsG05ymhDLZ/b6zjbfQlovOVgkP1YUB8MexqPBfkLiFrp1FsSkRFqxnu7tB3V6z95YDUQQmNCROpYR2+M/Yn2IzzNhj6eyu3j6CoQhBJ4j+igUJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3LxKIVF; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3LxKIVF"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B2D81021
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4Tf9QAF2-b6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 11:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41C1480FB7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C1480FB7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V3LxKIVF
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 41C1480FB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:57:04 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7276c331f78so3141572a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720439823; x=1721044623; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUIMCgaacRO0cSlQoird0ishcpaQlxLRaKsUM24BmkA=;
        b=V3LxKIVFRbeQeP0mFHRVF3bO1FbNPaFTicRQ5Ney3ibDeIKUOgNN/cQvX43iVMcZGD
         GONJXr4Wjoc+7eWB7sAKuTPwQQs+QkabU6UkCObiBsZLi6Iwvwx89+yX40tdCfJWI6AN
         G64QLIKHFNEHPnlc54NnDKJuXUpDw/GbilmcvJl/99OYfgLh+UK8F+cbltKU9lsmuxgz
         S6Ys4HU2eQgs2DuYiVTZXosAsUyTyDWcyYFUlHgtxQMURkGNWfozywr/KAMqw4PcDrcq
         JT6B5d3XsDHNCNHd6wjr0gJ/mzzvD+agr9cBq7YHrs/ciYb44KvFk3uFcjhmJGN34jCx
         jFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720439823; x=1721044623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUIMCgaacRO0cSlQoird0ishcpaQlxLRaKsUM24BmkA=;
        b=oOAy1SXFD0xsT0sr7n7IDvdwEPWjKkaYTBrIa12UjPznL1gb5Pm1hYIMOx6f/rs5JQ
         ZDASbF7E4tordtIvl94izik6GNPvC1ESIMldx0PndqjWdN4dVG+tS5E2PZ+NFXZ3BTsF
         tYJq4uQgmb9oYAkE1vlRPG+Le1OQVMvAIjFVWFDmIMWEQRu/TtBAwo+rluP1AJyu1BNe
         It9nZ+WJ4sdazC0T7Ow+hdz3lR0CaA7knZyuHFTdL5CL7XXdk3wKEM3EiAj5CXhMjVMT
         17+Rh5vFQ2hB/m/PFQGCDvRotpN8YOUZwEWhdYW71j7f2iQY4Rp+mKUb098sYZFWiK52
         8pkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe69iKQd+WgGu5xnEdjiff7A6UTdLcN8SAB0VwsTfEf169lVpoOWJvJIKRV6L7fWskNvxZSoPPSWxHm/oxxD3iZhHeVy1QFgBFboVW8figLDE868d59pQ8SQxEYj5R
X-Gm-Message-State: AOJu0YwrLTT3aHdkjFT00J7TTLTMHb3F+qnHiQzrcXVNHQqQlSxhRltF
	gID4Wd5VtytModtNEeSZv2l+coEvNT3qOaETEw3qNc/NqYbo/bBAM5HULPL71mYF0YqMsGqhSUa
	WWnaCaqZkCHqApZFR8Gw0xgMOgio=
X-Google-Smtp-Source: AGHT+IEcG2yYYSggHwDRwPEuj3eNKhu048mkWdz+/GOOQznG2lh2nwbizm5Pru/c0We9zgHyuv2NeWm2UWwzGuBpyYg=
X-Received: by 2002:a17:90a:d190:b0:2ab:8324:1b47 with SMTP id
 98e67ed59e1d1-2c99f381a14mr17271344a91.15.1720439823359; Mon, 08 Jul 2024
 04:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240708090615.2267476-1-andrewjballance@gmail.com>
 <CANiq72mB3hA6GeN2XSqRpV4m+rCbr2+NLHgmfpphjm1Wo1wBBw@mail.gmail.com> <ZovMt7AHJdiGEobg@pollux>
In-Reply-To: <ZovMt7AHJdiGEobg@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jul 2024 13:56:49 +0200
Message-ID: <CANiq72=6LSGwRsc+deE+U8H=mdgFisrKEPOYgVkZfHhGm8hwog@mail.gmail.com>
Subject: Re: [PATCH] rust: firmware: fix invalid rustdoc link
To: Danilo Krummrich <dakr@redhat.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev, 
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 1:25=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> Firmware and device abstractions were merged in driver-core-next.

Indeed, you are right -- then:

Fixes: de6582833db0 ("rust: add firmware abstractions")

And with the commit message fixed:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
