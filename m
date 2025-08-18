Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60F1E5205
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755554892; cv=none; b=QJHDiLXb3YvPG3c+5+yvrydiivOxLM3aopxyKgkftbnxgJXityan44pBICP9KUu3aboz/KTQYJtZQScEqKo41wc+Fx3B1ONo7xpsEePiRXcE617KO++TIoOIlTjP9/gf+OTXQokDkjhZkC0Ch7ssmC1gzFVhgAFJ52HODo6FxtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755554892; c=relaxed/simple;
	bh=D9yV9M9xlGkmZzsTMMErOfLEGeJjgavTMQUQ14g+LU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mqTu3GWRFFl1Gq+q7kXAVmNs4bqHZb1YKMt2T+L/R8jTc/37D8qdCPf7ueKJnsxqLcPZb/SyyDxGFaQ6u8GyiydQ6wkbFEq8CyD7umreE+HDFtt4uZxFCF0VPjGjyE6qH3gqzMgmjDJE4wTDYkXPGzSxHIbAN/KAgVnXbcgsSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOpYOJSa; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOpYOJSa"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357056064B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 22:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upZctk5ZmQwG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 22:08:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FB26605DB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB26605DB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FOpYOJSa
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2FB26605DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 22:08:09 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-30cce534a91so1764109fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 15:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755554889; x=1756159689; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivr2mj2LUTHOr0ikugFUKtF1bRoWYt8seugOhfcu05M=;
        b=FOpYOJSaTeVuuH2H5s3u2VfwcuXUhMbcCYRzMMgLiJf8rZj6FOtdM8jZteu61UARRC
         cdxjajvr93hsVNOyhFAJPbxwN1qpw2+ZD2srrWfopGmHR/nAtezkjMJUOocnRKZMb0Po
         prFbLpaXnB21F5r98IECAx9+pA7f/hagJllxM+6s5NZZNMg7EVGU1oH4FgceBxdppHc2
         Ox6sLAoTsqebbwuAYL6NVNQ/9dKn+LpSURgDqrtsiK3l30zYdofyBEeDMeC30HlOW+sZ
         ShO5sOXtfXaZKpv8+Vx2IjE1drmvHZFkw251CdWyKdqZEfZZR6268KWRh3anvDJ7oZBm
         yaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755554889; x=1756159689;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivr2mj2LUTHOr0ikugFUKtF1bRoWYt8seugOhfcu05M=;
        b=basPL50EaS4rqf7j+VJmTuygSiVMdCfrkar+w2IYrPkAX/9M6wAve3nZS+Hcd5g2To
         NVUYzJKJiQmyCZjRQDxxtw3UkpJl+soMbnYP+F0owEKo2gVtIjJRm0hqk5YWqQrxN7B9
         2jyHrVCLQw04n6ag1p15O1F/uU9vQCP7INCfwDuSmAw0it0UGX8/g9WsDfbA5kMfLU16
         bXCUKxCZYDlzYJr8opW8DTge6Z9BCwQ0coR2AUpw5fS4FXIN7jEx5+m8P/VhSTGCq1o7
         8WQMIbb8Bc8knhedhk6zLsLksNBPQomVRsDEBdYW7D0Tvk2nKbAwCqPaybvzi2yrtbWe
         f0IA==
X-Forwarded-Encrypted: i=1; AJvYcCUI/LgrBqjYjXh36ag8oGr4e8KRniQUMIxZKQ/5aD990CWmSeb76uRh00v1+JS/JLpnA+dCW+VSVadKw4YmSbs4Pk+XYQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw73H0gfsJBdl3j/hLUJMqIQ+D7TRZWMpmf6rfGvvHTWBGOOa/R
	vzf2SnliMnCN+NtzhJEX21+KNPNIbexCzus6KOfTXl66rt311+t5L40PzlSZfZR/MUMkO40Jmux
	3Xr2Xk80ITykV+USVxaA2H7xvnIHh4f8=
