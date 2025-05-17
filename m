Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EF76026
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747469994; cv=none; b=ABKroMLAOl1uRvGOEPJr4vUoUyRpTOE8QyNRtnMA29V3NkidGw5k+6zIWGrEkC84Ec+BWvD4JP9MkYZJYFrAb8gg5mhtNpY+rfg6dgGRfxI362huceYFY27lT2UeK7BDrwjlNUcIlfCyAIxs0VFOP4OphnSyZSzm2GhpoRPNeBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747469994; c=relaxed/simple;
	bh=HNhjqb3B+YnZ4LQ044u/uALsTb3Y+KKT2bNbLEBA3uc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Vh+hjYbIYNTVK3Ibh9c0U8KzhwvpNQ9NYkWAqJ+OAAs3kVP4ADVWsetAlLREvsKnIJvcxSp6CMOZt0qjadXeIgTmm8JTqtFJxXPmhDLLE9A3cVg+v5GLgD2on2/g0WtchZbyHG35ORho0109Bh02BvRvVpfCXcwiUD22V6DylY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZgsgvwR; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZgsgvwR"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9389560799
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 08:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzaZCebPg4G5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 May 2025 08:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 171C560702
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 171C560702
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AZgsgvwR
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 171C560702
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 17 May 2025 08:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7882C437FD;
	Sat, 17 May 2025 08:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AEBC4CEE3;
	Sat, 17 May 2025 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747469991;
	bh=HNhjqb3B+YnZ4LQ044u/uALsTb3Y+KKT2bNbLEBA3uc=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=AZgsgvwRVg3TKOucIw5qfIckLgjFwwutSXQdls9NDSB702hGQ+lPwm5K1GXrq0n1C
	 BbtRW88M/snwujAI0cXOAg8P9M8i8qDIONGg0pCirJKoLv21p9H237UZgcxUxpxNMy
	 VKY6othJ32tRVArsEJ8oZjy7pjWubCxWCl7pEA/wSvyZLrn94dfoSPmG7vMEVCfP3c
	 50jRew6HSMztX7+Qoy2ZDougSD98fiSb5YB+rFddn3Mwqdp0vpZ6Xii5ZJUc/+sspR
	 25cw4VPUyRDssAUfnvYnHjUx/Ollvf51awOvYpKXVJpe/cTSeSGzalQJdX7pjZkgWp
	 smaJd76ujY/og==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 10:19:48 +0200
Message-Id: <D9YAEU2T6RU6.34B2NQ8T8NZW1@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
Cc: <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Danilo Krummrich"
 <dakr@kernel.org>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
 <CAPZ3m_hZ0uNgwpRefMOuu7x7q011VVzfntMRV5D68wdcrjnLAw@mail.gmail.com>
In-Reply-To: <CAPZ3m_hZ0uNgwpRefMOuu7x7q011VVzfntMRV5D68wdcrjnLAw@mail.gmail.com>

On Sat May 17, 2025 at 2:03 AM CEST, Marcelo Moreira wrote:
> Hello guys!
>
> Thank you for the continued feedback =3D)
>
> Based on your point, I'm revising the `# Invariants` section for `Revocab=
le<T>`
> to be more precise about when access to `data` is valid. I'm
> considering the following wording:
>
> - data is valid if and only if is_available is true.
> - Access to data is valid while the RCU read-side lock is held, ensuring =
no
> concurrent revocation, or within the specific scope of the
> revoke_internal function
> where the revocation logic guarantees exclusive access before dropping da=
ta.

How about we combine these two into:

* `data` is valid for reads if the RCU read-side lock is held and
  `is_available` was true after taking the lock.

>  - Once is_available is set to false, further access to data outside
> of the revocation
> process is disallowed, and the object is dropped either after an RCU
> grace period
> (in [revoke]), or immediately (in [revoke_nosync]).

I wouldn't name the functions, since there might be more added. How
about:
* `is_available` is only set to `false` once; that thread takes
  ownership of `data`.

Let's also see what Danilo thinks.

---
Cheers,
Benno

> I've attempted to clarify that the RCU read-side lock protects against
> concurrent
> revocation during normal access, but that `revoke_internal` has its own s=
afety
> guarantees that allow access without the lock in that specific context. I
> 'd appreciate your feedback on this revised wording to ensure it accurate=
ly
> reflects the intended behavior and safety invariants.
>
> Thank you for your patience and guidance. I will send the next version
> of the patch soon.
>
> Best regards,
> Marcelo Moreira
