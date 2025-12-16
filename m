Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2476322B64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Dec 2025 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904376; cv=none; b=eeDu4G++v/XaJH9vs8CHtXr2hwGPXQR6yx+msygID3RT4j2wlHSr9kZFOLLCC0I94jdX5mJEwImQYRPIxAcFAqTHOs9WGsg6Q+iO0Lcrcnb7EY01H4N5tsHzB6qN2f9ogttY0S9LtidWIjXTuOrJx/viOqqC/JY/OG9w8HYuU6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904376; c=relaxed/simple;
	bh=u2xpFD/jCgWb8wPDV9D7Rh3i1CiZMtxI89nFvq3Au5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sig5CKpo15hdad0nuHNeM78UAfwF8YlwHP95BYqskjwann3ZqvdwS51nsNQ6FN9/0arE2ApNsPa3f2NdGWsIsetYpcpyOUDaVFSBywU5tfi2rAH1iNhQpzMk9hmuQfgr4QKt7Ojz9toQMrrBzyKfR3r9QXP6ARMCxQKgKcBIrcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd0D1hOV; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd0D1hOV"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83A93402E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Dec 2025 16:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKl3FQbxkbNm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Dec 2025 16:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E41BC40283
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41BC40283
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bd0D1hOV
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E41BC40283
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Dec 2025 16:59:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 293FE4445E;
	Tue, 16 Dec 2025 16:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A77EC4CEF1;
	Tue, 16 Dec 2025 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904374;
	bh=u2xpFD/jCgWb8wPDV9D7Rh3i1CiZMtxI89nFvq3Au5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bd0D1hOVHBTjH9OBc1gFFBOPAhERgJS7o3lS/N6/6k3/FHneq0WFlbfVUJNB3fnSh
	 LfO7TlRcQxMHuhkRLJquV5SYzm7RcueRNZTpSzmDKHSwjtyb6PXs2eEyzHQSPGCWtc
	 LV6xy0jLOQ91Vb4QP8XP5M5IEDjuXQNar5V44byp7ddf+nFiLMFJgp5U28xjRN/b1x
	 ci/wVV58jYoQ5xwncjv4P4Rhz52VaJMsYgJt/IzF1wBC8GAOIiC3YrbZmeKWnZqnSl
	 uZqtdmw5fsWspa4pOYdg2MZovz5OyqLGfctA0s238y/wAQ6rvOkRDpZ55rpUwoSox6
	 WEQmYXUtoDDaw==
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, khalid@kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 david.hunter.linux@gmail.com
In-Reply-To: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
References: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Subject: Re: [PATCH] docs: dmaengine: add explanation for phys field in
 dma_async_tx_descriptor structure
Message-Id: <176590437126.430148.14439468580856849330.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:29:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 13 Nov 2025 12:19:37 +0530, Bhanu Seshu Kumar Valluri wrote:
> Describe the need to initialize the phys field in the dma_async_tx_descriptor
> structure during its initialization.
> 
> 

Applied, thanks!

[1/1] docs: dmaengine: add explanation for phys field in dma_async_tx_descriptor structure
      commit: 08be54a9e56f9523b50d1923a94a48ef5890c0bc

Best regards,
-- 
~Vinod


