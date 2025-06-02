Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8F2C327B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748829199; cv=none; b=H+mwHy+gZjXlb1J091rfs7y7veuOmIEztIleN3jv+dIVMrZxHdMJZlHAcYHHdgZTnUtSZ5oj9UyTUMeMYqXgTb2d/3gt/aCEgQGRZnFfWcS1OObX15jTSgG/YD6PMrq9DGTNyJ9sWztDPQ5PKI1r5iik/rEq9q5r5YejlV8z0iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748829199; c=relaxed/simple;
	bh=Am6j/3HDwLcnMuHrH2qHxtI6BZkkiUUYZNbHH0onLhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lSrn1x2cnUHO5JNGcFSsbH5TFKfvPOE0RJI3NprtKYtsEeKn3CDfdd/uGvR04eYxbvcQ2T+Mjm6P8ZjtD4DmbGnADC4O63uSQD5COzNxmMa7O9/60oQhvCBN2n52GhQpjZYVv2Tk9jXi6LS5yCAxpDAbwdrNEjJUwzIE587Q8q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9/Baagx; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9/Baagx"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 452DD60DA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3xlgB5-EXdz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 01:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B9A460B34
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B9A460B34
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U9/Baagx
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7B9A460B34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 01:53:16 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2da73158006so2955057fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 01 Jun 2025 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748829195; x=1749433995; darn=lists.linuxfoundation.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Am6j/3HDwLcnMuHrH2qHxtI6BZkkiUUYZNbHH0onLhY=;
        b=U9/BaagxKkDEY7oCMEVz7a8uEMEOEO17UZSyxUX/UWT2RVRNM/lrVTqjmhxuYS/vw3
         3KA7yBOKeh67Emziz5dDlfMWuKn7NAmWK1Knr7nvYA2djPSDTl01Ap0Cy7jUFdOl6EiV
         XHOV8eIsR2kMuwmoQmbtMzf0X7Ryq9kKUOZyY5dAwo7XS8iUH93YpMCbKGCyB7TSWpLq
         2P9YKlAOXmrqSHYreh9e7B1DdcYex6tD0e1/YOETbDJqyCSeoms0joE/T9mWUqgoQEnm
         BlBiDGhlnbYkSZ7S5YJGHjMe+kC/7iakAWI7EN/py6CS3atspDzrGmPElYXK6SKsK0uO
         KcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748829195; x=1749433995;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Am6j/3HDwLcnMuHrH2qHxtI6BZkkiUUYZNbHH0onLhY=;
        b=qMFUytWQAGGtdy/NegoUL8poaSofeBw08w9GpDkJHIOuiEllJCPncT0B8L99jQCGLa
         8V4YR+cmU68TAQucfdd776X9U6pWTRzdc9k+o3wdj6StJ0G5IkFkZLDNNQv3oaXmMRPK
         U7RznOUOrTNqut/yQVLCncVPiz2rlcPoOzhCea/OpX9y4D9jhj9MQb5LhjrSjF7jNc/+
         egQ+emhlnFEOCri5l7Po2opRujCYryM2Lg02bx8Kb5GeGhKH2RhrdAkYaVhfjLjYqXCe
         sqx8O4FYRvlwlhAc/Hig3/j7+pww6nSvDlJo6vBZ8/CDAZ0GSATs1KLeJ82j0Vwgdymh
         IWQA==
X-Forwarded-Encrypted: i=1; AJvYcCXTNRrPnbW0zFHZUb4qOKRnDRWPZnz8F5t2Zmk0Zhzi7RXzx/Yp5aanQfikn95G7wKnQVOtDJOZnsDjdshQpehYwwNFoQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzoHPE2qVCT88OxnApC8U44cQ8YKsetZ9/hnZI1EuJnEmNDhwaq
	VZgcuVXOHalRFwGyf5aTGKcP8OGCHPbJ3uEUZ95P1E54j6u6QP9c/VN3nWQaOKl8ZCN7IuGmqAi
	mJZqK+XJndgO9xmK5nLGUIFgbjZBynb4=
X-Gm-Gg: ASbGncvr06Rw3Pv/+PANxu2uoLm7jQkeY7iHYbbZe7gl+2wOX9YDC0P4TtmV5QPJfG0
	MaHEq/rdYR+lUAHwvVKICQ8hRVU6uJ8StNGRv+kes8aKvYYqFBobnRNU7mg/XvHC/47PkgiJ8U3
	b9YJKdI89Pfq14hnNPCpTScCDvNAXDw7rg1HDRHoZ2xNGo
X-Google-Smtp-Source: AGHT+IFjmIXlqwSTum2uCiJjnjMTUb+MTInW7/22NI5to1raKgcZN9OlGu6KkYbM7cVKdy8LusBJZMYjqYGKEXh8jbc=
X-Received: by 2002:a05:6871:c3c1:b0:2d6:6688:a625 with SMTP id
 586e51a60fabf-2e948d67616mr3580951fac.37.1748829195252; Sun, 01 Jun 2025
 18:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250602010701.116503-1-marcelomoreira1905@gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 1 Jun 2025 22:53:03 -0300
X-Gm-Features: AX0GCFvqn30FyYuvrXnm0Xv8jbqgobhz5w_IXR8mdp5TewOb865S_aTB3fUg9qs
Message-ID: <CAPZ3m_isiaSEH91epnMma-rU6a6gDhwVfL9ejLPx1xPMH0fwzA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: revocable: update write invariant and fix
 safety comments
To: lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

[PATCH v4 0/3]

rust: revocable: documentation and refactorings

This series of patches brings documentation and refactorings to the
`Revocable` type.

The main changes include:
- Clarifying the write invariant and updating associated safety
comments for `Revocable<T>`.
- Refactoring `RevocableGuard` to be internally safe by holding a
direct reference (`&'a T`), simplifying its usage and reducing unsafe
code.
- Splitting the internal `revoke_internal` function into two distinct,
explicit functions: `revoke()` (safe, synchronizing with RCU) and
`revoke_nosync()` (unsafe, without RCU synchronization).

This is v4 of the patch series.

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more
precise about read and write validity conditions, specifically
including RCU read-side lock acquisition timing for reads and RCU
grace period for writes. - Simplified the `try_access_with_guard`
safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`,
removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage
`try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()`
functions, making synchronization behavior explicit.
- Link to v3: https://lore.kernel.org/rust-for-linux/DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org/T/#t

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be more
direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and
`try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding
the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of
`RevocableGuard` to refer to the new invariant.
- Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

---
Marcelo Moreira (3):

rust: revocable: update write invariant and fix safety comments
rust: revocable: simplify RevocableGuard for internal safety
rust: revocable: split revoke_internal into revoke and revoke_nosync

rust/kernel/revocable.rs | 84
++++++++++++++++++++++++++++++++++++------------------------------------------------
1 file changed, 36 insertions(+), 48 deletions(-)

--- base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72

Cheers,
Marcelo Moreira
