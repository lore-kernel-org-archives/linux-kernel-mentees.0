Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888121EDA1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906930; cv=none; b=qKAA8edWBWMdd3RTxzKz+Xf7ntHCI2gR1MGuegwl4m3jfFUQI2zDNBopbOOWG0FTHW1mBw5FOS+1ENitVHTvTiJa0aNFHejmEYJMumqmYCzrXn2/X6rJ3ZUTXgeCApygj4QvCvyS0BJoq58rLXUN9xv95YOeQLctOFP/UVbCTm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906930; c=relaxed/simple;
	bh=90VFPrSConkA3YaAjhllgGvtc7bwvxjDQ4EC5BZJhNk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ozo4c08et5XnHhF04460n0qE6plggboWOT2mbvzf8di6t2MYTbALPptmyQYUNSGDfQ3iu4nU1nj6Y25/nxQu1APmnKF7EokD57Zm28qqS2JlRFZ36BpaQTZOIKMmf7CV6D3vadl0ORlYgVE+IV3mFA1wqfo1pLhfPBNjHTx0qck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTShkkWW; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTShkkWW"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2066E40AB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWFI60X6-kWk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 23:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D2FF40AB5
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D2FF40AB5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XTShkkWW
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4D2FF40AB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 23:28:48 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1276608241.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 02 Jun 2025 16:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906927; x=1749511727; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAuPBwmXwTSeJ2XYEad17pgAmp9jnBCGFvIFMuyIxz8=;
        b=XTShkkWW1ZwUEreL8Yiei/77NNs7fh8V7piheP+d+uI9QovFsO4b4zU5sj9v9gtN0n
         6b/+tz52LnDQ4QVmFcHGB0T4c/1AYjjl1W8VW4FbaI+NSXQ0Tn16z+IGJ3WELw0dZHBR
         aiAhU8JE8YIzdvzvKC3MEtoZr+MmSbx1ZiLt0FcGMHUPTkDtxxgix2Q0bpb8+0PRQh/e
         MIjd/ARDkX87MQgMb9ykgbfd9JqPkUTj0bxYC+99SAX3+Yd3duhVN73FuODS/WWWjKTv
         sF2OrgF7nmYg0TpkN+MJ5ZFkQC6Itzl9VWwPrvGE41ZGbIU+txMtFnJlC7tJ66Ap3qsR
         t3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906927; x=1749511727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAuPBwmXwTSeJ2XYEad17pgAmp9jnBCGFvIFMuyIxz8=;
        b=M21qYZhCkXbNK2Xt4eX0AXoJKuhSImqmaAAu9MvmwfF5/5Xd2xm5uwA3vFO5tUhmk/
         Buc8DA3tM3LCIbWb7LTF/hqUuTkmqRgzK+YLFWUaTNq/hXJGR+fypPP93h/HhBSie8y0
         7LWJfxotPkljN768lBXsIRxaE9VITHL5xNG3hR62CWOvbTT896k4tRbMVkpGolNjMex0
         wWPSQIXri2T1CW+POaaDeA2EBlEcYh0E/OBtmVUIwcePpKdNZ2Yyz55Mp8Dk3J15Ikzw
         cbqejJ7fNyY5/b36Zm7j8Ou7m433IKudqgvof84wxmCaacrxoOFMZHyh9UGcgPmljD9O
         Ps/g==
X-Forwarded-Encrypted: i=1; AJvYcCVDtUID026VXQMQLa+KOlgSIdRLP5BbkkI3StOJxR+TiIAYAcbRQB2eLsGhtgqjvOdv4JIe+8HMIw8yXVS682xBy6oBhA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxHpD9wGqyXD8J1volMSfCfFaMrtIPgtkpQ8dC8k+JuLixcBeoD
	H6ikPOLSvS0W9eIoImqCPwU1MMQ2Xlj1X0b3mhMO1eg9gR7xix8QgWhI
X-Gm-Gg: ASbGncsD+QITCcKJO4leJ42WTrYbDgAJ+6Ej27Xgw/MYJppjnmaJMp874N3XyoWfjeh
	96dayMv0WeyMQ6dXjekxZjgRze/EJFqUZhxRyRtxScsCEHIJl1oqgdMY8ek8EgEWhmGu8t7XIIp
	DPfOIhGr62D1IMI9BMrlPK7E62ajWmfRnGGycvtwU3AfInkRMYwFsGhg/6pYXCS7sMstTCC+OQi
	i2v8TBZ7UOkP1/5nk6SPNHQRwzKRtg/sO45MIi3JxadHo+fB/QaMFNubQbc6Lumgcn/ntyLQcm1
	usE8HcuvVKB+WUBuutrRSyqjcuJBA6+NIOiAseHt
X-Google-Smtp-Source: AGHT+IFWEuCGc4CrXV6Dzd3fN/VBwAH4LYpU8p17+uExNoyyhxWM36btqA/ivId0GipJfjq9XMxc4g==
X-Received: by 2002:a05:6102:3a11:b0:4e6:d9f2:957c with SMTP id ada2fe7eead31-4e701bd3ed6mr8018231137.23.1748906927024;
        Mon, 02 Jun 2025 16:28:47 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a39014csm6891262241.24.2025.06.02.16.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:28:46 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4 0/3] rust: revocable: documentation and refactorings
Date: Mon,  2 Jun 2025 20:26:21 -0300
Message-ID: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of patches brings documentation and refactorings to the `Revocable` type.

The main changes include:
- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Refactoring `RevocableGuard` to be internally safe by holding a direct reference (`&'a T`), simplifying its usage and reducing unsafe code.
- Splitting the internal `revoke_internal` function into two distinct, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization).

This is v4 of the patch series.

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more precise about read and write validity conditions, specifically including RCU read-side lock acquisition timing for reads and RCU grace period for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.
- Link to v3: https://lore.kernel.org/rust-for-linux/DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org/T/#t

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.
- Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

---

Marcelo Moreira (3):
  rust: revocable: update write invariant and fix safety comments
  rust: revocable: simplify RevocableGuard for internal safety
  rust: revocable: split revoke_internal into revoke and revoke_nosync

 rust/kernel/revocable.rs | 84 +++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 48 deletions(-)

--- base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72

Cheers,
Marcelo Moreira
-- 
2.49.0

