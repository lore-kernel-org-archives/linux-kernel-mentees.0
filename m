Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645AC126C1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934885; cv=none; b=HZdZkOoI/1hNDD3vOybeGzT9gjmS7K6Q8GEgkrTCRqJxQb3G1iRtKviuSJrn0dSb+QXpBInDyS2O4DGlnBXEgHBbQdIuJ5Sevte9/kVIeIdAEGRyIxNSE7gMY9IYXLFFGtiqDNisYaNuAI+lp6y90RFTmRYLjT3p7D84T/PxN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934885; c=relaxed/simple;
	bh=L4eSulxAuQZpqKg5PCAXb8YA1PW2FQFzzVkwqHXXUFw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UC5IyHWxk5KmcsEKtd0sMiE5xnKcKSlxo3RIZMUSRZKUChsU45tAnTMICIPn+VvJ2NB+gAcmNyQXP83HvgXFflijad7asMbG4p9hLOA0AGDK3svK7aTTk9XOjqH83nNT0lRe0/jkQpeEuK8qpGcTUMkWzhd2E6wHIr2hy9y7q44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSjLrYJg; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSjLrYJg"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAF20409BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLmx45vCjts8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 00:34:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07DB340973
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07DB340973
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iSjLrYJg
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 07DB340973
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 00:34:42 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fabe9446a0so36462426d6.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 17:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751934882; x=1752539682; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrFMatzixlUKW4LkgW03j5SAvkIgN7Eq9iXxugYbbGo=;
        b=iSjLrYJg1986A/EvuUomwvOG0qrPm2z/vSxlf/0zQovK3wu0Yzv+VCvNHclEw11MXL
         RqcUeiPG/cWxoUz0mreq66yiGVvD9LOY3b7XcCMmXjTGdEcEX6ZMvmcHcjtdWuciMeh+
         YP8kpmfnPOoD3ad2voD/cU2A4KyxpL6xRmsnATY3a+3ReyXK5u64YowvB2ng+QvfwnoI
         xNRvhJgZPzJ7JLi/aTKgPooSPgTAXZDVNtnVP5R0vjD/5t1sU0s6r+acmcgMGwbVM0/l
         HcwjeXeyGcjk81fIhEm0Ms0+3TuVc6+JtBsh5luF1k7j4oLXwjeZeO7rVBwSOjfqxr/X
         doXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751934882; x=1752539682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrFMatzixlUKW4LkgW03j5SAvkIgN7Eq9iXxugYbbGo=;
        b=eequ5p6VUT1/AISt02psFv5473W1g8q/AWpdVBkwzQ2y86veOEx/VCbppgUObrXIqK
         ROk4Zk/0PDIeXgC2HasxaZKkrRssQpWFpvZDoHzogqmZEZsoZ3bHPjtKeFvdmIYC2bWo
         PmQVmEbCIGZP+FVSHH5BjfVJ20TqLb/VMEd0udACaecrb/WsqmCAlaZqdEgAh28Aqq3T
         1JwvnPA3hHVxO+VC2m+GTCPiOge7/gLOV0PVSF1wx1y0duhk5fVoKXYxqzXw5/9gIAsE
         Ux46UHNUzmw7AWAyDa+zmlT1zSS5Szm/2W9lSiQrWzZL/y/vNIdOAQoATCVJgTAjQeLb
         MDpA==
X-Forwarded-Encrypted: i=1; AJvYcCW4W9iz8NfqHkpPdm2WUtJ/LmapgqFkbp/LVzGUKjHqLUnOVPeNo57LFwEhKlUGzTJxGwxzrJa6yr/wlZwm5Oqebe8wSw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz5G5f0GlZUtZ9qAuo6FIjOiMD65YDQRqVFIlU787WBfLu3W1NV
	vJxgpqXlVRi2KzjUtIdy19X9ZWA6gKp/yH3A1BmrssxLQt9VOOzZ855Z
X-Gm-Gg: ASbGncuXrTLYxAqWjznc4pNKwy/w9PQGg3qjXdiCJdrMKEmKL1n9pwZT5fiNLA4grnV
	gE+4E2hC8sLILi5pdNbVgEP3zuITRv4+Xx4lzc+Yv5gnzKw4QrNilRypL64aTBbcWV+KXMJk1Jd
	zqJnphRtmbNXoDMd4zrefvvRrVmSI4vZIrZfdFw9fNDb5/gpVcidF7nIT217yzOQeSzOnlkiW24
	Rn9Nk9U451EpVqX67u6XGTCIg65RfcXvvkjNSA26jeYYc4J8lMq/PwAsG8LLFZ0BJwuzfSlg2lX
	J8Gyhl7uiwI4p0uYpBviomAf6X9v92DYIyK0kiqFFAmu9VnrhkCBesc2GRY=
