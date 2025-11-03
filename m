Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE842FF64E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166208; cv=none; b=eWF5gljFd3XFrI+8OMqDosaMH8pWn/HQmBwLSFI+gAoVOWi9bnxsRbvkv64d9iTSf1nnY5cw4tpp3wOKuBGlfqdbosHpsY4Q3Vf1fGu1DdGsRTyvK48Mp+fxAdsxFUdsDvZj5kDPGw1KSxpyc/KL9d1YgoZpbhruyVe/JhKNmpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166208; c=relaxed/simple;
	bh=qhlXsQ2w2cGtqN4BTIN6PGYrAkWRGsh3TNb7IYqvoec=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=fE4WDFeaYe+WyJwAuHwG2I5WkgBNomfZPD3qaa7XQhp7fUjTSSqi4w2PBYxwlEj+Xw9CLq+ctHm/mMDJ76pqEYJ96RwIumEptnTFDXP4r4LYFUtgb/NPNY1LDJKUp1Qn7qxYqgEvE0iM3XDViyXHv9Rj6xda52/cZxk7jTfecA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+EcNvUE; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+EcNvUE"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B8C84AE9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 10:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33m9a8mLEn3S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Nov 2025 10:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7FA084AD9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FA084AD9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+EcNvUE
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E7FA084AD9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 10:36:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAAC34196E;
	Mon,  3 Nov 2025 10:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2885EC4CEF8;
	Mon,  3 Nov 2025 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762166203;
	bh=qhlXsQ2w2cGtqN4BTIN6PGYrAkWRGsh3TNb7IYqvoec=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=J+EcNvUEAilS8iBCPPM0BYn40WgpgpEnfep+ezM0Z0u7EDnPE+wL9w99s3DLYe9cv
	 0xg7QQs3zWketLMxaKHinu9fZUSItLPKDaxPdMLhriWrkNjjom4vGfeEMwQPWRvdVB
	 CLcgNovtieeKxotAvPP0IDo5WRkxiY0Mgjt11gYfLmLR/rHqTmkd4pSsNDXVzOOmvO
	 sl6hVATvjojI0UCDIDGO88mWaUO6jufVzhKUgITGfEQec2E+y/tzfDtp+b0HWu8Qqt
	 Y3WiBtW+C6oZCGMtNbWz5s1kd1HK0OW/Aa3aUfxBzB037CtEcE56jHR1ukCFvnUoid
	 5SvIh5mlBXAjQ==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 11:36:40 +0100
Message-Id: <DDYZS8Q0IMHW.2THERFUD075JJ@kernel.org>
Subject: Re: [PATCH v8 3/3] rust: revocable: Documents RevocableGuard
 invariants/safety and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.21.0
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
 <20250726183552.23098-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250726183552.23098-4-marcelomoreira1905@gmail.com>

On Sat Jul 26, 2025 at 8:35 PM CEST, Marcelo Moreira wrote:
> Refinements include:
> - `RevocableGuard`'s invariants are updated to precisely state that
>   `data_ref` is valid as long as the RCU read-side lock is held.
> - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
>   requiring callers to guarantee the validity of the raw pointer and
>   RCU read-side lock lifetime.
> - The `SAFETY` comment in `Revocable::try_access` is refined for
>   clarity, now explicitly stating how `Self`'s type invariants
>   and the RCU read-side lock together ensure data validity for reads.
> - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
>   is refined.
>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

Sorry for the long wait, I've been very busy (and continue to be). Let's
finish this series :)

Reviewed-by: Benno Lossin <lossin@kernel.org>

@Danilo: did revocable change substantively in the meantime? If yes, we
might need to revisit the invariants...

Cheers,
Benno

> ---
>  rust/kernel/revocable.rs | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
