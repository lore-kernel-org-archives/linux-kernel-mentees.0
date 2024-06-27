Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDC524D6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Jun 2024 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473145; cv=none; b=XiDjnMAmH9OV4Sz+JWLIqsKif9RXV9vXiuvZstilZxGOC5sBR8sQBiFNHGfoifnmN7dKKsD7cKlcDPzCNomv+eoC4lhNeOLa/R41sjN+yco6bLADYr8Sm3fjjWGKtW9DQImpPH0t+J0zI8G7x3aC3sjuFppYNmPUOiTkr0FXjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473145; c=relaxed/simple;
	bh=6fyTLJ2HziCr4ZgDtapcWHnP1N8zwoxz7J4y52+smGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ab7p0AHWDxoqGPNz/nzK9YgcBiV96J/uk+WGbTSSXZFAKJ8G6qMRrPmprBVM43P60YFogNhK+7LhltkYD2Of5wspmwDmSU/ncaFhLQ0p5PELPGrtYtqSkKGKqcsuiiwOdukAiwJB2iubpSYyI9528lBStUksF1EJ9ACGmmBNdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDWa8y05; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDWa8y05"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1807560BAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Jun 2024 07:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fU9EL5StU0on for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jun 2024 07:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bentiss@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F2AB60B2B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F2AB60B2B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NDWa8y05
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2F2AB60B2B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 27 Jun 2024 07:25:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC3EA60C3A;
	Thu, 27 Jun 2024 07:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F379BC2BBFC;
	Thu, 27 Jun 2024 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719473141;
	bh=6fyTLJ2HziCr4ZgDtapcWHnP1N8zwoxz7J4y52+smGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NDWa8y05gx3m+z7P7IcAgrbm347pYwZrvRmbNw2NQRihWiLSmDwqLtlDyEHpSCHbT
	 Nz0Mctosop3utEoU4XF9eIKD5FTSqQOTy7H+PVpIpDvL4Z5dWIVj4DLjXMP+Wulg8l
	 G4WuZ0HGHrU/FF/qEtOnbxS9SDpagPD24MbCxNFb4F8C88EKQk09EFMc3FMay9u0M9
	 oY88TESGKktp2Wmm1r2OJUHTQZufu0I/mSGRMifchgKH9SmGEYvEe8YiFNCZsk4daq
	 h3Y0+q+KNumlYVUgWz0F3X4/9wnYf0uVJ3dwhPpBZ8O7LRboCGFsWmzB4ZsztCTw6n
	 GJ21yzJlB8aUw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: skhan@linuxfoundation.org, ricardo@marliere.net, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240625105553.50830-1-luis.hernandez093@gmail.com>
References: <20240625105553.50830-1-luis.hernandez093@gmail.com>
Subject: Re: [PATCH RESEND] hid: bpf: Fix grammar
Message-Id: <171947313973.11413.11930898416850500936.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 09:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Tue, 25 Jun 2024 06:55:51 -0400, Luis Felipe Hernandez wrote:
> * spelling fix: XBox -> Xbox, lowercase 'b' as per Microsoft branding
> * rephrase: paddle -> paddles, the controller itself has more than one paddle
> * rephrase: replace usage of "those" in favor of explicitly making reference
>   to the paddles
> * grammatical fix: report -> reports, use present tense verb.
> * spelling fix: interpret
> * consistency: capitalize the first word in bullet points
> 
> [...]

Applied to hid/hid.git (for-6.11/bpf), thanks!

[1/1] hid: bpf: Fix grammar
      https://git.kernel.org/hid/hid/c/9e16bada9299

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>

