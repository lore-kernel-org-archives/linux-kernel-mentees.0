Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048DB2E11DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924261; cv=none; b=D3sCzo9evTlqbD2wQrdHlaMuO3t4hQdcrEGWDgoGYylsdH38j300wvpAYe8pPrIeZ1DZSesQ9OLX2gXVx9ZnQBNkGXiCbrZNHyfZ76+WBT/cSPZ0qLgOneV8rLgw1H6++cAWpEc9rsv1OxM3zFsDEsLBK9J5DNHbXiMGtJatais=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924261; c=relaxed/simple;
	bh=paCr9jJp4TaiGOIWi/QG5OQXAQOLHrkgrmLe1DChE4Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NK28Selb+Nnaw8rKxe/and5YG38yLZlTQ9JslhGRudN8lkrgT1D16tADwF72Y6vn5Nlpl+34rGJyEWVk1aNIYLSH/mk9cOvpOxYKPzdiFJkBLYZNJiczge+JVdf9yoaxgn7rWb5fHekXuf7d7ZJ4ATBASChaisrYkuk8M2dIkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faiEWBMe; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faiEWBMe"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37808107F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 18:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2lJutEmAZf2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Jun 2025 18:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lossin@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BD2B81066
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BD2B81066
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=faiEWBMe
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD2B81066
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Jun 2025 18:04:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55B0443DBE;
	Sat, 14 Jun 2025 18:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972C0C4CEEB;
	Sat, 14 Jun 2025 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749924258;
	bh=paCr9jJp4TaiGOIWi/QG5OQXAQOLHrkgrmLe1DChE4Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=faiEWBMe98yjZXEu9di2IK71GxH+mr36NZL7bxHfxjI4Ca4+vom+9dMmsJY9s7ovE
	 xRlQaubSyB5Lx0WWWhOTZrrYKftHnxSiApxD7InEXxsPK6o7WpgiEwBiPQa9S/6zuI
	 EEjt/Ou8RePsFe/GYQkdyfUYB4jZvQpkY/qQ0m96P0cEFYlXdQQ8X49nxY0lPcJM1D
	 ciByTZKPhFhJguDBonb/hfIbLW9Kj7oB0B69nfPceyazJz+Hgh2Ml/vC+/pPpIq7C9
	 VLVjoHhvsBgtyzcYCyXAaTZQpJRKLPpzbHJQkqQO0+LMbjZvXpNdRD8X3OzTsVvxRr
	 I3p5kyzKSdRWw==
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 20:04:15 +0200
Message-Id: <DAMGDKQJ59K0.3NWUH9UM4UZ70@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
 <aEqdur4JTFa1V20U@google.com> <DAKGNYQ6M24H.1KVXZASA4V00C@kernel.org>
 <CAPZ3m_gmeaQYu2oA5uz=zhnXUV+pyrnQvjootxKGos-_hWEATQ@mail.gmail.com>
In-Reply-To: <CAPZ3m_gmeaQYu2oA5uz=zhnXUV+pyrnQvjootxKGos-_hWEATQ@mail.gmail.com>

On Thu Jun 12, 2025 at 8:52 PM CEST, Marcelo Moreira wrote:
> Just one thing, I wanted to ask for your opinion on another change in
> the patch, specifically in the `try_access` function. I refactored the
> logic of an `if/else` block to use
> `self.try_access_with_guard(&guard).map(|data|
> RevocableGuard::new(data, guard))`.

I don't think it compiles, since `try_access_with_guard` borrows the
guard and thus you can't give it to `RevocableGuard::new`.

---
Cheers,
Benno
