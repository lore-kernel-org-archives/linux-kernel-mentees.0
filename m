Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC128CF41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  5 Sep 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063783; cv=none; b=Pm+0gLSURCdsPWkenrbScgCUTzDJeYuzkLImVbCE6JxQzNGhmFXkY61rALksPULk8ohE0ZMvGRHG93mVbOe1lpDoMaqv3PcYSWh+MbKXw3UMuQX9i+OU9ktLCBuQIE32LIyND45uHgy2vPPavPr8Ve7oaDro5QDo2nRDlhNPIdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063783; c=relaxed/simple;
	bh=T5HJJYUKQJ9hO7AMse5j6cs8VcPegOThWM/YU5kdugY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H5PpbDmt9mmhuLIthhhnFU4EJZTgyhyhWyMOlXd7T/wMYRBcEzOdBR83bp7+hCpln/FLGA56Tz4Zgv5+jeX7neH9wPiJ64Dure2dKHSjBzDfISBSx8v7SfmTp/9y5pu1HkaL/cmlf7LBjRKj/GYOrGkjWHwdOyGbhy7xvZyKfkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azFKGk2X; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azFKGk2X"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B85B60BE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  5 Sep 2025 09:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adG1S4Ch3uMl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Sep 2025 09:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=cem@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB0BD60AF9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB0BD60AF9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=azFKGk2X
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB0BD60AF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  5 Sep 2025 09:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D75E26027B;
	Fri,  5 Sep 2025 09:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606E4C4CEF1;
	Fri,  5 Sep 2025 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757063778;
	bh=T5HJJYUKQJ9hO7AMse5j6cs8VcPegOThWM/YU5kdugY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=azFKGk2XclM3SuFP1j+Bp9SiMWrQeHF5cZHsG0OXoIZtgbVsajk3mzq6YjIvO8pTl
	 AkkpeUYHTiRnBenDQhRywb953uUdupgngWQur8LOK9tQNlGyC4ofywvfTl79PG/j6u
	 rS7XCuVjU6OfpIXozrEeXHeOiRAkP+f7PPwNnReJObwS6dcEwEFBJH1nysmsEqOTap
	 5NZxQOAZijYY15qJt9vgkN+CIxINqAEeN48+f9PmPIO39q4P59Fa/IZK+XrdZaMjst
	 VuUtvVEjjaDrt9KSVHbRDls0MFHSue9etSgHcmK/sHiMuSQ1OZXDi2DXReysD/Zwu7
	 lFF4IVFsXK6fg==
From: Carlos Maiolino <cem@kernel.org>
To: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 Marcelo Moreira <marcelomoreira1905@gmail.com>
In-Reply-To: <20250827221830.23032-1-marcelomoreira1905@gmail.com>
References: <20250827221830.23032-1-marcelomoreira1905@gmail.com>
Subject: Re: [PATCH v3] xfs: Replace strncpy with memcpy
Message-Id: <175706377702.443134.17306614735589034340.b4-ty@kernel.org>
Date: Fri, 05 Sep 2025 11:16:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 27 Aug 2025 19:17:07 -0300, Marcelo Moreira wrote:
> The changes modernizes the code by aligning it with current kernel best
> practices. It improves code clarity and consistency, as strncpy is deprecated
> as explained in Documentation/process/deprecated.rst. This change does
> not alter the functionality or introduce any behavioral changes.
> 
> 

Applied to for-next, thanks!

[1/1] xfs: Replace strncpy with memcpy
      commit: 33ddc796ecbd50cd6211aa9e9eddbf4567038b49

Best regards,
-- 
Carlos Maiolino <cem@kernel.org>

