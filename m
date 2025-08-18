Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66E283FC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533129; cv=none; b=tO9jpEipLp4hnI/2km2W3CO/x8stORIh408nK+B6Y+zqKfImQkh5kqaT4UaZWGhOLYKRY691zQEItbsUp/09+EzarPBuBzuwynrR7zvPRbWeS57oUupjNVC5mYt/M1FolLLnaMCqaglaGSYtwROMiyT/JyIVQg1rNVbh/CoDRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533129; c=relaxed/simple;
	bh=5mamOuwuN2q0c1HpCm7iCluXnDCuzCY0FW8G1fkNs8I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jBoLt5BZwKZGdChWSiOtB8MMfmQF3NUU7lZOQMRbLcPKzgCj82i6VHBkZ3wfbPDtpsuNNUcZ1wUycG2mLQUp9R95ZBiA1fKhP+CH6TMp4W1m0exlCD4P3sf23dPxJO/MVydFCAlyI1uOv20FbzEi/U7aqxz5cTP0egK2GbQ6StU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jTDbiiow; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jTDbiiow"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A45806A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6C3eKvArVrHX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 16:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFA9A806BC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFA9A806BC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=jTDbiiow
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BFA9A806BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 16:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB7A640AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755533126; bh=wk/rXX1AoG7L4arFu7XcJ27vQ+aO9yrhpMlrzmUyPdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jTDbiiowfIAA2xOD4uU5CeBeWqMnV7BuSLi6XqnYorLlyf5ORDCLrbvz6iIbWtys6
	 Noh5+xeaOO2cxsWtOhIap65y9wTXy4pShJCTyw5m2xgpdFoJeWvysyXTV9ng0v96W0
	 aRROIASopbyNyUnJUySksoJgTlPCW9Z03yPxAR+jznpiM9Z8asZnw2xnGvdb3EZolm
	 BwCnva1idG2KoKtDV2UzTXApepaytbFj+Drf+stuCkUGuJ55fGkDLtPQk1EY3iqm/t
	 XKtxXnBhOmfeLjYPJNrj9MZVwF85xNd4Bhut++3rAhnoTRcKm9s/+2ZAawPpQ9jvGD
	 9XvvK8kNdszjQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AB7A640AB4;
	Mon, 18 Aug 2025 16:05:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, tglx@linutronix.de,
 bp@alien8.de, peterz@infradead.org, jpoimboe@kernel.org,
 pawan.kumar.gupta@linux.intel.com, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, "Nikola Z. Ivanov"
 <zlatistiv@gmail.com>
Subject: Re: [PATCH] docs: Replace dead links to spectre side channel white
 papers
In-Reply-To: <20250816190028.55573-1-zlatistiv@gmail.com>
References: <20250816190028.55573-1-zlatistiv@gmail.com>
Date: Mon, 18 Aug 2025 10:05:25 -0600
Message-ID: <875xekaa4a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Nikola Z. Ivanov" <zlatistiv@gmail.com> writes:

> The papers are published by Intel, AMD and MIPS.
>
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
> The MIPS blog post is nowhere to be found on mips.com,
> instead a link is placed to the last time the web archive
> has crawled it.
>
>  Documentation/admin-guide/hw-vuln/spectre.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I sure wish I understood why companies feel such a need to break links
so often ... I've applied this, thanks.

jon
