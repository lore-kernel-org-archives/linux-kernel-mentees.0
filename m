Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D025B1FCF7C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759500034; cv=none; b=mfW0Kcsl7duUJFzSXHtPiphT8/61GTi7TunKJTN89qXeRZrC7MVtq+2jM0gmCtU/omti0F7lemEYptNvg1pHvSRavnWDA+zEoMyucTyMb4fIHaUk1gOv/b3se8z+4EL0LIzscp7und+MV5uzc5voLybq3Pt1bLmvPtZ8GwTxcjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759500034; c=relaxed/simple;
	bh=LE11OXTwtyH7n2SYHTG2RJk02Tg+uqHJe5QPkn3biIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD1EnBHhD2UDo3BAMoB6/0HEZ7t8gn9sQXEofN1v5lqwMAXBHwhcfk8Z3FxTUdhHSosLQM57qw1EWWgglkcckYzdZHWhNzH66sAU5gQx1dQhY5jaVrA95KEijIBIVNXL3n9aNRdpJH+9vzgDQNLETX3Pk6LEHYKwSFWpYpD10dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NKEuR+Q4; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NKEuR+Q4"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 657DF409C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9DZGHxlwyFV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 14:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=mkoutny@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0E7C40800
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E7C40800
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NKEuR+Q4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E0E7C40800
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:00:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso1324252f8f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 03 Oct 2025 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759500025; x=1760104825; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1I+/2p2JdPvoE9EVgO8OhJv/XxdkIcGTKg91hG0OSE=;
        b=NKEuR+Q4dcnyCDBZwOtCRInWLHUiKUVAoFdGqCdj+cqL6ysTSOskRjEWmNIzHF7Nb+
         qdOMGGsS5XW1d9iH52LU0yiA0Qw9nFavG5mL0QYb8zfZ0fmpA2Uq/7fXVixk2+g1b1SH
         OJln1f0LSFwPg1kEggIdecwOHKG9T2jJgQWmXmOG3VZMJGzXjRtSIQrKCBbdL4MCFckF
         wymk1f4i4vdssKucIP1x2ETok9LXa+z9rOHs1UhGeOELZMtJhlr6pXQfZUkN/A4/erhI
         gx5+hOGEITI+iHK4yGKwuMyPb35L7yTuFkdgrmOriy+Hpihqt2NVy3EA8CMY2EWi5Fh5
         0Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759500025; x=1760104825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1I+/2p2JdPvoE9EVgO8OhJv/XxdkIcGTKg91hG0OSE=;
        b=d1xU823iPQDGDJKS5fff0qRACJpZWwNgNRlUnQBn6ctywWDujlvAbRNtrZtLalK5Sv
         UTNwJRV5+2p76wYj7Q4fP5oUS1wNdKJAZI/qas9LMJHOZb1S4C/RM86aEZH4NrpXfIYY
         SvaXMLgr4XtRNHWEz+GXlXhmXeTEiR9msPdrJvEA7+p9cy+bvOpwqiUmCP4CitsILSEw
         flOuJ0GCTqQzBn1HmipYiBvHmiMVmKkI6cBpjO1jGEcMMKBCY3Q6CFqNfkPsbI8cZYzI
         hlltQ+ONE62eJISi9+3BSGAx11/FJug7UUZwcpMRv6cyD+G+UbFCmzm2ozCq2Hzx05TZ
         UiNg==
X-Forwarded-Encrypted: i=1; AJvYcCX0aruDRcNsgSmgEqKAfQfsTmeYRvdKPFYqjf13z58AXBGlDmu6CRN1pdIw4IN46q+GLltnPF3A7updgoq4h8WfyPEjSw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzEfFaKrPnq2X8Yk1p5pGoq8p3B08BB3aiIZnnqqUYaBIMGagjn
	qWTd4koJ6ln6wIjzmCv5XfVm0CPzQU9I5V1xnTNJOVM+6VJ44XlKg2QH8dZFsuHPNTM=
