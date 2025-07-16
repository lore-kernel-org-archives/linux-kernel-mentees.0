Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DDD2ECE82
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 23:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752709931; cv=none; b=iHpJfMBFRCR7A1kI1SdYd93vnkRztqHqkvz9fVuoXvZyQoMdJtIg5JvSb/2j/0bitdm6CFzqCZHiSrn0sEBBAlXwHJpSaOwCwZAyEBMN0ihe6irYc/fk/yjZ73H3FpysXj+ikly/captwEHUzIB0pWSz8oygtw7VRWsjAE+q0Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752709931; c=relaxed/simple;
	bh=8cc2Nz87MAuzNDTFYLrAfgQhXEv/HRfUJbJCoQPND0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6lhruHsIm50K5gEwR/kgDp8lAHppSyaQqML3FiOxHxacaILCbG8Olbtrw8cljXNfF3g0ijzwAYQa+cFWg84pTS1ITMJ67gbsWrODqlHDO1kJlHBhHuOLZx22i2KZK6nLWJNU5GBpVpv2fflLbZt0mdmTTJE/TtW0LMJgEnuUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=aPsuBr6u; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="aPsuBr6u"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E01CD83F11
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 23:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXv891ibsnLa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Jul 2025 23:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=david@fromorbit.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2F8B83F10
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F8B83F10
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=aPsuBr6u
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D2F8B83F10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 23:52:08 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-748d982e97cso407874b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 16:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1752709928; x=1753314728; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V9iYhf+TmOaeuGFTnHtMZsVUbgjznZbhmRqA/iiwsEQ=;
        b=aPsuBr6uwAQMQ5z2KA5FWuVw3lP3sZltiCwWZOsKQtZt0paUVL0EgjbD4S4QLoZVqT
         aOJj0VR4uLdXSbl/S2qta4ub2XTbMnYv4Yl8+qsz4PDAzTMEaSHVMSpcS5cgT/Zid5O+
         rE3K97N6cfl8Q+oaJXO/zmtg4RvsLzahkI1U4G/d1RrCo/PsAiO1t1+4ApjVp0DVX4TS
         aZifYGcJB/vtcVORyvVfSFZn50lzaF5iG2EZ4u15POpF4/u7fSXt7LGcNcxt+KvEKAti
         TcZo7x9D94eKMaM4ecKReDl71bo4FCuyUe94OjnQLX7Uj/Y0VYm6QUMVza2mWr/5jf8L
         P2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752709928; x=1753314728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9iYhf+TmOaeuGFTnHtMZsVUbgjznZbhmRqA/iiwsEQ=;
        b=YX06RtdGOyAVevKs2tlSw+OK0yhFIaAM4JMTNZ/3D0GBFPBfkb0cl+7dVY2RHMp4nH
         7rUS7PfbkndQMMAZnCh8IyKGqSCUiZStEKv+dp7C7TmZJmPpZX0sDUr6VUxlkRc5AQ6T
         adcaBE+29d9N9FcDtXjEw/CcIuWi+GVe2cOxnPNHCmv7HDEnbzvxwkcjt/JZFvINsdHx
         cTekOz8FH8lSYOaFCXbuBBvXVREAH7Ka1+JXnFpPeahgl3TSS7zKskBL6jwZpaVgRlaN
         FYRwfekppHPI9DuPJdNvMLKoyM6sq636eM3ZkCy31XGLNKR6Exd0lLpP5M9PuGarh/Fb
         9olw==
X-Forwarded-Encrypted: i=1; AJvYcCV/cLZmOJqNeLfeKhCwxbhCKeATNCYcHMQABCNRMoOyEN7D+Cqfa6PfSuGKGvzKUg1CE+oMJA2ZGRW8WYPccaB7f6LYgw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzGwxqVoMIP/zrFTc0H/e0fVsU7sLEybAZCmVv1IepQSMz8g4XO
	UcQiUpxanuEn10xhZ2qBOTNTETDT5IiMyRs6XAhWAp/AdtFPDr8eje1G24HOxYrnzvE=
X-Gm-Gg: ASbGncviJAX05axpbi3Zi26VmL6azaeC2j5TLVk05zwxRJ5qSEE6hKN3NYap1V+1yG3
	Y0kR6//L9M1W/9BJC+/uVkbCuyCpElbqi+v0yTqDk7KpGe447CwjYXHtaJEcMiLrIRaNgJpHB0f
	Frq8ZEyKYb0KbXDcjcUzgptJHih4KBQrmTLgMDLM1tTieSpAkhk/TvRlwoP/IA/mj7Zs63lrCBf
	7550AdjjXtteJmNrFXMjVz2tHroAlZaglA3pA1CdsyW14WonBdZ0yE4h1BjGCAr+wmfpULyXqO0
	JT7SnzbqPmFE/jI3EqMuoOr5Jj3J8JTYc4pJ0Mx2uoktroUeHNG/blEEQkn6TRFdWYnhqH9WtXP
	Gv2gfKgfFnV+YYCJSsxi8eJRolr2KElAlTUAK4YvmrmoUkcLeUQ2ekqEhZjiu1xYSvI1Ve6TZZQ
	==
