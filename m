Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9D2D0C85
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531095; cv=none; b=WjHVeWFu3PJksUuAANZJq5Kan6oZqPxJWM7oPOtVkgIWEFheBYs4zgKwlD+dAMIP1io36InrVY5He38AsxvwzwA1HHu9B4JEjUFjyXvyHgGwwNMVv4HtwGA1vvy2FUjU699LLT+PZ/Rs2ZzZ7stYTV1eqHWZeswttilal4Tykv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531095; c=relaxed/simple;
	bh=2g1z9Lo+89gJyejgACQ+2xNbf+MhUSX6mK1HfGuQ5K0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=g6EDXzHDr1qTKDdTu1DBUP9bojuDrzV/ZJ++sQQhIvZcX/qLCzlxp2egQnXoRWlNsNM6Zl9rpuwwVyl2pAGPXRncWBL4MUfh5z8CzPSabMCUjEysqe8PD7aQyBHNJaZscforG0zFtRw5LD07EOC1YgsrUW71a6H2OW0IEf0ThUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4F5rdDx; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4F5rdDx"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80CAF40129
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 08:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Skrvq7xPNtf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jul 2025 08:24:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA46E400B0
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA46E400B0
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C4F5rdDx
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EA46E400B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Jul 2025 08:24:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF14AA53725;
	Thu,  3 Jul 2025 08:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D73C4CEE3;
	Thu,  3 Jul 2025 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751531091;
	bh=2g1z9Lo+89gJyejgACQ+2xNbf+MhUSX6mK1HfGuQ5K0=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=C4F5rdDxmdPdW71ZgIPdlkQ8VXK5Vh8uxRpFu/cu7EFBHzyWPUfhR2pbLhfd4KVDe
	 aJ6eTXirOZBTCeFJSmm8h9NOGEBxZEnTJIN5+pQvnB8Y5a48z+Pf+aJF/cxHDep/kF
	 fdmkkQ8ZwkMMIJkihFMWZamzblmj0TO2qOOJvlkMkRLbHA1kdaygz/jcSq6R4WB7e8
	 LBofvjai4Rw0sOrxGflW1RqPaoInmy0rgMyNuISnZpXvZax+1qgh+b4XZC3i4T8Txt
	 dMtxB75suheIUbY9H1ytsvNqrH9AsLEdwylHbp5EjunuC9RrTtlL13EMxGMDAgx/nA
	 +nHLI1AuKy29A==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 10:24:47 +0200
Message-Id: <DB29Y9LUF90V.90X56SDRG8LN@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v5 1/2] rust: revocable: Refactor revocation mechanism
 to remove generic revoke_internal
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <20250626165927.66498-2-marcelomoreira1905@gmail.com>
In-Reply-To: <20250626165927.66498-2-marcelomoreira1905@gmail.com>

On Thu Jun 26, 2025 at 6:59 PM CEST, Marcelo Moreira wrote:
> The revocation mechanism is refactored by removing the generic
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

With the patch order changed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheer,
Benno

> ---
>  rust/kernel/revocable.rs | 48 ++++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
