Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A280146588
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739460010; cv=none; b=qLA3m/pwl8BqlXFA58vcz7/pamLYvxChzhT2OWTMMPWrYjIkauVO309sDv+QAzzwb5Tnz+vn1mIg3EglFq2tpFsb6nhIlXYXRSGAQXOEB5f383Nfj4E9PINNYPbTg7IUq4MJNzvIvALnQ21+WG5/VqzaGai0ptx2X5Q7dVorevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739460010; c=relaxed/simple;
	bh=3g1MOaAvKve880aLvbMyDxo2vIWYuSsRN9efKJg2+SI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=F3dooz/7GSEUeSRazR5F6mzgh/OoFjvTkpzJI+f/2MalEROrosLDEiUeJHY1RsCkpjXSCTk/np/2RKNlKO/Wpi398SN2SxZoRKF3/eghzsbKm7C/Evt17FcsEzv29lj2dzeVYXiWAUWlaMVzSmHbSO17SANgu+kJY3Hum4tiKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bq/uwLjT; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq/uwLjT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9076861B31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 15:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xiR7RUxBUcCE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2025 15:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D94F61B2C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D94F61B2C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bq/uwLjT
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3D94F61B2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 15:20:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C52E5C5038;
	Thu, 13 Feb 2025 15:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF157C4CED1;
	Thu, 13 Feb 2025 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739460005;
	bh=3g1MOaAvKve880aLvbMyDxo2vIWYuSsRN9efKJg2+SI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Bq/uwLjTi+gRgwcdR8q/LzfpKCZZgNTNa9lCufa0LdbNvjtCJMk/DHkZfxpz7d62G
	 xbM2ubTbuH3YzqxJHGUqGPq7c8X1PeAHIKlryceO8hs9l4oQTJIq+EZzxcyyRkDwcY
	 nDQ02rh73v7hqd+QSZpl+gkBv9UVxD9QV7X/b6f2mGTEgfo3R1TZSOF7eKMHc8zGEO
	 QZFvC3woY5KyezWWOzKHmcios2nJvwcAfSgASyDoLg337kYxH6PqPCX/QiPHxPa281
	 dKif8ZrKiT/bKuMFpgzjtGPYZsQvqtbM2M1LyLoQrfaMszEEVPdgo7yynm/og9X9bV
	 E6B9K8v/AlILA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34719380CEEF;
	Thu, 13 Feb 2025 15:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] Documentation: dpaa2 ethernet switch driver: Fix
 spelling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173946003499.1263852.7850021844003173151.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 15:20:34 +0000
References: <20250212021311.13257-1-ritvikfoss@gmail.com>
In-Reply-To: <20250212021311.13257-1-ritvikfoss@gmail.com>
To: None <ritvikfoss@gmail.com>
Cc: ioana.ciornei@nxp.com, netdev@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Feb 2025 02:13:11 +0000 you wrote:
> From: Ritvik Gupta <ritvikfoss@gmail.com>
> 
> Corrected spelling mistake
> 
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  .../device_drivers/ethernet/freescale/dpaa2/switch-driver.rst   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] Documentation: dpaa2 ethernet switch driver: Fix spelling
    https://git.kernel.org/netdev/net-next/c/c3a97ccaed80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


