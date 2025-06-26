Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE0D1A0BF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957182; cv=none; b=RZfSJZM4YVXP5m9HM7CTrKinkd8Y/JM65NrSbPWTXNKsAdkbu6U/qTr3QZVND9QFoakKAtzkwFdQNAPkBwBKzQYU9iZXOhNAR9b//yWv6l6J1oTU57JGWN6vpP/wqWE/wzj7Bcy7rmgQ8lC+psEPcVJjCKRMlFABrbmP+K0t/cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957182; c=relaxed/simple;
	bh=aIxIA6zQvTROLZ2rBk9oC7yeFzYwYAj55y3ZB/NadJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1wKkOv/OQVG3ViWz1oMyMtj5kUatHApXDn2TcXDiLGyPdZ+DR21ZJYoeqJksOS/qnXQAJipq6jQCInzB/jPILJfic8We0Yi1u4h0hNE2d5tLPs9H5+x9yRq8pDHprNI3u8PZ2jYjlb0TdL5+cnKK+GEmUhDco3W0Et8Y0Rr/KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2ShZ4N1; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2ShZ4N1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0628540261
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMFKLHgESonQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Jun 2025 16:59:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3989D40269
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3989D40269
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G2ShZ4N1
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3989D40269
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 16:59:40 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2353a2bc210so12937705ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 26 Jun 2025 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957179; x=1751561979; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhz1FOD9yNsNC2xPBOAJj+zX5MtGTzkAHI8nVF6cq9U=;
        b=G2ShZ4N1U16cIMySVQtcEk58sMPap5uuDwl1yinaSG27d+028X17Qnmzwa0ONwMS9j
         V6sDqkfXmzV/V1iRzV/HTIfo1rxVVlZoNTe8qVC1jYh+ByPPcN9cH7QyeINFlH9YJGY2
         pjeO3tw4skl7hryZN4JccFee8mwPaBMTJCYmzXWT1qUmwdMZXIMDCAa9UT57WuJehrLk
         slvW+4luADQzSkogYQ9DUz4XM1KMvIwjygHzax16nAs1gMMhvgTaXLFiDps1AOzwepcY
         4b0+/l4IjdYrUSBnIanawka3/7tkBr4SiUlDWj0OnTrUR7/EoVM/j1o+TUYB8AY0wdMz
         Ix1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957179; x=1751561979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhz1FOD9yNsNC2xPBOAJj+zX5MtGTzkAHI8nVF6cq9U=;
        b=i2IUehwgixj/+WIO84/gZNJVTRMC2DoqmnwkR0EEpI/pZnVowkGiBRvOiJs5dyveHs
         BgrxC+vnghn8PqNLt4xpYv9DwVYhw7syo510uDEs+iGzqpzYZXhj80WMv86+0J1g9PtH
         sszVdPpmM6+s0401vzz/CM35sR2uWgI1m44adAoOqLEO8sETXg31vQ0G9IPvQrqWBBt1
         ryqw44HVyBrxx4/LwnYWFydlVtFlKo8LqH2HrvsNlD6WPyfVmt3PLdCySgtRMBcIxnYw
         BoLmjb8xBQ3/HPSBqB7PbwJsgmx9o131D2CCZv8okuAKBR07/EXkKYWhgV5h3hOxAgws
         4lBw==
X-Forwarded-Encrypted: i=1; AJvYcCVgWpjVEkOE6eSPG/U37hwmD5Wt54aAjyAIGK0UcWGT7yvKts+YSNLanqwdp5Y5X/ntgFDQsuFSjTIv6D0F1Xb0Cz0b5A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyXjzzX3zJjAdpip8DNCsBK98gV7Io58IlHWCQQH+CkwwW8apQv
	bgxsn6QJLFMO13jzO2cfXTjonyThCwd7sSa1OgP+H2KvxejU2Aro7Y2x
X-Gm-Gg: ASbGncvc6ulc/ue+TEaVxpsgFIriOAVflmrIzCPZ36jAalqes01hh7fo2E9Kv6AU3Jz
	r6lmiUtQbRHsK3agy1SMSrOuFRTPnOP6mojQ2tSnaLjByyLEt4V7ZwXrwuLEzSUI8JyYyNcqoP6
	ohEgjZRBavWpBxKyWHY5sg8Y0PgpbcOu1Bqzh7sKk93jIUeuHaYVt8UVacXEJaQeN9vwjaredjR
	Z5UaW0HjVcxSwEfBWlyvXDHmqdBcWmwow+6ScqRod4wi4zEHSXqEJWQI3tkNj/xKS4VsI7I9i+r
	pPBxiAmfxjyBpF3pBumYokUvryMp0fFM9ipE8VY7nu1OYa1+
X-Google-Smtp-Source: AGHT+IEydPZD5gf5bm0Z1et3oJc58NxqT032IKiYytwtIjpzcFTtkrxz13uS6GICiIbwAYIj1/h9+w==
X-Received: by 2002:a17:902:ebc4:b0:234:a139:1203 with SMTP id d9443c01a7336-23ac460552emr763695ad.32.1750957179451;
        Thu, 26 Jun 2025 09:59:39 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329b72sm2615195ad.80.2025.06.26.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 09:59:39 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v5 0/2] rust: revocable: documentation and refactorings
Date: Thu, 26 Jun 2025 13:59:25 -0300
Message-ID: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series brings documentation and refactorings to the `Revocable` type.

Changes include:
- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Splitting the internal `revoke_internal` function into two distinct, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization), now returning `bool` to indicate revocation status.

Marcelo Moreira (2):
  rust: revocable: Refactor revocation mechanism to remove generic
    revoke_internal
  rust: revocable: Clarify write invariant and update safety comments

Changelog
---------

Changes since v4:
- Rebased the series onto the latest `rfl/rust-next` to integrate recent changes, specifically the `bool` return for `revoke()` and `revoke_nosync()`.
- Dropped the "rust: revocable: simplify RevocableGuard for internal safety" patch, as the approach of using a direct reference (`&'a T`) for `RevocableGuard` was found to be unsound due to Rust's aliasing rules and LLVM's `dereferencable` attribute guarantees, which require references to remain valid for the entire function call duration, even if the internal RCU guard is dropped earlier.
- Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno Lossin's and Miguel Ojeda's feedback, adopting a more concise and standard Kernel-style bullet point format.
- Corrected a duplicated line in the commit message of the second patch.

Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more precise about read and write validity conditions, specifically including RCU read-side lock acquisition timing for reads and RCU grace period for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.
- Link to v3: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.
- Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

 rust/kernel/revocable.rs | 68 +++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

base-commit: 0303584766b7bdb6564c7e8f13e0b59b6ef44984

-- 
2.50.0
