Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1080B3208
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058142; cv=none; b=kvZxSZ4PxXoNxiM4KdwJDkvhSy8DYTBLhH2IRVugcO402YW7LJ0h4QpTW3H4ntJZQ6RpuuYkJYs8JdgYH5BJjGoVB/cVzoQkOxq/FsWmsCc+GSsNoNx4LB2U/NxqbwQrF6OUPZHZ2e8R9Gcpi2t7uTN7/LlgNj0Vw6EXKJDlr8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058142; c=relaxed/simple;
	bh=XlzTWIS75+l6at5NogEHyv+JNSYzRylm5Id0QSKt+SU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=aczBG+zY0Bpo7BGzKt3nAXJiaBVwqoAownCgfPfMcWhd/y/Zi0XUpj1mKtDvcMV3QR1sy99qiQi1L9+wejosFI4fPP4Y4V5OOS42JbJiS37FxOyzaQRZxFIoa3LMTSlG4T8cFdqKDHOni9KSKSgV0Net2AQZR8A/yUDinUZMLXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AW7HlJ/N; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AW7HlJ/N"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FAE44008D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 07:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grknHwMkyv_9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Jun 2025 07:15:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07AD740082
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07AD740082
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AW7HlJ/N
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 07AD740082
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 07:15:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CBCC44344;
	Mon, 16 Jun 2025 07:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA76DC4CEEA;
	Mon, 16 Jun 2025 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750058139;
	bh=XlzTWIS75+l6at5NogEHyv+JNSYzRylm5Id0QSKt+SU=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=AW7HlJ/N3qiq9GztNMbDo91FZgXjT/H6OPUosNp/DFUKLCxZijj+NMU9/m2tif3jW
	 uIcCewr6keHB2+caq3WrU2ndlJMpwXVe2VYiLB6e8/kCin+iKVXT66wmH3+o+AN4e1
	 xFRgfivOBLO9g2rsdxmf90GOgoqBubGjoi08K3UFy/DOlhetZy9w8EhhwZ0rtCb3IU
	 g4QUHldjF+JYFaB35E7HTUZtogxI2DZlX4gs4/ruWTjc3EkS1SKbjSF7dcGhT819qt
	 FHdUisgASxTzBsBwirfEME+tWzovaWbodmzyUwFpW+X/jvRjwzgboVSfV2/+l2FwMi
	 BZIP5ZENE8i+A==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Jun 2025 09:15:36 +0200
Message-Id: <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: <dakr@kernel.org>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com>
 <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
 <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
In-Reply-To: <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>

On Mon Jun 16, 2025 at 2:36 AM CEST, Marcelo Moreira wrote:
> Em dom., 15 de jun. de 2025 =C3=A0s 05:38, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> escreveu:
>>
>> On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
>> <marcelomoreira1905@gmail.com> wrote:
>> >
>> > what about:
>> >
>> > // SAFETY: `self.data` is valid for writes because of `Self`'s type in=
variants.
>> > // The `&mut Self` context guarantees exclusive access, meaning no oth=
er
>> > // thread can concurrently access `data`.
>> > //
>> > // - `drop_in_place` is valid to call because `drop` is only called on=
ce.
>> > unsafe { drop_in_place(p.data.get()) };
>> >
>> > I'm not sure if the line break in the comment is okay...
>>
>> Benno likely meant to use bullet points for each one, rather than a
>> bullet point after a paragraph.
>>
>> If you do e.g.
>>
>>     git grep -A5 '// SAFETY:$' -- rust/kernel
>>
>> you will find examples of that.
>
> Cool! Thanks for the command Miguel =3DD it helped a lot.
>
> I'm ready to send like this:
>
> // SAFETY:
> // - `self.data` is valid for writes because of `Self`'s type invariants.
> // - The `&mut Self` context guarantees exclusive access, meaning no othe=
r
> //    thread can concurrently access `data`.
       ^ spurious space here,

This argument is actually an extension of the previous one.

> // - `drop_in_place` is valid to call because `drop` is only called once.

This phrasing feels a bit weird to me, but I can't put my finger on what
exactly...

> unsafe { drop_in_place(p.data.get()) };

How about:

// - `self.data` is valid for writes because of `Self`'s type invariants:
//   `&mut Self` guarantees exclusive access, thus no other thread can conc=
urrently access `data`.
// - this function is a drop function, thus this code is at most executed o=
nce.

---
Cheers,
Benno