X-Google-Smtp-Source: AGHT+IE80cY9iHrKZv3ojE/kRMfStoQNau+2yzEGjqJNo+JbkzOwL3Sjm6TYeBtpgbjgtpPWzX/R0Q==
X-Received: by 2002:a05:6214:20e9:b0:6fb:3537:fcfe with SMTP id 6a1803df08f44-7047dad0090mr15036516d6.22.1751934881515;
        Mon, 07 Jul 2025 17:34:41 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc751esm68746076d6.23.2025.07.07.17.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:34:41 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: aliceryhl@google.com,
	lossin@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v6 0/3] rust: revocable: Documentation and refactorings for Revocable type
Date: Mon,  7 Jul 2025 21:33:36 -0300
Message-ID: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series brings documentation and refactorings to the `Revocable` type, addressing recent feedback and improving clarity.

Changes include:

- Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
- Splitting the internal `revoke_internal` function into two distinct,
  explicit functions: `revoke()` (safe, synchronizing with RCU) and
  `revoke_nosync()` (unsafe, without RCU synchronization), now returning
  `bool` to indicate revocation status.
- Documenting `RevocableGuard`'s pointer validity invariant and refining
  its `Deref` safety comment.

---
Changelog:

Changes since v5:
- Reordered the patch series to apply documentation fixes before the
  refactoring, as suggested by Benno. The new order is:
  1. `rust: revocable: Clarify write invariant and update safety comments`
  2. `rust: revocable: Refactor revocation mechanism to remove generic revoke_internal`
  3. `rust: revocable: Document RevocableGuard invariants and refine Deref safety`
- Added a new patch, "rust: revocable: Document RevocableGuard invariants
  and refine Deref safety", which explicitly documents the validity
  invariant for `RevocableGuard`'s `data_ref` member and refines the
  associated `Deref` `SAFETY` comment, addressing specific maintainer feedback.
- Updated the `SAFETY` comment in `Deref` implementation of `RevocableGuard`
  to match common kernel patterns.

Link to v5: https://lore.kernel.org/rust-for-linux/DB3XFMG7M4SO.J6A2LVOAOJDX@kernel.org/T/#t

Changes since v4:
- Rebased the series onto the latest `rfl/rust-next` to integrate recent
  changes, specifically the `bool` return for `revoke()` and
  `revoke_nosync()`.
- Dropped the "rust: revocable: simplify RevocableGuard for internal
  safety" patch, as the approach of using a direct reference (`&'a T`)
  for `RevocableGuard` was found to be unsound due to Rust's aliasing
  rules and LLVM's `dereferencable` attribute guarantees, which require
  references to remain valid for the entire function call duration, even
  if the internal RCU guard is dropped earlier.
- Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno's and
  Miguel's feedback, adopting a more concise and standard Kernel-style
  bullet point format.

Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWTLC5@kernel.org/T/#u

Changes since v3:
- Refined the wording of the `Revocable<T>` invariants to be more
  precise about read and write validity conditions, specifically including
  RCU read-side lock acquisition timing for reads and RCU grace period
  for writes.
- Simplified the `try_access_with_guard` safety comment for better conciseness.
- Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, removing its internal invariants and `unsafe` blocks.
- Simplified `Revocable::try_access` to leverage `try_access_with_guard` and `map`.
- Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions, making synchronization behavior explicit.

Link to v3: https://lore.kernel.org/rust-for-linux/CAPZ3m_hTr7BN=zy10m8kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com/

Changes in v2:
- Refined the wording of the invariants in `Revocable<T>` to be
  more direct and address feedback regarding the phrase 'must occur'.
- Added '// INVARIANT:' comments in `try_access` and `try_access_with_guard` as suggested by reviewers.
- Added the missing invariant for `RevocableGuard<'_, T>` regarding the validity of `data_ref`.
- Updated the safety comment in the `Deref` implementation of `RevocableGuard` to refer to the new invariant.

Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com/T/#t

Marcelo Moreira (3):
  rust: revocable: Clarify write invariant and update safety comments
  rust: revocable: Refactor revocation mechanism to remove generic
    revoke_internal
  rust: revocable: Document RevocableGuard invariants and refine Deref
    safety

 rust/kernel/revocable.rs | 75 +++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

-- 
2.50.0

