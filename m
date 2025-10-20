Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87162D1F44
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 17:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980028; cv=none; b=MbkYGwj0hCcIYfZ/DpYONpVFfls9spdmuEpCXnoLjgPlx4onJLVgTollubDMGGadicvzKJcjkk7VyPURmPv5rQk18kBuKCksa2RfWh34a1NEO2kZN9NWq2mTm47LU7hw8EQ9lC7b7F30s2fSlVDOlr9AhPzqZTsudHebcJY1mc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980028; c=relaxed/simple;
	bh=BXD39jZJVxX6AUbacgFfEyVJoekOr0uUFJadFIRRQsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HazBVq3yQD+xlznilStLJPc8Zw1eEiQdgbT/ntQfjQO4clDuby3DQTgyCzSHDRyfJVhQn+WXGnqG7KVZeS0mvNl0gBHeaWsv5NfsvCtrRkNltT9CCQ1dciGWnqeOosr5E5A6SMxb8E/8zEkecVwi2JmfyWIzyl9OfNAvG07LLXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roq0Ke4m; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roq0Ke4m"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48A796154E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 17:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdFH_GsqqlDx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 17:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 614EB61521
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614EB61521
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=roq0Ke4m
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 614EB61521
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 17:07:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 757C1602AC;
	Mon, 20 Oct 2025 17:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0647C4CEF9;
	Mon, 20 Oct 2025 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980023;
	bh=BXD39jZJVxX6AUbacgFfEyVJoekOr0uUFJadFIRRQsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roq0Ke4mM4GKd+i9w+UN/JjXEtPMQEbIrgWZhOB0UCeKMt0pE+tQmRiDOITM7UvF/
	 X2gIwc+wvR+Y3Uyt+ISl/frmA+XaDSktQswOAZuX0VcazAq53ZIkzcjPBHb6ovQqec
	 qk82+2WhDnCOGgajWTvYuX05Aci+pehtiSO9WJJAVjWE9xu+3i4f6OYE9gV/b+78NZ
	 NYjsVEsNcFapmYAZZ1/KiVXC1ptrL7xd0u6tIPJa/UcBUlF2ICCQKnZe/7O2FRk/SL
	 paTl2/dqMrlFo0vr5qBPWTLaDHoU4xoCbk/l+f/tjpt2SunBvZzMBo8qaAcZ+aqwdn
	 utxmIrDX52i8g==
Date: Mon, 20 Oct 2025 12:07:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Erick Setubal Bacurau <erick.setubal@gmx.de>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, s.hauer@pengutronix.de,
	david.hunter.linux@gmail.com, devicetree@vger.kernel.org,
	mchehab@kernel.org, festevam@gmail.com,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	skhan@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: fix redundant quotes on fsl,imx6q-vdoa.yaml
Message-ID: <176098001750.936573.6366914023282858347.robh@kernel.org>
References: <20251020121145.190020-1-erick.setubal@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020121145.190020-1-erick.setubal@gmx.de>


On Mon, 20 Oct 2025 14:11:45 +0200, Erick Setubal Bacurau wrote:
> Fix a dt-schema error: `fsl,imx6q-vdoa.yaml:19:12: [error] string value is
> redundantly quoted with any quotes (quoted-strings)`
> 
> Signed-off-by: Erick Setubal Bacurau <erick.setubal@gmx.de>
> ---
>  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

