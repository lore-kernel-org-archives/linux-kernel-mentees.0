Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCD2222B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719082; cv=none; b=Vcdr14zJpDxTlTlvd6WQqpx/7PgWOuMUJbO2g49lulJMRR/GRhKm71rZ6lgu8KyGlJmo7IR/6o1dkN+2ofS0VWnUFq07dn/gNlbdDi6x1bnnWU9qZZthyZHWk4WaTROwI0EhRAl8y1Kmn07//+3S7m36CAry/0lJZvG30S4wEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719082; c=relaxed/simple;
	bh=vu8AGyM1c2C0L9TrY3Zs5vCdz8kAyVr+7JA7Jt5/tOs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=a7pSkipbqlI0OJsa/VRzXX35y6xr36a7o40cikFs6/wxrdDmzCAhKQION74bPsZfnu+s2qTRp/2gkwTQuXoeby63pA+E4DXbGMalhAN0i4rBv2q4yhuhRP1OJT2thkZhCJUXrORRJxI7ufSKL+Y7vUp2EjNtSp5nt15NUgpfsAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOAnSGe3; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOAnSGe3"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4F61405C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UU5FHn_e9WP0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 09:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BF9B405BE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BF9B405BE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NOAnSGe3
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2BF9B405BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:04:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E556A51A25;
	Thu, 12 Jun 2025 09:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C72C4CEEA;
	Thu, 12 Jun 2025 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749719078;
	bh=vu8AGyM1c2C0L9TrY3Zs5vCdz8kAyVr+7JA7Jt5/tOs=;
	h=Date:To:Subject:From:References:In-Reply-To:From;
	b=NOAnSGe3dLIwas87EoULiSsy1VbN2BW3HF9sxoDXwZeycu0B0KH/gzpEnh9Rv+nix
	 vK3dvn3eMcsyXAZ/iNL1Jnq0rdtT2NTZybFUAG5idbZHWwzu8cUkpJNVE0JpejFexR
	 B59PukLDhnhZ1rShyOtWLf87xFjZfwYiVFF2ucrXYtNxDBHOA4KgOp+rDjHkDnNIcO
	 ZX3sUrusKrBpvOJyoGyuvNA7nYARa0FdPxIurtursTLyF1wG1RES+wTVF90goP1WJ1
	 cVixbrHFqcEbGY4AF0eeQAivP3OANh5vi/+2wa2h49VN9ol4f3jjB9LeNRJ96lmpoi
	 LIa8RX0+sXawg==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 11:04:35 +0200
Message-Id: <DAKFNAO5O1OJ.20022X2NIFRE2@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
In-Reply-To: <20250602232842.144304-3-marcelomoreira1905@gmail.com>

On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> This commit refactors `RevocableGuard` to hold a direct reference
> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
> internally safe, reducing the need for `unsafe` blocks in its usage
> and simplifying its implementation.
>
> The `try_access` function is updated to leverage `try_access_with_guard`
> and `map` to construct the `RevocableGuard` in a more idiomatic and safe
> Rust way, avoiding manual pointer operations. The associated invariants
> and `SAFETY` comments for `RevocableGuard` itself are removed as its
> safety is now guaranteed by its type definition.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index d14f9052f1ac..43cc9bdc94f4 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Se=
lf> {
>      /// because another CPU may be waiting to complete the revocation of=
 this object.
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
> -        if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> -        } else {
> -            None
> -        }
> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard::ne=
w(data, guard))

My intuition tells me that the borrow checker will complain here, have
you tested it?

---
Cheers,
Benno

>      }
> =20
>      /// Tries to access the revocable wrapped object.
