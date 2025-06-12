Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5171CDA3F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719224; cv=none; b=BmgohDMQOfXFrjJi/+gFtII3MM/0Rl3/ejIEqw1MWjzHzydR0Sk3fRhIfEUxCAaCk5NBY88tlsL1fpB5ZmJTwgVcXOrypalR0UweFDI/9sisfJa++OOWb477oQGXPf0ZogwK390w9pNj3nBmnbkWKLp/+GiSFy0Q0NhSs7Yi9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719224; c=relaxed/simple;
	bh=VazXB0/f05YsdrOsxvpLZfrEtwWZwrDJSI4e/vtYMNQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=ueNo92L/NL2BN8Hjd1cpKEfrpJxgPwvfrlnn8Gm1uxfpFv+vL752EuksKsf0SkOZzfDxcruSSDVSgEnGc0BQO/G34XJVoYnV6glj70HLhYelh4hqSKzbtGFkkfqAYVjqJbDtDw8l9UMXZG+CJVwHL2W54/IgUEEQvNreVzAv+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt6Z2820; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt6Z2820"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ACA9406DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdrQYx_6hT9L for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 09:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F1F6406B1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F1F6406B1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dt6Z2820
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F1F6406B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:07:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB90F629E5;
	Thu, 12 Jun 2025 09:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7151C4CEEE;
	Thu, 12 Jun 2025 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749719219;
	bh=VazXB0/f05YsdrOsxvpLZfrEtwWZwrDJSI4e/vtYMNQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Dt6Z282002hjaAFg/6NqL9SxCDyQ21wT2J1zSBStX036OrbKfPUQAhU+mK3glabx+
	 0nsAz6v+qgIn5uO+48wiUifNlGXeglt6Tkn0w2zbGH/yHOXUG271yF9+f6deBj1Y79
	 w44YJDZcC1h+zvQrNzKAEDTXvpTWtCGGfpCX9lAqSr0h2insqyQLld5vMoRri+J+9E
	 Pwu7L4VHvbzb/Pik16JhGVygOaiCTJHNtw0+GCXLl+AlCSTQ1faN6J8DF6eaKLkNhd
	 z9kyKvtiQa/+lp/uxcfcfHS1FAhY4BB7JmqnfezQmnv9S0+FqDqGW51geJeYcnFklX
	 NE37dzu42ni7g==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 11:06:56 +0200
Message-Id: <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: revocable: split revoke_internal into
 revoke and revoke_nosync
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250602232842.144304-4-marcelomoreira1905@gmail.com>

On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> This commit refactors the revocation mechanism by removing the generic
> `revoke_internal` function. Its logic is now directly integrated into
> two distinct public functions: `revoke()` and `revoke_nosync()`.
>
> `revoke_nosync()` is an `unsafe` function that requires the caller to
> guarantee no concurrent users, thus avoiding an RCU grace period.
> `revoke()` is a safe function that internally waits for the RCU grace
> period to ensure all concurrent accesses have completed before dropping
> the wrapped object.
>
> This change improves API clarity and simplifies associated `SAFETY`
> comments by making the synchronization behavior explicit in the function
> signatures.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

One comment below, with that fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 43cc9bdc94f4..daf22e3a7d20 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard: &=
'a rcu::Guard) -> Option<&'a
>          }
>      }
> =20
> -    /// # Safety
> -    ///
> -    /// Callers must ensure that there are no more concurrent users of t=
he revocable object.
> -    unsafe fn revoke_internal<const SYNC: bool>(&self) {
> -        if self.is_available.swap(false, Ordering::Relaxed) {
> -            if SYNC {
> -                // SAFETY: Just an FFI call, there are no further requir=
ements.
> -                unsafe { bindings::synchronize_rcu() };
> -            }
> -
> -            // SAFETY: We know `self.data` is valid because only one CPU=
 can succeed the
> -            // `compare_exchange` above that takes `is_available` from `=
true` to `false`.
> -            unsafe { drop_in_place(self.data.get()) };
> -        }
> -    }
> -
>      /// Revokes access to and drops the wrapped object.
>      ///
>      /// Access to the object is revoked immediately to new callers of [`=
Revocable::try_access`],
> @@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) =
{
>      ///
>      /// Callers must ensure that there are no more concurrent users of t=
he revocable object.
>      pub unsafe fn revoke_nosync(&self) {
> -        // SAFETY: By the safety requirement of this function, the calle=
r ensures that nobody is
> -        // accessing the data anymore and hence we don't have to wait fo=
r the grace period to
> -        // finish.
> -        unsafe { self.revoke_internal::<false>() }
> +        if self.is_available.swap(false, Ordering::Relaxed) {
> +            // SAFETY: `Self::data` is valid for writes because of `Self=
`'s type invariants,
> +            // as `Self::is_available` is false due to the atomic swap, =
and by the safety

Please also use `self.data`/`self.is_available` here (& below) instead
of `Self::`.

---
Cheers,
Benno

> +            // requirements of this function, no thread is accessing `da=
ta` anymore.
> +            unsafe { drop_in_place(self.data.get()) };
> +        }
>      }
> =20
>      /// Revokes access to and drops the wrapped object.
> @@ -165,9 +151,15 @@ pub unsafe fn revoke_nosync(&self) {
>      /// [`Revocable::try_access`] beforehand and still haven't dropped t=
he returned guard), this
>      /// function waits for the concurrent access to complete before drop=
ping the wrapped object.
>      pub fn revoke(&self) {
> -        // SAFETY: By passing `true` we ask `revoke_internal` to wait fo=
r the grace period to
> -        // finish.
> -        unsafe { self.revoke_internal::<true>() }
> +        if self.is_available.swap(false, Ordering::Relaxed) {
> +            // SAFETY: Just an FFI call, there are no further requiremen=
ts.
> +            unsafe { bindings::synchronize_rcu() };
> +
> +            // SAFETY: `Self::data` is valid for writes because of `Self=
`'s type invariants,
> +            // as `Self::is_available` is false due to the atomic swap, =
and `synchronize_rcu`
> +            // ensures all prior RCU read-side critical sections have co=
mpleted.
> +            unsafe { drop_in_place(self.data.get()) };
> +        }
>      }
>  }
> =20