X-Google-Smtp-Source: AGHT+IHUiw/cyohjV69lTrcKLCPTOr7ZJr1M8ncyo7AQFt9fgkchZHyM+/jOrI9YcMR1a/4YY9Pd7A==
X-Received: by 2002:a05:6a20:734a:b0:220:3870:c61e with SMTP id adf61e73a8af0-23810a5901bmr7838780637.4.1752709928032;
        Wed, 16 Jul 2025 16:52:08 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-64-170.pa.nsw.optusnet.com.au. [49.181.64.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd714bsm14430679b3a.6.2025.07.16.16.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 16:52:07 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1ucBuu-0000000Bx4E-1rfh;
	Thu, 17 Jul 2025 09:52:04 +1000
Date: Thu, 17 Jul 2025 09:52:04 +1000
From: Dave Chinner <david@fromorbit.com>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
Message-ID: <aHg7JOY5UrOck9ck@dread.disaster.area>
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716182220.203631-1-marcelomoreira1905@gmail.com>

On Wed, Jul 16, 2025 at 03:20:37PM -0300, Marcelo Moreira wrote:
> The `strncpy` function is deprecated for NUL-terminated strings as
> explained in the "strncpy() on NUL-terminated strings" section of
> Documentation/process/deprecated.rst.
> 
> In `xrep_symlink_salvage_inline()`, the `target_buf` (which is `sc->buf`)
> is intended to hold a NUL-terminated symlink path. The original code
> used `strncpy(target_buf, ifp->if_data, nr)`, where `nr` is the maximum
> number of bytes to copy.

Yes, this prevents source buffer overrun in the event the corrupted
symlink data buffer is not correctly nul terminated or there is a
length mismatch between the symlink data and the inode metadata.

This patch removes the explicit source buffer overrun protection the
code currently provides.

> This approach is problematic because `strncpy()`
> does not guarantee NUL-termination if the source string is truncated
> exactly at `nr` bytes, which can lead to out-of-bounds read issues
> if the buffer is later treated as a NUL-terminated string.

No, that can't happen, because sc->buf is initialised to contain
NULs and is large enough to hold a max length symlink plus the
trailing NUL termination.  Hence it will always be NUL-terminated,
even if the symlink length (nr) is capped at XFS_SYMLINK_MAXLEN.

> Evidence from `fs/xfs/scrub/symlink.c` (e.g., `strnlen(sc->buf,
> XFS_SYMLINK_MAXLEN)`) confirms that `sc->buf` is indeed expected to be
> NUL-terminated.

Please read the code more carefully. This is -explicitly- called out
in a comment in xrep_symlink_salvage() before it starts to process
the symlink data buffer that we just used strncpy() to place the
data in:

		/*
                 * NULL-terminate the buffer because the ondisk target does not
                 * do that for us.  If salvage didn't find the exact amount of
                 * data that we expected to find, don't salvage anything.
                 */
                target_buf[buflen] = 0;
                if (strlen(target_buf) != sc->ip->i_disk_size)
                        buflen = 0;

Also, have a look at the remote symlink data copy above the inline
salvage code you are changing (xrep_symlink_salvage_remote()).

It uses memcpy() to reconstruct the symlink data from multiple
source buffers. It does *not* explicitly NUL-terminate sc->buf after
using memcpy() to copy from the on disk structures to sc->buf. The
on-disk symlink data is *not* NUL-terminated, either.

IOWs, the salvage code that reconstructs the symlink data does not
guarantee NUL termination, so we do it explicitly before the data in
the returned buffer is used.

> Furthermore, `sc->buf` is allocated with
> `kvzalloc(XFS_SYMLINK_MAXLEN + 1, ...)`, explicitly reserving space for
> the NUL terminator.

.... and initialising the entire buffer to contain NULs.  IOWs, we
have multiple layers of defence against data extraction not doing
NUL-termination of the data it extracts.

> This change improves code safety and clarity by using a safer function for
> string copying.

I disagree. It is a bad change because it uses strscpy() incorrectly
for the context. i.e. it removes explicit source buffer overrun
protection whilst making the incorrect assumption that the callers
need to be protected from unterminated strings in the destination
buffer.

This code is dealing with *corrupt structures*, so it -must not-
make any assumptions about the validity of incoming data structures,
nor the validity of recovered data.  It has to treat them as is they
are always invalid, and explicitly protect against all types of
buffer overruns.

IOW, if you must replace strncpy() in xrep_symlink_salvage_inline(),
then the correct replacement memcpy().  Using some other strcpy()
variant is just as easy to get wrong as strncpy() if you don't
understand why strncpy() is safe to use in the first place.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
