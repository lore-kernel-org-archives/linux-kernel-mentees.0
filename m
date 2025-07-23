Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7422EE26D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753280552; cv=none; b=n0y/X8cddbCeeYsYuW+zlkyC0kjGrZtN9pjsw+KyqPXPrJng9AkpDISYJvipOfQ/u2Sn2KtABIk+NhOpWFLIpzHLOD4sxtTU4ENw8gwcOR0heoeWlf9KQ0vMcqbrkJ4kwfxqn5AHL+gkpTDOvK6Av0lO9Dvt9BpsnyorMoeiBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753280552; c=relaxed/simple;
	bh=irba2H2kCrYF10ZfcmqgiijjlrWjkTfDhtrMohnXX1g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=B6p2rOovicroDNDpxsVs+j74PyfQFcBYcR0EWzP4xg6movI0zYDcPkRNLwjJHi9sLKGmp8xLIClsnzsio0ntn1uPyWbleWRv7wA7Y7G9owFTg83AKgMwxNCjV9fuQ9koFRx/9LvHw/q9Y+aPBpSgHFGc3Rhs+L+4xT1cljNNBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbMIjSjR; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbMIjSjR"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C7140F3F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwfCJRVkSq1Z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jul 2025 14:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49B2140F5E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B2140F5E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KbMIjSjR
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 49B2140F5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:22:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D32C05C6432;
	Wed, 23 Jul 2025 14:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB0EC4CEE7;
	Wed, 23 Jul 2025 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753280548;
	bh=irba2H2kCrYF10ZfcmqgiijjlrWjkTfDhtrMohnXX1g=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=KbMIjSjRB7MjgZIV8NZvZPq6/BfWtT0A69S6C5fUXQ2BHQS+EFir/7Sa38oFxeOC2
	 wuegcPSjdXpl01CMrcZfkmOOfBnEThQQSB7xO9TvvEiWJ3SQiZ9rIT1hD0c/BXE8AC
	 mfm+3bM3c9gMa5gxe7xRVo8+fbUd40vgQhyy0zEU6i279K/DAXsNUgyFh01XQg/XKM
	 W9F1BxCZ0YLszz0bdZFNKc/nwnqvNYza6jo9k43/flVJX8FIm4Al0N8qx5xW4kKAfb
	 0SLRgn60UlfT1E7U6pHIhMbzMTk27mOD/5koMhgAAWpD838mQWTByaDvfk2psu5vGh
	 R7mNMQuFPoCaA==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 16:22:24 +0200
Message-Id: <DBJI2YV59B29.2CZPPGB7G9TRF@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
Cc: <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com>
 <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
 <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>
 <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
 <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>
In-Reply-To: <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>

On Tue Jul 22, 2025 at 11:23 PM CEST, Marcelo Moreira wrote:
> Em ter., 22 de jul. de 2025 =C3=A0s 07:51, Benno Lossin <lossin@kernel.or=
g> escreveu:
>> On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
>> > Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kernel=
.org> escreveu:
>> >> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
>> >> > Refinements include:
>> >> > - `RevocableGuard`'s invariants are updated to precisely state that
>> >> >   `data_ref` is valid as long as the RCU read-side lock is held.
>> >> > - The `RevocableGuard::new` constructor is made `unsafe`, explicitl=
y
>> >> >   requiring callers to guarantee the validity of the raw pointer an=
d
>> >> >   RCU read-side lock lifetime.
>> >> > - A new `SAFETY` comment is added to `Revocable::try_access` to
>> >> >   justify the `unsafe` call to `RevocableGuard::new`, detailing how
>> >> >   `Self`'s type invariants and the active RCU read-side lock ensure=
 data
>> >> >   validity for reads.
>> >> > - The `Deref` implementation's `SAFETY` comment for `RevocableGuard=
`
>> >> >   is refined.
>> >> >
>> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>> >> > ---
>> >> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
>> >> >  1 file changed, 18 insertions(+), 7 deletions(-)
>> >> >
>> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> >> > index 6d8e9237dbdf..0048de23ab44 100644
>> >> > --- a/rust/kernel/revocable.rs
>> >> > +++ b/rust/kernel/revocable.rs
>> >> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinI=
nit<Self> {
>> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>> >> >          let guard =3D rcu::read_lock();
>> >> >          if self.is_available.load(Ordering::Relaxed) {
>> >> > -            // Since `self.is_available` is true, data is initiali=
sed and has to remain valid
>> >> > -            // because the RCU read side lock prevents it from bei=
ng dropped.
>> >> > -            Some(RevocableGuard::new(self.data.get(), guard))
>> >> > +            // SAFETY:
>> >> > +            // - `self.data` is valid for reads because of `Self`'=
s type invariants:
>> >> > +            //   `self.is_available` is true.
>> >> > +            // - The RCU read-side lock is active via `guard`, pre=
venting `self.data`
>> >> > +            //   from being dropped and ensuring its validity for =
the guard's lifetime.
>> >>
>> >> This shouldn't be needed.
>> >
>> > hmm, about what exactly?
>> >
>> > Are you suggesting to:
>> > 1. Simplify the content of the `SAFETY`, is it too verbose?
>>
>> It's not too verbose. The requirement of holding the RCU read-side lock
>> is not a *safety requirement*. It's already guaranteed by the existence
>> of the `rcu::Guard` instance, so we don't need to concern ourselves with
>> it in the safety requirements.
>>
>> Essentially you're just stating a tautology in the safety comment like
>> saying "2 + 2 =3D 4".
>
> Thanks for showing me that Benno.
> So we can keep it like this:
> // SAFETY: `self.data` is valid for reads because of `Self`'s type invari=
ants:
> // `self.is_available` is true.
>
> Sounds good?

Ah sorry, I didn't take a good look at the non-RCU justification. I
liked the phrasing in the non-safety comment:

    // Since `self.is_available` is true, data is initialised and has to re=
main valid
    // because the RCU read side lock prevents it from being dropped.

So how about we combine that with your current version:

    // SAFETY: `self.data` is valid for reads for as long as the RCU read-s=
ide lock is held because of
    // `Self`'s type invariants: `self.is_available` is true and the RCU re=
ad-side lock is held by
    // `guard`.

---
Cheers,
Benno
