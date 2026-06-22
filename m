Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6A43491D0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124218; cv=none; b=nzoJCgUX0wWaq6CtT2E0HiBXDSn2iCgzXszgChsQGHJlfHH2Gx5L9yp+XE038j2BGiFh6IACwmGGRg1tUZwIKkvZ7wahOThDDai41Ukzi9TR7gR10DY08BjWepdjqPbjK1q2Sc7ZQy8bsqa01DSLboB1zXmCTsxpySDWovRxHqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124218; c=relaxed/simple;
	bh=Ii1KCfk/Q6UmKa4S2HR7teKRK6ri3Hm0oX1mojujygk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h32M8vUo16Yoy9WLnAtBj+s5NWfscT3ioSN+uq+gqc+/hvf3S/JMib+yUddDfjPEnAx1m+xs/uY35TqZfZ4g3qn39wA6UQByKYQrW9etUB4tEUhLGvG9Zmt0n02kdxn1iF8N+AommfkooORnAfczTZaC4kJWv+EgXy9zcHl/6Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJXvaMAk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJXvaMAk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0aa420401so25320615ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782124217; x=1782729017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii1KCfk/Q6UmKa4S2HR7teKRK6ri3Hm0oX1mojujygk=;
        b=gJXvaMAkWuLwYeTdVwssb4bnBGac8z31npn7dtIIqx+DIBEL6l6NoPMKaZvvOw6RVE
         yfzUoSigLQXFEzv/ODJmAFmY6RJmh7sDu20blkpN3bCIc4p/MaJtUke80cRBsQyDUfv+
         RvFYeh3wjGnzWoJrLgwOY3BrwhvpJE88lcvFTtDoe2YIcZ70U78yDXKQqNYCh7MW2vNa
         7+92GTPMY3buGGQH0tM2jexuHp2Cyhu6TQS6pQxpcnIuVQqqW0eAJ/IBa2xsuH6PcqTO
         YC0twtlw3zGolw+guULw8dce7wwAfavegKvB0sFV3P7848f4M/U9Rdmg8FfC+ORvcqVL
         uvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124217; x=1782729017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ii1KCfk/Q6UmKa4S2HR7teKRK6ri3Hm0oX1mojujygk=;
        b=joeTUEL1uOid8OC3gKxYiQ0yO/RX1ptoI3TTJ/tDLtBnM2Ye2qJDMsdu56DqJgtEjO
         SBbvdydFCeKK9I8KAglZih7kwYrLG4ODRIh8E3RLFtEyafYr7iXKtiG3SInRjvcNQ5mS
         i1QHCYLFUW5sKwmJSVUYvrph5wRnkLhjk69uw8dEptnP9acA89g0aZEphTDu4k9sgaBh
         zdXAkwNk53H8uv9PJHwSUBmFenO9IPAOKenzg4mxCufOQsdP2cvK83q/X70yn5Iqui6W
         eQKb1apHpD/LqEG36cwAprBUpIp4XsJL6PO0GKf8kq2bU2RwWMwGKlKXVDgIiSm7s2lt
         jlJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5XKLpOYfrQWjnpk4HroCq0bHE8jKiP8q4+ZDTiv++YhZLpbvTYriZ1MZjSyh8O8gMbdBQ6T7sLdBv2jAweMS5CIYUEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Kyo0S/lKQXmhltELhny8mM3AN8Q/ctHuxCIyVvmZBg+w9MxT
	e5bm7rGaC5Mn7r5Q8Hae0I+ytrd0JK+SYhNm2+C36YpCMbvG++uwc9DG
X-Gm-Gg: AfdE7ckQIToylvNFzxEK4D7X+KJumDiGOUu4ALf//QrIMAXQRxujpU2fQvshCCAy+uQ
	GguuOrRhtIUV2IcIBpKh8J+BrfzZ+mmovK3y9wMv3B/ufHy7SrO48ZkymgmvcUfDdNncXPhIfCJ
	xB0YSdHFdd1ngrmPvFSW9s57CSiWvSMAjXY8kdwp5CSOEovTR5BOT0ih9KtuRtE5hFQ3NbUhxFD
	S2dhiGGVo0sFpgQ3o7bCDTQxhzbUhQ54Dc5Ez8ll1ALnvwsS0WhbEHLJ5ceYiFkcVvp+HO2i8Wy
	8zfWDJhJSXdsmWvfawJsuBfySJ9iyrT37LUmQbhv+RF9B3TGkv7HD4uP1+Cn1q08bJiKfplk8ig
	Q8ae4QBmEd2zJlCk122rZA3BM/T/85WZK3NJwKyGgOodvfMHVZ7STYbCDztjvS0AIeN2fT7NGMZ
	ovih04ix1JCGExQw==
X-Received: by 2002:a17:902:d4cb:b0:2c6:f3ae:2383 with SMTP id d9443c01a7336-2c725b93678mr133806555ad.13.1782124216347;
        Mon, 22 Jun 2026 03:30:16 -0700 (PDT)
Received: from fedora ([106.219.196.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c742fdd411sm80718545ad.0.2026.06.22.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:30:16 -0700 (PDT)
From: Sajal Gupta <sajal2005gupta@gmail.com>
To: error27@gmail.com
Cc: linux-raid@vger.kernel.org,
	song@kernel.org,
	yukuai3@huawei.com,
	tomasz.majchrzak@intel.com,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to refcount_t
Date: Mon, 22 Jun 2026 15:58:58 +0530
Message-ID: <20260622102859.38034-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajj1yljwrUk0bZwp@stanley.mountain>
References: <ajj1yljwrUk0bZwp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

> Have you tested this at all because it doesn't seem at all correct to
> me...

I have only done compile test, sorry, I forgot to mention that.

> How I imagined this would work would be:
> patch 1: add a break statement to fix the use after free
> patch 2: s/atomic_t/recount_t/

> The difference between atomic_t and refcount_t is that refount_t warns
> about overflows and underflows.

I did it like this because that is the pattern mostly used in the codebase.
Simple s/atomic_t/recount_t/ would have
refcount_set(&io->pending_flushes, 0) in init
and then later refcount_set(&io->pending_flushes, raid_disks) in
ppl_do_flush, which is not the usual way. I am treating it as a proper reference
counter rather than a mechanical type swap.

If that is too invasive, I’ll rework it into the break fix first, and do
s/atomic_t/recount_t cleanup separately.

Thanks,
Sajal
