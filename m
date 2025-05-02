Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E15265CC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 May 2025 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171243; cv=none; b=MSIUAZYAbDIufi2cW0ZQPDNkQR3CFk/Um0/0VdcyADititWXW6ELuxq+2W+toxNKFYocH4Qai75yK6WTcDFdm2jmFqeDYRcQFYSAQZHjRxEdlEhXpjHbwmtSSomynT8R9hKQqdmjO0QOluCTOGeLuuTYalItEXa8asZkw2w1isM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171243; c=relaxed/simple;
	bh=oSKMefOd+BrHXkzfyeuDXivys6DxfqimZTBUiw6lth4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NC1GguSV1V/HjaN29D/MPD2Zk9lF9A4uxvLBKx2LrkpExxhEOy/3vRz4d0zF1uR5KXs5YLvwp4odMlDTrlAErH6Z6afcaas8/v2c4TgJQLN+LjEwI1xdhwEH6ifEtDGAV74bZK5oCkCcrCNYUPF9+QJlBNM7t72i6fPI+yKbYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvVZ8trY; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvVZ8trY"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034A641754
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 May 2025 07:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IV_WXPfbb951 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 May 2025 07:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 316A141752
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316A141752
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GvVZ8trY
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 316A141752
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 May 2025 07:33:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E8C15C563F;
	Fri,  2 May 2025 07:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA99CC4CEE4;
	Fri,  2 May 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746171238;
	bh=oSKMefOd+BrHXkzfyeuDXivys6DxfqimZTBUiw6lth4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GvVZ8trY23bN+tj6qQOiZTx8bFVBE4gyuIB5M1m2QpBPcu7YXC4tJBVmgQzYlZqbr
	 SqG2MsNlL3URWhgeAWnU4RWeXBQCaSYF7+YfbVrmFdkcb6y8cG4MlLJTNxVuQJY0Iy
	 h2jv6y4AE2Ff9zFzmjYYNw+Q4aP644iyRWNPYKZOB2FtuDuN9JOXm7VV4XeqTdSPK4
	 SYMRvmQnk6eNpS64tTjOreL8C/kykMgwgoCH2gEIV+FHM9vy8hB1MlM+dHozpE4gtd
	 G/4cKV/ZjHm6qm5vC59UDX+067hmQ7dUqv4j283Jmtl4lVgQfLbNSeDApsM1K6stTF
	 sG00TuF3BL7DQ==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 09:33:54 +0200
Message-Id: <D9LI1ISOHMV1.2721CU6HG3SRV@kernel.org>
Cc: <benno.lossin@proton.me>, <ojeda@kernel.org>, <aliceryhl@google.com>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH] rust: revocable: clarify invariants in safety
 documentation
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Marcelo Moreira"
 <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250501005726.744027-1-marcelomoreira1905@gmail.com>
 <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com>
In-Reply-To: <CANiq72ncOnDVHCNScjT7Y5+-kXzGvtcia=LpS0h-MfBqBMuOWA@mail.gmail.com>

On Thu May 1, 2025 at 12:18 PM CEST, Miguel Ojeda wrote:
> On Thu, May 1, 2025 at 2:57=E2=80=AFAM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
>>
>> This is part of issue #1160 ("correct safety comments and documentation
>> in revocable.rs"), reported by Miguel Ojeda and Benno Lossin.
>>
>> Reported-by: Miguel Ojeda <ojeda@kernel.org>
>> Closes: https://github.com/Rust-for-Linux/linux/issues/1160
>
> I think it was just Benno. :)
>
>> Tested-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>
> Normally one is supposed to test a patch before submitting it, i.e. it
> is implicit.
>
>> +/// # Invariants
>
> We also place `// INVARIANT: ...` comments in the places that need to
> ensure the type invariants hold, e.g. in constructors.
>
> Given the issue, I think Benno may have also wanted that you then
> refer to the type invariants to justify some of the comments, e.g. in
> the "Since `self.is_available` is true, ..." ones.

Indeed, we also need the comments that establish/make use of the
invariant. For example in the `try_access_with_guard` function.

There also is a missing invariant on `RevocableGuard` that the
`data_ref` pointer is valid.

>> +/// - Access to `data` must occur only while holding the RCU read-side =
lock (e.g., vi
>
> The "must occur" wording seems a bit strange for a type invariant, but
> maybe Benno had something in mind here?

Yeah, I don't think that using RCU is even a hard requirement. One could
also call `revoke_nosync`, since one knows the revocable is only used by
a single kernel thread. I also don't think that it's needed for memory
correctness, but I could be wrong there.

The most important invariant is that `data` is valid while
`is_available` is true. That's what's needed by the different functions
accessing it.

---
Cheers,
Benno