X-Gm-Gg: ASbGncuQ0LS3YOJCFHDtb+LF1NqAKWNCYGNRLaPro2I12xR2OJHQfAEGYzVru1TZgkj
	STi3EiWCMx2jo1vtDC9OyzlJEjx1Ab7icZkOlvtrUA3fZBr+3JVj2zL5dOrmrTA9MZCPAL76/2p
	/6CGZZE/DeeAufp8XfwkMeHsXBPpuvy5P8U7LgeZfUU1Ax368OqIx0+pNnoIXBlJDCwTuZGBhXu
	xDhRcIg+8E5dZnKZ4DnDa3ATE/1loCZK02EiZWi4eAqkAI/b0IruDkBB3PLbtYaBqfLI+EkS+/C
	zHygXtIqzGgjxfTZHpuMDcJG86I90LDV+Lj8Hr2ErMllT9qNx0fQYvKItxqsRCpfH4qdpBlH6Le
	GO+fVU37n2oe3cpbKdJkEUIFu4V/LG7CB0h/UuIM2EPMOtA/fPjqaRW7tiJLJnz+bf84=
X-Google-Smtp-Source: AGHT+IGxLyC2md5Jx51m9HM2p3j5fCUCQApXbhQWufGaXIfDffbKLaJKFwko+zfFqgwUdARWXwlQ8Q==
X-Received: by 2002:a05:6000:25c6:b0:3f5:d7c0:8e20 with SMTP id ffacd0b85a97d-425671c53f0mr2152207f8f.59.1759500025479;
        Fri, 03 Oct 2025 07:00:25 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723431f5sm31917445e9.2.2025.10.03.07.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 07:00:24 -0700 (PDT)
Date: Fri, 3 Oct 2025 16:00:22 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tiffany Yang <ynaffit@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH] cgroup: Fix seqcount lockdep assertion in cgroup freezer
Message-ID: <nbtofen2pwqmp7r5odbyc4en6vv54rpznyaanxlb6tbx5yyg25@jx2re5hdmt5e>
References: <20251003114555.413804-1-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="twwjz6pyzgqr4kbn"
Content-Disposition: inline
In-Reply-To: <20251003114555.413804-1-nirbhay.lkd@gmail.com>


--twwjz6pyzgqr4kbn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup: Fix seqcount lockdep assertion in cgroup freezer
MIME-Version: 1.0

On Fri, Oct 03, 2025 at 05:15:55PM +0530, Nirbhay Sharma <nirbhay.lkd@gmail=
=2Ecom> wrote:
> The commit afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> introduced a seqcount to track freeze timing but initialized it as a
> plain seqcount_t using seqcount_init().
>=20
> However, the write-side critical section in cgroup_do_freeze() holds
> the css_set_lock spinlock while calling write_seqcount_begin(). On
> PREEMPT_RT kernels, spinlocks do not disable preemption, causing the
> lockdep assertion for a plain seqcount_t, which checks for preemption
> being disabled, to fail.
>=20
> This triggers the following warning:
>   WARNING: CPU: 0 PID: 9692 at include/linux/seqlock.h:221
>=20
> Fix this by changing the type to seqcount_spinlock_t and initializing
> it with seqcount_spinlock_init() to associate css_set_lock with the
> seqcount. This allows lockdep to correctly validate that the spinlock
> is held during write operations, resolving the assertion failure on all
> kernel configurations.
>=20
> Reported-by: syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D27a2519eb4dad86d0156
> Fixes: afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>

Link: https://lore.kernel.org/r/20251002165510.KtY3IT--@linutronix.de/

Yes, this is what was discussed yesterday. Thanks.

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--twwjz6pyzgqr4kbn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaN/W9BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgskQD/VZYTSgJV8TksM06o+G+A
UVtyHkxTmx7U6OUOjRKT7lEA/i5BQk7/GJc2WflFnRYc7WUQqlTYbotjwBZ2vWgK
dSMB
=4Bm5
-----END PGP SIGNATURE-----

--twwjz6pyzgqr4kbn--