X-Gm-Gg: ASbGncuTs9Nqd3ldKTS2NvFflS1eDWccCArOxEe1w1kLE2mRivhVn99W8ahYfsN/1Hi
	Y8ta8SZh9At2cgnotDRf4Fa3iaXfJDRYk6bUHvQZ8ukm6/r/FNQKamgvrqCkY/IQFm7VZhMyF5k
	vVteOc4RlmMBh4Fp1HrrdRDc0mn3q9TMddw0qz07nVLASTlaE8Wf9/nSPKdD5c6qSeRgZYVS+X/
	K5PfaIt2Wn8/DUzqa9qzeSpLmqIJA==
X-Google-Smtp-Source: AGHT+IH5+x5M7W2uxE7Q7idPNd809ffvL9rNF2YJAmDEfQ1o+dRZRcsgMqQ/vczgpoujeUOYoj1EK7crDkepYVMGu6g=
X-Received: by 2002:a05:6808:2213:b0:434:689:6c10 with SMTP id
 5614622812f47-436da1d707bmr277065b6e.37.1755554888682; Mon, 18 Aug 2025
 15:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 18 Aug 2025 19:07:57 -0300
X-Gm-Features: Ac12FXxtcwRImt6IVgPmJZlqLebkugJF6k-Egi-Y3HnH8XQlgk1IesbxkQi7pzo
Message-ID: <CAPZ3m_gGdiF9HWpDoHuErnG5emv_v3f2xiT1PRhYFko3DkL2ig@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] rust: revocable: Documentation, refactoring and
 safety refinements
