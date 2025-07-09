Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659A123B608
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  9 Jul 2025 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048306; cv=none; b=rVD/fp+7A3FlNK6vGB8Xmf4hQem+PnhyZ1CPhAVmHJ5F9KD01akL/ySIeje+efP2n+EwajErigd+2H6AzPlIHND4B1T+EDMBOrDsglKE91uw0agxOHMR8CzF5tZfp1CfgDMTSypucE4RkN6v+seKUif8tqH92DPPaGt4FSVUqEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048306; c=relaxed/simple;
	bh=A5F7lsTYr8WzzKN0V1G4Qhmzzhzkqy3tyBEFq5W+5po=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aJrB8R/yHrm5dulkiyjoNExwrmFv/4/oeQXbOahHFRRavPN7e738Q+uuGiKE3EHp7pPzV3fv7B+uL6Tss9V91kxIaZX55RbvKvMybRRZixIHyaNQIT7/2YNcOoCQHLm+8c5Rn9OvguyKHsEKFHnH/HXZgqdFuUNPC1TD3teIREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtfmutvY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtfmutvY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 640F24041F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  9 Jul 2025 08:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZVfhaLTDy11 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Jul 2025 08:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8F124043F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8F124043F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PtfmutvY
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C8F124043F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  9 Jul 2025 08:05:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3471E6144A;
	Wed,  9 Jul 2025 08:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B69C4CEF0;
	Wed,  9 Jul 2025 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752048301;
	bh=A5F7lsTYr8WzzKN0V1G4Qhmzzhzkqy3tyBEFq5W+5po=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=PtfmutvYfdBqAB9pw5+f01vaxo3V9cz3EsypO7g8gg4AyG4D52QfQ8JNBFFZctb0B
	 8FvVjbq9vhADwhK6QuH1yupgRDASMPxrP17Xrbep0B9F/z0fUDMc5lUNg6MOgUhVbd
	 N672+y2KGydlHKxQFdTYfj2/bc4vjsrELIcUvaeSunJT17IqQe0f0UJYp96lYs6c8r
	 AHazA/Kn8ckuVw0xiqGlaf+ZPJQJJKTcEQyd7856EkEqNPasqRkaQ9N53p/KNNaw7Z
	 BsTQhKB3LdgEtapctWBgeqVD7d95+jvJQtm64ZwNCgXbznHFfZXvxCsw3ztPA8Ly8r
	 6r/OtZ0gO5HKA==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 10:04:58 +0200
Message-Id: <DB7DACSKLCI6.1YONOEGQZ08T7@kernel.org>
Cc: <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com>
 <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_hArv5MA7H4RYRj1FHUaaFF9+2QAuo03xhUKGQ-YZ8uFg@mail.gmail.com>
In-Reply-To: <CAPZ3m_hArv5MA7H4RYRj1FHUaaFF9+2QAuo03xhUKGQ-YZ8uFg@mail.gmail.com>

On Wed Jul 9, 2025 at 12:24 AM CEST, Marcelo Moreira wrote:
> Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.org=
> escreveu:
>> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
>> >  pub struct RevocableGuard<'a, T> {
>> >      // This can't use the `&'a T` type because references that appear=
 in function arguments must
>> >      // not become dangling during the execution of the function, whic=
h can happen if the
>> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>> >      type Target =3D T;
>> >
>> >      fn deref(&self) -> &Self::Target {
>> > -        // SAFETY: By the type invariants, we hold the rcu read-side =
lock, so the object is
>> > -        // guaranteed to remain valid.
>> > +        // SAFETY: `self.data_ref` is valid for writes because of `Se=
lf`'s type invariants,
>> > +        // and `_rcu_guard` ensures the data's accessibility for the =
lifetime of this guard.
>>
>> This also needs to be adjusted.
>
> oh, of course, &T is an immutable reference, mb.
>
> What about:
> // SAFETY: `self.data_ref` is valid because of `Self`'s type invariants
> // and the active RCU read-side lock held via `_rcu_guard`, ensuring
> the data's accessibility.

Sounds good.

---
Cheers,
Benno
