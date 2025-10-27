Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7576230F526
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594023; cv=none; b=Bkg5QJHfVafZDK4XTt18dPlwXe7vL3L6t8njlgITvHQ6bOosqKUFTDt/UbcvB6VeVxuz+ml/j9Sr0F3yOMU77XpHm1GqeKWynfO7CjXGqnoRSID0KwKbHZC+tEJXo+rLwLF4pnJXUdULKCvvkIdhGuYUELQ1HQ6OpUCXNpPKV48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594023; c=relaxed/simple;
	bh=LBVMDVCrP2gD2L6aDDMW4YplNQQg6wbF1zUk45nqBYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oF14wibsZq8hqnLnPGD8Ttkd+T9OBv7+4431S5KOT5bkJj+KNcshFCN6EVrL4dP+yYXlKtBAyJ40MPsj1K5HASHZrlVM4HERC+sNwoOe27ot9a/4twKsMQ0EHcBgxETWh4gR41XVYoF1KiJRcnh8aIgb6vM1FBKm3XV7mVPKMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FANvynyH; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FANvynyH"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EC541583
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 19:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ywl2iOHxFtNF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 19:40:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F65141571
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F65141571
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FANvynyH
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F65141571
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 19:40:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D68F740B18;
	Mon, 27 Oct 2025 19:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B92FC4CEF1;
	Mon, 27 Oct 2025 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761594019;
	bh=LBVMDVCrP2gD2L6aDDMW4YplNQQg6wbF1zUk45nqBYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FANvynyHudqCahbTJmZRNDh5L5Vz8iiW7AquNMQVLjjSWtjVcxEe9k6u5izHUbI94
	 R7M5T34cIHryksdf4qTCwOy+DC93mzch2n3TU1ZAU0B1baGH4y1PSjhos9FH0u2/V2
	 hg11mzaMg0ne1XCwOk1kDN7ifLAiXfxtDTvgwISDkV4pmgJ9mYigobLSM+huR/piCN
	 O28LnQxb1A6QRxDrNEeYaG6FI0+U3CEsd4cIS6ebISZexYIW71ZhTphn8WsoJJaGrQ
	 v2+GnVg6YNMMb0ZS0wBlK0ABtMTrIQ0TdrK8qqSiNHZX5AHy82AHH91ItSp2xHaXBm
	 ABCX0EJu6hQwQ==
Date: Mon, 27 Oct 2025 14:40:18 -0500
From: Rob Herring <robh@kernel.org>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] dt_bindings: sound: ti,pcm186x: convert to dtschema
Message-ID: <20251027194018.GA1466990-robh@kernel.org>
References: <20251026-dtbs-v2-1-cd3b713a288e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-dtbs-v2-1-cd3b713a288e@gmail.com>

On Sun, Oct 26, 2025 at 10:56:16PM +0530, Ranganath V N wrote:
> convert the Texas Instruments PCM186x Universal audio ADC bindings to DT schema.
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> ---
> Convert the Texas Instruments PCM186x audio ADC bindings to DT schema.
> ---
> Changes in v2:
> - Fixes as per the reviews suggested for the v1.
> - Link to v1: https://lore.kernel.org/r/20251021-dtbs-v1-1-493c1aa253bc@gmail.com

Still fails to apply I guess due to the unicode control char.

> ---
>  .../devicetree/bindings/sound/pcm186x.txt          | 42 ---------------
>  .../devicetree/bindings/sound/ti,pcm186x.yaml      | 61 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 42 deletions(-)
