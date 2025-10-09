Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66BD2D1936
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998748; cv=none; b=RS4WeYDPx66xO4EONMOQkXIxStvWs8OOgfbyX9e7alCZ9DGO4bz0yFHbNx+Ij65oJEgapk4FIXFxXw5iMCY7nLd1+quWttP5udWmc3zO5t0WSbx+IkpxxZhkvm65mcXhBlyqGAXXmRB8cko7T1Z/iM20V9Q0dDq3f4xzfa5211I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998748; c=relaxed/simple;
	bh=CpT047vseBAHkLMTuVR4Y4+NLn53QOvWFMPmqJrJSW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHZNfqdGg0z9SsfhIQF6tKzrUSPXSXvjRtkSBx0FDWdxOg+//HEjDy9F+PRecqr4uPpD7A2TxMKQRDuvPBH2hEd1gPrHF1CUPvvVIrG/olrhP3UXDDXITF2UFskGVOuppjA3/pp2SnNH1xStkVVP1UyaQwctQovgolvooo3BFUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtVUjQvJ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtVUjQvJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CDB8610F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 08:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXPBOnHCiCcF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 08:32:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EBE660FF7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EBE660FF7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UtVUjQvJ
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EBE660FF7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 08:32:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1A9C61250;
	Thu,  9 Oct 2025 08:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACB3C4CEF7;
	Thu,  9 Oct 2025 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759998743;
	bh=CpT047vseBAHkLMTuVR4Y4+NLn53QOvWFMPmqJrJSW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtVUjQvJ8VwBB4YjHG2j2Vhn4SwfSST9s7jMtACswUNDy6+QNYppj3Lk26sueiMmn
	 1bzAQRWADFCEGtf4V8IvoiT8Ly6xSXkAj7lc00CM9/cfO1b+7B9qpq4Ep3caaD/E4q
	 bX8uUItpgOE2Q0t5JqFugou4hlv1jR3WMWWzaE4o9rIXGMtWA3/0yTacq6YzL7NED6
	 mKpCI3/qsqHi3s/9KgSrj7LX8O1FQdz6Q4yBX5Kz/rbsF4VlLLnO5Hps3ATvzcx19a
	 HB108zq+cnuCTPRyT+ndX/+C0S4alfSSmCVSorC4t56hOnxxzW7vw2jJi6gaup9zAE
	 ArPus5VBXh2yw==
Date: Thu, 9 Oct 2025 09:32:17 +0100
From: Simon Horman <horms@kernel.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
Message-ID: <20251009083217.GT3060232@horms.kernel.org>
References: <20251009053009.5427-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009053009.5427-1-bhanuseshukumar@gmail.com>

On Thu, Oct 09, 2025 at 11:00:09AM +0530, Bhanu Seshu Kumar Valluri wrote:
> The function lan78xx_write_raw_eeprom failed to properly propagate EEPROM
> write timeout errors (-ETIMEDOUT). In the timeout  fallthrough path, it first
> attempted to restore the pin configuration for LED outputs and then
> returned only the status of that restore operation, discarding the
> original timeout error saved in ret.
> 
> As a result, callers could mistakenly treat EEPROM write operation as
> successful even though the EEPROM write had actually timed out with no
> or partial data write.
> 
> To fix this, handle errors in restoring the LED pin configuration separately.
> If the restore succeeds, return any prior EEPROM write timeout error saved
> in ret to the caller.
> 
> Suggested-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Fixes: 8b1b2ca83b20 ("net: usb: lan78xx: Improve error handling in EEPROM and OTP operations")
> cc: stable@vger.kernel.org
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Note:
>  The patch is compiled and tested using EVB-LAN7800LC.
>  The patch was suggested by Oleksij Rempel while reviewing a fix to a bug
>  found by syzbot earlier.
>  The review mail chain where this fix was suggested is given below.
>  https://lore.kernel.org/all/aNzojoXK-m1Tn6Lc@pengutronix.de/
> 
>  ChangeLog:
>  v1->v2:
>   Added cc:stable tag as asked during v1 review.
>   V1 Link : https://lore.kernel.org/all/20251004040722.82882-1-bhanuseshukumar@gmail.com/

Thanks,

This patch seems consistent with the discussion at the link under Note.
I believe it addresses the review of v1.
And that the Fixes tag corresponds to the commit that introduced this problem.

Reviewed-by: Simon Horman <horms@kernel.org>