To: aliceryhl@google.com, lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 26 de jul. de 2025 =C3=A0s 15:36, Marcelo Moreira
<marcelomoreira1905@gmail.com> escreveu:
>
> This patch series brings documentation and safety refinements to the
> `Revocable` type, addressing recent feedback and improving clarity of
> `unsafe` operations.
>
> Changes include:
> - Clarifying the write invariant and updating associated safety comments =
for `Revocable<T>`.
> - Splitting the internal `revoke_internal` function into two distinct fun=
ctions:
>   `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe=
, without RCU synchronization),
>   now returning bool to indicate revocation status.
> - Documenting `RevocableGuard`'s pointer validity invariants, making its =
constructor `unsafe`,
>   and refining its `Deref` and `try_access` safety comments.
>
> ---
> Changelog:
>
> Changes since v7:
> - Patch 3 (`rust: revocable: Documents RevocableGuard invariants/safety a=
nd refine Deref safety`) was refined:
>   - The SAFETY comment in `Revocable::try_access` was updated, now clearl=
y stating how `Self`'s type invariants
>     and the RCU read-side lock together ensure `self.data`'s validity for=
 reads.
>   - The redundant line about the RCU read-side lock in `RevocableGuard::n=
ew`'s `# Safety` doc comment was removed.
>
> Link to v7: https://lore.kernel.org/rust-for-linux/20250721010258.70567-1=
-marcelomoreira1905@gmail.com/T/#t
>
> Changes since v6:
> - Patch 3 (`rust: revocable: Document RevocableGuard invariants/safety an=
d refine Deref safety`) was refined:
>   - `RevocableGuard`'s invariants were updated to state that `data_ref` i=
s valid as long as the RCU read-side lock is held,
>     and the redundant RCU invariant was removed.
>   - The `RevocableGuard::new` constructor was made `unsafe`, and a `# Saf=
ety` comment was added specifying caller responsibilities.
>   - The comment in `Revocable::try_access` was changed to a `SAFETY` bloc=
k, justifying the `unsafe` call to `RevocableGuard::new`
>     by `Self`'s type invariants (`is_available` being true) and the activ=
e RCU read-side lock.
>   - The `Deref` implementation's `SAFETY` comment was refined.
>
> Link to v6: https://lore.kernel.org/rust-for-linux/20250708003428.76783-1=
-marcelomoreira1905@gmail.com/T/#t
>
> Changes since v5:
> - Reordered the patch series to apply documentation fixes before the
>   refactoring, as suggested by Benno. The new order is:
>   1. `rust: revocable: Clarify write invariant and update safety comments=
`
>   2. `rust: revocable: Refactor revocation mechanism to remove generic re=
voke_internal`
>   3. `rust: revocable: Document RevocableGuard invariants and refine Dere=
f safety`
> - Added a new patch, "rust: revocable: Document RevocableGuard invariants
>   and refine Deref safety", which explicitly documents the validity
>   invariant for `RevocableGuard`'s `data_ref` member and refines the
>   associated `Deref` `SAFETY` comment, addressing specific maintainer fee=
dback.
> - Updated the `SAFETY` comment in `Deref` implementation of `RevocableGua=
rd`
>   to match common kernel patterns.
>
> Link to v5: https://lore.kernel.org/rust-for-linux/DB3XFMG7M4SO.J6A2LVOAO=
JDX@kernel.org/T/#t
>
> Changes since v4:
> - Rebased the series onto the latest `rfl/rust-next` to integrate recent
>   changes, specifically the `bool` return for `revoke()` and
>   `revoke_nosync()`.
> - Dropped the "rust: revocable: simplify RevocableGuard for internal
>   safety" patch, as the approach of using a direct reference (`&'a T`)
>   for `RevocableGuard` was found to be unsound due to Rust's aliasing
>   rules and LLVM's `dereferencable` attribute guarantees, which require
>   references to remain valid for the entire function call duration, even
>   if the internal RCU guard is dropped earlier.
> - Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno's and
>   Miguel's feedback, adopting a more concise and standard Kernel-style
>   bullet point format.
>
> Link to v4: https://lore.kernel.org/rust-for-linux/DAOMIWBZXFO9.U353H8NWT=
LC5@kernel.org/T/#u
>
> Changes since v3:
> - Refined the wording of the `Revocable<T>` invariants to be more
>   precise about read and write validity conditions, specifically includin=
g
>   RCU read-side lock acquisition timing for reads and RCU grace period
>   for writes.
> - Simplified the `try_access_with_guard` safety comment for better concis=
eness.
> - Refactored `RevocableGuard` to use `&'a T` instead of `*const T`, remov=
ing its internal invariants and `unsafe` blocks.
> - Simplified `Revocable::try_access` to leverage `try_access_with_guard` =
and `map`.
> - Split `revoke_internal` into `revoke()` and `revoke_nosync()` functions=
, making synchronization behavior explicit.
>
> Link to v3: https://lore.kernel.org/rust-for-linux/CAPZ3m_hTr7BN=3Dzy10m8=
kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com/
>
> Changes in v2:
> - Refined the wording of the `Revocable<T>` invariants to be
>   more direct and address feedback regarding the phrase 'must occur'.
> - Added '// INVARIANT:' comments in `try_access` and `try_access_with_gua=
rd` as suggested by reviewers.
> - Added the missing invariant for `RevocableGuard<'_, T>` regarding the v=
alidity of `data_ref`.
> - Updated the safety comment in the `Deref` implementation of `RevocableG=
uard` to refer to the new invariant.
>
> Link to v2: https://lore.kernel.org/rust-for-linux/CAPZ3m_jw0LxK1MmseaamN=
Yhj9VY8AXtJ0AOcYd9qcn=3D5wPE4eA@mail.gmail.com/T/#t
>
> Marcelo Moreira (3):
>   rust: revocable: Clarify write invariant and update safety comments
>   rust: revocable: Refactor revocation mechanism to remove generic
>     revoke_internal
>   rust: revocable: Document RevocableGuard invariants/safety and refine D=
eref
>     safety
>
> rust/kernel/revocable.rs | 88 +++++++++++++++++++++++++++++++++++++++++++=
++++++---------------------------------------
>  1 file changed, 49 insertions(+), 39 deletions(-)


Hello team, how's it going?
Are you reviewing the patch?
No one has responded to the 3-patch series yet.

If you need any more changes, let me know :D
Thanks!

--
Cheers,
Marcelo Moreira
