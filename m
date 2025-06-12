Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A41F92E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721956; cv=none; b=huf7ySEMyQtnghPQUqVj1IyMTqDq6O8LsG4jMSYlcQoxehbFBq8p1dInbGa2cnv687oEO/MHrWXd8K3sfuH2+V4vFU5ePWJRFV2ohJqApQA1uHVJ1uOWV4PFkolyE4LsAPA5rOzNEh2ez8+HHtaCT3xohODzHKnshmxTtnMw5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721956; c=relaxed/simple;
	bh=OQ8WN/7ZBeWYIq/U4L85IKOkozwEeRXFle5rqcu3WRw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ejlJp9dsfDj8Qq80shLRRWEYY0gLMRLMmKlMUP25vMbbdBNIgHQbPdHtlGjnujyJc01WdG6EaijuoCCmPenkjadh2NLyauAE7LcZFssORRz8UWsKmmfjxtFherfxOkQaR8wc39Gqxv0PEDeER3Eml7jcNpo3rTXO7aa0F5BIs1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7mmizg/; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7mmizg/"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3E45407CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LR8YRhn7kpM0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 09:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5D1C407BA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5D1C407BA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s7mmizg/
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C5D1C407BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:52:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB636113A;
	Thu, 12 Jun 2025 09:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF139C4CEEA;
	Thu, 12 Jun 2025 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749721952;
	bh=OQ8WN/7ZBeWYIq/U4L85IKOkozwEeRXFle5rqcu3WRw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=s7mmizg/RUGOraWrwT+xN+TksKCRuDkUfh78R3YjYdHqm4Kxu8TKDNQIzKp6VebDP
	 hsd5W34HH5fuZR4yMP+ybMDw/SR1Fo4xXDWwUMeLrxY+Lnv7s5jPy9W6H68XevJe2E
	 Y66NcXveGf1TKXqLoF7ZrKTWpmZXM35/K1BfXWSZuDXhkhevuZW6RwECQsXsj4Qcrk
	 JCFVti+ZTzT2G7oF5NeIKMZsxr9vGn0jQkJCftr66U2kVuwhhsSbXK4lGx15aqZ7z1
	 6fj4EFyAzDIvNvH7o0xqwHRbtfpZXmf/Cu1egH83jeB40V1nF5vKSHT2VMwbaZ8aBN
	 rZbgirMYotF5g==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 11:52:29 +0200
Message-Id: <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
Cc: <dakr@kernel.org>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Marcelo Moreira"
 <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
 <aEqdur4JTFa1V20U@google.com>
In-Reply-To: <aEqdur4JTFa1V20U@google.com>

On Thu Jun 12, 2025 at 11:28 AM CEST, Alice Ryhl wrote:
> On Mon, Jun 02, 2025 at 08:26:23PM -0300, Marcelo Moreira wrote:
>> This commit refactors `RevocableGuard` to hold a direct reference
>> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
>> internally safe, reducing the need for `unsafe` blocks in its usage
>> and simplifying its implementation.
>>=20
>> The `try_access` function is updated to leverage `try_access_with_guard`
>> and `map` to construct the `RevocableGuard` in a more idiomatic and safe
>> Rust way, avoiding manual pointer operations. The associated invariants
>> and `SAFETY` comments for `RevocableGuard` itself are removed as its
>> safety is now guaranteed by its type definition.
>>=20
>> Suggested-by: Benno Lossin <lossin@kernel.org>
>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>> ---
>>  rust/kernel/revocable.rs | 26 ++++++--------------------
>>  1 file changed, 6 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> index d14f9052f1ac..43cc9bdc94f4 100644
>> --- a/rust/kernel/revocable.rs
>> +++ b/rust/kernel/revocable.rs
>> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<S=
elf> {
>>      /// because another CPU may be waiting to complete the revocation o=
f this object.
>>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>>          let guard =3D rcu::read_lock();
>> -        if self.is_available.load(Ordering::Relaxed) {
>> -            // Since `self.is_available` is true, data is initialised a=
nd has to remain valid
>> -            // because the RCU read side lock prevents it from being dr=
opped.
>> -            Some(RevocableGuard::new(self.data.get(), guard))
>> -        } else {
>> -            None
>> -        }
>> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard::n=
ew(data, guard))
>>      }
>> =20
>>      /// Tries to access the revocable wrapped object.
>> @@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
>>  ///
>>  /// CPUs may not sleep while holding on to [`RevocableGuard`] because i=
t's in atomic context
>>  /// holding the RCU read-side lock.
>> -///
>> -/// # Invariants
>> -///
>> -/// The RCU read-side lock is held while the guard is alive.
>>  pub struct RevocableGuard<'a, T> {
>> -    data_ref: *const T,
>> +    data: &'a T,
>>      _rcu_guard: rcu::Guard,
>> -    _p: PhantomData<&'a ()>,
>>  }
>
> I don't think this change is valid. Consider this code:
>
> fn takes_guard(arg: RevocableGuard<'_, i32>) {
>     drop(arg);
>     // rcu guard is dropped, so `arg.data` may become dangling now
> }
>
> This violates the requirement that references that appear in function
> arguments are valid for the entire function call, see:
> https://perso.crans.org/vanille/treebor/protectors.html

That's a good point. I don't see a way to make this work then... That's
a bit sad :(

@Marcelo: sorry for the extra work.

---
Cheers,
Benno
